package com.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.MobileStoreBackEnd.dao.SupplierDAO;
import com.project.MobileStoreBackEnd.model.Supplier;


@Controller
public class SupplierController {
	
	@Autowired
	SupplierDAO supplierDAO;
	
	@RequestMapping("/Supplier")
	public String showSupplier(Model m) {
		List<Supplier> listSuppliers = supplierDAO.listSuppliers();
		m.addAttribute("listSuppliers", listSuppliers);
		
		return "Supplier";
	}

	@RequestMapping(value ="/InsertSupplier", method = RequestMethod.POST)
	public String insertSupplierData(@RequestParam("supname") String supname, 
			@RequestParam("supinfo") String supinfo, @RequestParam("supcont") String supcont, Model m) {
		Supplier supplier = new Supplier();
		supplier.setSupplierName(supname);
		supplier.setSupplierInfo(supinfo);
		supplier.setSupplierContactNo(supcont);
		
		supplierDAO.addSupplier(supplier);
		
		List<Supplier> listSuppliers = supplierDAO.listSuppliers();
		m.addAttribute("listSuppliers", listSuppliers);
		
		return "Supplier";
	}
	@RequestMapping("/UpdateSupplier/{supplierID}")
	public String updateSupplier(@PathVariable("supplierID") int supplierID, Model m) {
		Supplier supplier = supplierDAO.getSupplier(supplierID);
		m.addAttribute("supplierInfo", supplier);
		List<Supplier> listSuppliers = supplierDAO.listSuppliers();
		m.addAttribute("listSuppliers", listSuppliers);
		return "UpdateSupplier";
	}
	
	@RequestMapping(value="/UpdateSupplier", method = RequestMethod.POST)
	public String updateSupplierinDB(@RequestParam("supid") int supid, @RequestParam("supname") String supname, 
			@RequestParam("supinfo") String supinfo, @RequestParam("supcont") String supcont, Model m) {
		
		Supplier supplier = supplierDAO.getSupplier(supid);
		supplier.setSupplierName(supname);
		supplier.setSupplierInfo(supinfo);
		supplier.setSupplierContactNo(supcont);
		
		supplierDAO.updateSupplier(supplier);
		
		List<Supplier> listSuppliers = supplierDAO.listSuppliers();
		m.addAttribute("listSuppliers", listSuppliers);
		return "Supplier";
	}
	
	@RequestMapping("/DeleteSupplier/{supplierID}")
	public String deleteSupplier(@PathVariable("supplierID")int supplierID, Model m) {
		
		Supplier supplier = supplierDAO.getSupplier(supplierID);
		m.addAttribute("supplierDel", supplier);
		List<Supplier> listSuppliers = supplierDAO.listSuppliers();
		m.addAttribute("listSuppliers", listSuppliers);
		return "DeleteSupplier";
	}
	
	@RequestMapping(value = "/DeleteSupplier", method = RequestMethod.POST)
	public String deleteSupplierinDB(@RequestParam("supid") int supid, Model m) {
		Supplier supplier = supplierDAO.getSupplier(supid);
		supplierDAO.deleteSupplier(supplier);
		List<Supplier> listSuppliers = supplierDAO.listSuppliers();
		m.addAttribute("listSuppliers", listSuppliers);
		return "Supplier";
	}
}
