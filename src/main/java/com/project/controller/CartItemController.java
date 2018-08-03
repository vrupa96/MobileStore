package com.project.controller;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.MobileStoreBackEnd.dao.CartItemDAO;
import com.project.MobileStoreBackEnd.dao.ProductDAO;
import com.project.MobileStoreBackEnd.model.CartItem;
import com.project.MobileStoreBackEnd.model.Product;

@Controller
public class CartItemController {
	@Autowired
	CartItemDAO cartItemDAO;
	@Autowired
	ProductDAO productDAO;
	

	
	public Map<Integer, String> getProductName(List<CartItem> cartList) {
		Map<Integer, String> productMap = new LinkedHashMap<Integer, String>();
		for (CartItem cartItem : cartList) {
			productMap.put(cartItem.getProductId(), productDAO.getProduct(cartItem.getProductId()).getProductName());
		}
		return productMap;
	}
	
	@RequestMapping("/viewCart")
	public String showCartPage(Model m, HttpSession session) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String username = auth.getName();
		List<CartItem> cartList = cartItemDAO.listCartItems(username);
		m.addAttribute("productDetails", this.getProductName(cartList));
		m.addAttribute("cartList", cartList);
		
		List<CartItem> listCart = cartItemDAO.listCartItems(username);
		int cartSize = listCart.size();
		m.addAttribute("cartSize", cartSize);
	
		return "viewCart";
	}
	
	@RequestMapping(value="/addToCart/{productID}", method = RequestMethod.POST)
	public String addCartItem(@PathVariable("productID")int productID,
			@RequestParam("quantity") int quantity, Model m, HttpSession session) {
		System.out.println("quantity selected: "+quantity);
		Product product = productDAO.getProduct(productID);
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String username = auth.getName();
		CartItem item = new CartItem();
		item.setUsername(username);
		item.setPaymentStatus("NP");
		item.setProductId(productID);
		item.setQuantity(quantity);
		item.setSubTotal(quantity * product.getPrice());
		cartItemDAO.addCartItem(item);
		
		List<CartItem> cartList = cartItemDAO.listCartItems(username);
		m.addAttribute("productDetails", this.getProductName(cartList));
		m.addAttribute("cartList", cartList);
		m.addAttribute("product", productDAO.getProduct(productID));
		
		List<CartItem> listCart = cartItemDAO.listCartItems(username);
		int cartSize = listCart.size();
		m.addAttribute("cartSize", cartSize);
		
		return "viewCart";
	}
	@RequestMapping("/editCart/{cartItemId}")
	public String editCartItem(@PathVariable("cartItemId") int cartItemId, Model m, @ModelAttribute("cartItem") CartItem cartItem) {
		cartItem = cartItemDAO.getCartItem(cartItemId);
		System.out.println("product ID: "+cartItem.getProductId());
		System.out.println("username: "+cartItem.getUsername());
		Product product = productDAO.getProduct(cartItem.getProductId());
		m.addAttribute("cartItem", cartItem);
		m.addAttribute("product", product);
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String username = auth.getName();
		List<CartItem> listCart = cartItemDAO.listCartItems(username);
		int cartSize = listCart.size();
		m.addAttribute("cartSize", cartSize);
		
		return "editCart";
	}
	
	@RequestMapping(value = "/updateCart", method = RequestMethod.POST)
	public String updateCartItem(@RequestParam("cartId")int cartItemId, @RequestParam("price") double price,
			@RequestParam("prodId")int productID, @RequestParam("quantity")int quantity, Model m ) {
		System.out.println("cart id: " +cartItemId +"prodID: "+productID + "quantity" +quantity +"subtotal: " + price*quantity);
		CartItem cartItem = cartItemDAO.getCartItem(cartItemId);
		cartItem.setProductId(productID);
		cartItem.setQuantity(quantity);
		cartItem.setSubTotal(quantity * price);
		cartItemDAO.updateCartItem(cartItem);
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String username = auth.getName();
		List<CartItem> cartList = cartItemDAO.listCartItems(username);
		m.addAttribute("cartList", cartList);
		m.addAttribute("product", this.getProductName(cartList));
	
		List<CartItem> listCart = cartItemDAO.listCartItems(username);
		int cartSize = listCart.size();
		m.addAttribute("cartSize", cartSize);
		return "viewCart";
	}
	
	@RequestMapping("/deleteCart/{cartItemId}")
	public String deleteCartItem(@PathVariable("cartItemId")int cartItemId, Model m) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String username = auth.getName();
		CartItem cartItem = cartItemDAO.getCartItem(cartItemId);
		cartItemDAO.deleteCartItem(cartItem);
		List<CartItem> cartList = cartItemDAO.listCartItems(username);
		m.addAttribute("product", this.getProductName(cartList));
		m.addAttribute("cartList", cartList);
		
		
		List<CartItem> listCart = cartItemDAO.listCartItems(username);
		int cartSize = listCart.size();
		m.addAttribute("cartSize", cartSize);
		return "viewCart";
	}
	
	
}
