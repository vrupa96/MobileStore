package com.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.MobileStoreBackEnd.dao.UserDAO;
import com.project.MobileStoreBackEnd.model.User;

@Controller
public class UserController {

	@Autowired
	UserDAO userDAO;
	
	@RequestMapping(value = "/AddUser", method = RequestMethod.POST)
	public String addUserData(@RequestParam("uname") String uname, @RequestParam("mail") String mail,
			@RequestParam("pswd") String pswd, @RequestParam("phone") String phone, @RequestParam("country") String country,
			@RequestParam("state") String state, @RequestParam("city") String city, @RequestParam("pin") long pin, Model m) {
		
		User user = new User();
		user.setUserName(uname);
		user.setMailID(mail);
		user.setPassword(pswd);
		user.setPhone(phone);
		user.setCountry(country);
		user.setState(state);
		user.setCity(city);
		user.setPincode(pin);
		user.setRole("ROLE_USER");
		
		userDAO.addUser(user);
		
		m.addAttribute("user", user);
		return "login";
	}
	@RequestMapping("/login_success")
	public String userLogged(Model m) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String name = auth.getName();
		m.addAttribute("user", name);
		return "redirect:/";
	}
	
	@RequestMapping("/login_failed")
	public String userLoginFail() {
		return "errorPage";
	}
}
