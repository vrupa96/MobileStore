package com.project.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.project.MobileStoreBackEnd.dao.CartItemDAO;
import com.project.MobileStoreBackEnd.dao.CategoryDAO;
import com.project.MobileStoreBackEnd.model.CartItem;
import com.project.MobileStoreBackEnd.model.Category;


@Controller
public class CategoryController {
	
	@Autowired
	CategoryDAO categoryDAO;
	
	@Autowired
	CartItemDAO cartItemDAO;
	
	@RequestMapping("/Category")
	public String showCategory(Model m) {
		List<Category> listCategories = categoryDAO.listCategories();
		m.addAttribute("listCategories", listCategories);
		
		for (Category category : listCategories) {
			System.out.println(category.getCategoryName() + " ");
		}

		
		return"Category";
	}
	
	@RequestMapping(value = "/InsertCategory", method = RequestMethod.POST  )
	public String insertCategoryData(@RequestParam("catname") String catname,
			@RequestParam("catdesc") String catdesc, @RequestParam("cimage") MultipartFile file, Model m) {
		
		Category category = new Category();
		category.setCategoryName(catname);
		category.setCategoryDesc(catdesc);
		
		categoryDAO.addCategory(category);
		
		//==>category image uploading
		String imagePath = "C:\\POJECT_WORKSPACE\\project\\MobileStoreFrontEnd\\src\\main\\webapp\\WEB-INF\\resources\\images\\categoryImg\\";
		imagePath = imagePath + String.valueOf(category.getCategoryID()) +".jpg";
		File image = new File(imagePath);
		if (!file.isEmpty()) {
			
			try {
				byte[] fileBuffer = file.getBytes();
				FileOutputStream fos = new FileOutputStream(image);
				BufferedOutputStream bos = new BufferedOutputStream(fos);
				bos.write(fileBuffer);
				bos.close();
				
			} catch (Exception e) {
				System.out.println("exception arised while uploading category image: " +e);
				e.printStackTrace();
			}
		} else {
			System.out.println("unable to upload category image....try again");
		}
		
		List<Category> listCategories = categoryDAO.listCategories();
		m.addAttribute("listCategories", listCategories);
		
		return "Category";
	}
	
	@RequestMapping("/UpdateCategory/{categoryID}")
	public String updateCategory(@PathVariable("categoryID") int categoryID, Model m) {
		Category category = categoryDAO.getCategory(categoryID);
		
		List<Category> listCategories = categoryDAO.listCategories();
		m.addAttribute("listCategories", listCategories);
		m.addAttribute("categoryInfo", category);
	
 		return "UpdateCategory";
	}
	
	@RequestMapping(value = "/UpdateCategory", method = RequestMethod.POST)
	public String updateCategoryinDB(@RequestParam("catid") int categoryID, 
			@RequestParam("catname") String categoryName, @RequestParam("catdesc") String categoryDesc, Model m) {
		
		
		Category category = categoryDAO.getCategory(categoryID);
		category.setCategoryName(categoryName);
		category.setCategoryDesc(categoryDesc);
		categoryDAO.updateCategory(category);
		
		List<Category> listCategories = categoryDAO.listCategories();
		m.addAttribute("listCategories", listCategories);
		
		return "Category";
	}
	
	@RequestMapping("/DeleteCategory/{categoryID}")
	public String deleteCategory(@PathVariable("categoryID") int categoryID, Model m) {
		
		Category category = categoryDAO.getCategory(categoryID);
		m.addAttribute("CategoryDel", category);
		List<Category> listCategories = categoryDAO.listCategories();
		m.addAttribute("listCategories", listCategories);
		
		return "DeleteCategory";
	}
	
	@RequestMapping(value = "/DeleteCategory", method = RequestMethod.POST)
	public String deleteCategoryinDB(@RequestParam("catid") int categoryID, Model m) {
		
		Category category = categoryDAO.getCategory(categoryID);
		categoryDAO.deleteCategory(category);
		String img = "C:\\Users\\kalik\\OneDrive\\Desktop\\workSpace\\MobileStoreFrontEnd\\src\\main\\webapp\\WEB-INF\\resources\\images\\categoryImg\\";
		img = img + String.valueOf(categoryID) + ".jpg";
		File file = new File(img);
		if(file.delete()) {
			System.out.println("category image deleted successfully:-----");
		}
		else {
			System.out.println("unable to delete the file----");
		}
		List<Category> listCategories = categoryDAO.listCategories();
		m.addAttribute("listCategories", listCategories);
		return "Category";
	}
	
	@RequestMapping("/ViewCategories")
	public String showCategoriesPage(Model m) {
		List<Category> showCategories = categoryDAO.listCategories();
		m.addAttribute("showCategories", showCategories);
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String name = auth.getName();
		List<CartItem> listCart = cartItemDAO.listCartItems(name);
		int cartSize = listCart.size();
		m.addAttribute("cartSize", cartSize);
		
		return "ViewCategories";
	}
	
}