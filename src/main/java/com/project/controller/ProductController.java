package com.project.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.nio.Buffer;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.project.MobileStoreBackEnd.dao.CartItemDAO;
import com.project.MobileStoreBackEnd.dao.CategoryDAO;
import com.project.MobileStoreBackEnd.dao.ProductDAO;
import com.project.MobileStoreBackEnd.dao.SupplierDAO;
import com.project.MobileStoreBackEnd.model.CartItem;
import com.project.MobileStoreBackEnd.model.Category;
import com.project.MobileStoreBackEnd.model.Product;
import com.project.MobileStoreBackEnd.model.Supplier;


@Controller
public class ProductController {
	
	@Autowired 
	SupplierDAO supplierDAO;
	
	@Autowired
	CategoryDAO categoryDAO;
	
	@Autowired
	ProductDAO productDAO;
	
	@Autowired
	CartItemDAO cartItemDAO;
	
	@RequestMapping("/Product")
	public String showProductpage(Model m) {
		
		List<Product> listProducts = productDAO.listProducts();
		m.addAttribute("listProducts", listProducts);
		
		List<Category> listCategories = categoryDAO.listCategories();
		m.addAttribute("listCategories", listCategories);
		
		List<Supplier> listSuppliers =  supplierDAO.listSuppliers();
		m.addAttribute("listSuppliers", listSuppliers);
		
		for (Product product : listProducts) {
			System.out.println("*********" +product.getProductName() + "  ");
		}
		return "Product";
	}
	
	@RequestMapping(value = "/InsertProduct", method = RequestMethod.POST)
	public String insertProductData(@RequestParam("prodname") String prodname, @RequestParam("price")double price,
			@RequestParam("stock")int stock, @RequestParam("desc") String desc, 
			@RequestParam("category") int category, @RequestParam("supplier") int supplier, Model m,
			@RequestParam("pimage") MultipartFile file) {
		Product product = new Product();
		product.setProductName(prodname);
		product.setPrice(price);
		product.setStock(stock);
		product.setProductDesc(desc);
		product.setCategoryID(category);
		product.setSupplierID(supplier);
		
		productDAO.addProduct(product);
		
		
		//==> Image uploading
		String imagePath = "C:\\POJECT_WORKSPACE\\project\\MobileStoreFrontEnd\\src\\main\\webapp\\WEB-INF\\resources\\images\\";
		imagePath = imagePath + String.valueOf(product.getProductID()) + ".jpg";
		File image = new File(imagePath);
			if(!file.isEmpty()) {
				try {
					byte[] fileBuffer = file.getBytes();
					//BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(image));
					FileOutputStream fos = new FileOutputStream(image);
					BufferedOutputStream bos = new BufferedOutputStream(fos);
					bos.write(fileBuffer);
					bos.close();
					
				} catch (Exception e) {
					System.out.println("Exception arised while uploading image:  " +e);
					e.printStackTrace();
				}
			}
			else {
				System.out.println("Problem occured in file uploading");
			}
			//==> end of uploading image
			List<Product> listProducts = productDAO.listProducts();
			m.addAttribute("listProducts", listProducts);
			
			List<Category> listCategories = categoryDAO.listCategories();
			m.addAttribute("listCategories", listCategories);
			
			List<Supplier> listSuppliers =  supplierDAO.listSuppliers();
			m.addAttribute("listSuppliers", listSuppliers);
		
		return "Product";
	}
	
	@RequestMapping("/UpdateProduct/{productID}")
	public String updateProduct(@PathVariable("productID") int productID, Model m) {
		Product product = productDAO.getProduct(productID);
		List<Product> listProducts = productDAO.listProducts();
		
		List<Category> listCategories = categoryDAO.listCategories();
		m.addAttribute("listCategories", listCategories);
		
		List<Supplier> listSuppliers = supplierDAO.listSuppliers();
		m.addAttribute("listSuppliers", listSuppliers);
		
		m.addAttribute("listProducts", listProducts);
		m.addAttribute("productInfo", product);
		
		return "UpdateProduct";
	}
	
