package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

import dao.BrandDAO;
import dao.ProductDAO;
import model.Cart;
import model.Item;
import model.Phone;
import model.SearchEntity;

@Controller

public class HomeController { 
	ArrayList<Phone> phones;
	private int numRemainProduct = 0;
	public final static int PRODUCT_PER_PAGE = 6; 
		
	@RequestMapping(value = "home")
	public String showUI(ModelMap model) {
		try {		
			ArrayList<Phone> list = ProductDAO.getPhones(0, PRODUCT_PER_PAGE + 1);
			int nextPage = 0;
			if(list.size() == PRODUCT_PER_PAGE + 1) {
				list.remove(PRODUCT_PER_PAGE);
				nextPage++;
			}
			model.addAttribute("listProduct", list);
			model.addAttribute("nameList", BaseController.ToJSArray(ProductDAO.getAllPhoneNames()));
			model.addAttribute("brands", BrandDAO.getAllBrands());
			model.addAttribute("currentPage", 0);
			model.addAttribute("nextPage", nextPage);
			return "product-list";
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "product-list";
		}
	}
//	
//	@RequestMapping(value = "home", params = "page")
//	public String showUIPage(ModelMap model, @RequestParam("page") int page) {
//		try {
//			ArrayList<Phone> list = ProductDAO.getPhones(page * productsPerPage, productsPerPage + 1);
//			int nextPage = page;
//			if(list.size() == productsPerPage + 1) {
//				list.remove(productsPerPage);
//				nextPage++;
//			}
//			model.addAttribute("listProduct", list);
//			model.addAttribute("nameList", BaseController.ToJSArray(ProductDAO.getAllPhoneNames()));
//			model.addAttribute("brands", BrandDAO.getAllBrands());
//			model.addAttribute("currentPage", page);
//			model.addAttribute("nextPage", nextPage);
//			return "product-list";
//		} catch (ClassNotFoundException | SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//			return "product-list";
//		}
//	}

	@RequestMapping("search.htm")
	public String showSearchResult(ModelMap model, @RequestParam("name") String name) {
		try {
			ArrayList<Phone> list = ProductDAO.getListPhoneByNameFromTo(0, 999, name);
			model.addAttribute("listProduct", list);
			model.addAttribute("search", name);
			model.addAttribute("quantity", list.size());
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "search-result";
	}
	
	@RequestMapping(value = "sort2.htm",  method = RequestMethod.POST)
	@ResponseBody
	public byte[] sort2(@RequestBody String sortjs) throws IOException, ClassNotFoundException, SQLException{
		
		ObjectMapper mapper = new ObjectMapper();
		SearchEntity searchEntity = mapper.readValue(sortjs, SearchEntity.class);
		
		String typeSort = "DESC", columnSort = "price";
		if(searchEntity.getTypeSort().equals("high-price"))
			typeSort = "DESC";
		else if(searchEntity.getTypeSort().equals("low-price"))
			typeSort = "ASC";
		else if(searchEntity.getTypeSort().equals("name")) {
			typeSort = "ASC";
			columnSort="name";
		} 
	    
		ArrayList<Phone> list = ProductDAO.getPhonesByPropertiesOrderBy(searchEntity.getPage()*PRODUCT_PER_PAGE, PRODUCT_PER_PAGE,
				BaseController.ToStringArray(searchEntity.getBrandID()),
				BaseController.ToStringArray(searchEntity.getPrice()),
				BaseController.ToStringArray(searchEntity.getRam()),
				BaseController.ToStringArray(searchEntity.getMemory()),
				typeSort, columnSort);
		numRemainProduct = ProductDAO.getNumberOfPhone() - list.size() - searchEntity.getPage()*PRODUCT_PER_PAGE;
		ObjectMapper mapper1 = new ObjectMapper();
		return  mapper1.writeValueAsBytes(list);				
	}
	
	@RequestMapping(value = "sort2.htm",  method = RequestMethod.GET)
	@ResponseBody
	public String countRemaindPhone(@RequestBody String sortjs) throws IOException, ClassNotFoundException, SQLException{
		return numRemainProduct + "";				
	}
	
	@RequestMapping(value = "about.htm")
	public String about(){
		return "about";				
	}
}
