package com.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.project.MobileStoreBackEnd.dao.CartItemDAO;
import com.project.MobileStoreBackEnd.dao.CategoryDAO;
import com.project.MobileStoreBackEnd.model.CartItem;
import com.project.MobileStoreBackEnd.model.Category;

@Controller
public class BaseController {
	
	@Autowired
	CategoryDAO categoryDAO;
	
	@Autowired
	CartItemDAO cartItemDAO;
	
	@RequestMapping("/")
	public String showHomePage(Model m)
	{
		List<Category> showCategories = categoryDAO.listCategories();
		m.addAttribute("Categories", showCategories);
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String name = auth.getName();
		List<CartItem> listCart = cartItemDAO.listCartItems(name);
		int cartSize = listCart.size();
		m.addAttribute("cartSize", cartSize);
		
		return "index";
	}
	
	@RequestMapping("/login")
	public String showLogin()
	{
		return "login";
	}
	
	@RequestMapping("/aboutUs")
	public String showAboutUs()
	{
		return "aboutUs";
	}
	
	@RequestMapping("/register")
	public String showRegister()
	{
		return "register";
	}
	
	
}