	@RequestMapping(value = "/UpdateProduct", method = RequestMethod.POST)
	public String updateProductinDB(@RequestParam("prodname") String prodname, @RequestParam("proid")int productID,
			@RequestParam("price") double price, @RequestParam("supplier") int supplier, @RequestParam("stock") int stock, 
			@RequestParam("desc") String desc, @RequestParam("category") int catid, Model m) {
		
		Product product = productDAO.getProduct(productID);
		product.setProductName(prodname);
		product.setProductDesc(desc);
		product.setPrice(price);
		product.setStock(stock);
		product.setCategoryID(catid);
		product.setSupplierID(supplier);
		
		productDAO.updateProduct(product);
		
		List<Product> listProducts = productDAO.listProducts();
		m.addAttribute("listProducts", listProducts);
		List<Category> listCategories = categoryDAO.listCategories();
		m.addAttribute("listCategories", listCategories);
		List<Supplier> listSuppliers = supplierDAO.listSuppliers();
		m.addAttribute("listSuppliers", listSuppliers);
		return "Product";
	}
	
	@RequestMapping(value = "/DeleteProduct/{productID}")
	public String deleteProduct(@PathVariable("productID") int productID, Model m) {
		
		Product product = productDAO.getProduct(productID);
		m.addAttribute("productDel", product);
		
		List<Product> listProducts = productDAO.listProducts();
		m.addAttribute("listProducts", listProducts);
		
		return "DeleteProduct";
	}
	
	@RequestMapping(value = "/DeleteProduct", method = RequestMethod.POST)
	public String deleteProductinDB(@RequestParam("prodname") String prodname, @RequestParam("proid")int productID,
	@RequestParam("price") double price, @RequestParam("suppid") int supplier, @RequestParam("stock") int stock, 
	@RequestParam("desc") String desc, @RequestParam("catid") int catid, Model m) {
		
		Product product = productDAO.getProduct(productID);
		productDAO.deleteProduct(product);
		
		String img = "C:\\POJECT_WORKSPACE\\project\\MobileStoreFrontEnd\\src\\main\\webapp\\WEB-INF\\resources\\images\\";
		img = img + String.valueOf(productID) + ".jpg";
		File file = new File(img);
		if(file.delete()) {
			System.out.println("product image deleted successfully:-----");
		}
		else {
			System.out.println("unable to delete the product image file----");
		}
		
		List<Product> listProducts = productDAO.listProducts();
		m.addAttribute("listProducts", listProducts);
		return "Product";
	}
	
	@RequestMapping(value = "/ProductDesc/{categoryID}")
	public String showProductsByCategories(@PathVariable("categoryID")int categoryID,  Model m) {
		Category category = categoryDAO.getCategory(categoryID);
		m.addAttribute("category", category);
		List<Product> products = productDAO.listProducts();
		ArrayList<Product> newProds = new ArrayList<Product>();
		for ( Product product : products) {
			if((product.getCategoryID()) == (category.getCategoryID())) {
				newProds.add(product);
			}
		}
		System.out.println("@@@"+newProds.size());
		m.addAttribute("showProducts", newProds);
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String name = auth.getName();
		List<CartItem> listCart = cartItemDAO.listCartItems(name);
		int cartSize = listCart.size();
		m.addAttribute("cartSize", cartSize);
		
		return "ProductDesc";
	}
	
	@RequestMapping(value = "/ProductPage/{productID}")
	public String viewProduct(@PathVariable("productID") int productID, Model m) {
		
		Product product = productDAO.getProduct(productID);
		m.addAttribute("viewProduct", product);
		
		Category category = categoryDAO.getCategory(product.getCategoryID());
		m.addAttribute("category", category);
		
		Supplier supplier = supplierDAO.getSupplier(product.getSupplierID());
		m.addAttribute("supplier", supplier);
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String name = auth.getName();
		List<CartItem> listCart = cartItemDAO.listCartItems(name);
		int cartSize = listCart.size();
		m.addAttribute("cartSize", cartSize);
		
		return "ProductPage";
	}
	
}
