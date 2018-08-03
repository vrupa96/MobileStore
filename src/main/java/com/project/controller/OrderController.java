package com.project.controller;

import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.MobileStoreBackEnd.dao.CartItemDAO;
import com.project.MobileStoreBackEnd.dao.OrderDetailsDAO;
import com.project.MobileStoreBackEnd.dao.ProductDAO;
import com.project.MobileStoreBackEnd.dao.SupplierDAO;
import com.project.MobileStoreBackEnd.model.CartItem;
import com.project.MobileStoreBackEnd.model.OrderDetails;
import com.project.MobileStoreBackEnd.model.Product;
import com.project.MobileStoreBackEnd.model.Supplier;

@Controller
public class OrderController {
	
	@Autowired
	ProductDAO productDAO;
	
	@Autowired
	SupplierDAO supplierDAO;
	
	@Autowired
	CartItemDAO cartItemDAO;
	
	@Autowired
	OrderDetailsDAO orderDetailsDAO;
	
	public Map<Integer, String> getProductName(List<CartItem> cartList) {
		Map<Integer, String> productMap = new LinkedHashMap<Integer, String>();
		for (CartItem cartItem : cartList) {
			productMap.put(cartItem.getProductId(), productDAO.getProduct(cartItem.getProductId()).getProductName());
		}
		return productMap;
	}
	
	private double calculateGrandTotal(List<CartItem> listCartItems) {
		double grandTotal = 0;
		double total = 0;
		for(CartItem cart:listCartItems) {
			total = total + cart.getSubTotal();
		}
		double ship = (total/100) * 0.5;
		grandTotal = total + ship;
		return grandTotal;
	}
	
	@RequestMapping("/confirmOrder")
	public String confirOrder(Model m) {
		
		OrderDetails orderDetails = new OrderDetails();
		m.addAttribute("order", orderDetails);
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String username = auth.getName();
		List<CartItem> listCart = cartItemDAO.listCartItems(username);
		m.addAttribute("listCart", listCart);
		m.addAttribute("product", this.getProductName(listCart));
		m.addAttribute("grandTotal", this.calculateGrandTotal(listCart));
		
		return "confirmOrder";
	}
	@RequestMapping("/thankYou")
	public String addOrderDetails(@RequestParam("shipAddr") String shipAddr, 
			@RequestParam("billAddr") String billAddr, 
			@RequestParam("toggle")String transType, @ModelAttribute("model") OrderDetails orderDetails, Model m) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String username = auth.getName();
		List<CartItem> listCart = cartItemDAO.listCartItems(username);
		orderDetails.setCartId(listCart.get(0).getCartId());
		orderDetails.setTransactionType(transType);
		orderDetails.setBillingAddress(billAddr);
		orderDetails.setShippingAddress(shipAddr);
		orderDetails.setUsername(username);
		orderDetails.setTotalAmount(this.calculateGrandTotal(listCart));
		orderDetails.setOrderDate(new Date());
		orderDetails.setOrderStatus("Order Placed");
		
		int orderID = orderDetailsDAO.addOrder(orderDetails);
		
		for (CartItem cartItem : listCart) {
			cartItem.setPaymentStatus("P");
			cartItemDAO.updateCartItem(cartItem);
			Product product = productDAO.getProduct(cartItem.getProductId());
			if (product.getStock() > 0) 
				product.setStock(product.getStock() - cartItem.getQuantity());
			else 
				product.setStock(0);
			productDAO.updateProduct(product);
		}
		
		Map<String,String> productSupplierMap = new LinkedHashMap<String,String>();
		
		for (CartItem cartItem : listCart) {
			int productID = cartItem.getProductId();
			Product product = productDAO.getProduct(productID);
			Supplier supplier = supplierDAO.getSupplier(product.getSupplierID());
			productSupplierMap.put(product.getProductName(), supplier.getSupplierName());
		}
		
		m.addAttribute("shippingAddress", orderDetails.getShippingAddress());
		m.addAttribute("orderID", orderID);
		m.addAttribute("productSupplierMap", productSupplierMap);
		m.addAttribute("username", username);
		
		return "thankYou";
	}
	@RequestMapping("/viewOrders")
	public String viewOrders(Model m) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String username = auth.getName();
		List<OrderDetails> orderList = orderDetailsDAO.orderList(username);
		m.addAttribute("orderList", orderList);
		return "viewOrders"; 
	}
}
