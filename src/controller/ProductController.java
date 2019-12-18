package controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.BrandDAO;
import dao.ProductDAO;
import model.Brand;
import model.Phone;

@Controller
public class ProductController {
	@RequestMapping(value="product-single")
	public String showProductSingle(ModelMap model, @RequestParam("phoneID") long id) {
		try {
			Phone phone = ProductDAO.getPhoneByID(id);
			Brand brand = BrandDAO.getBrandByID(phone.getBrandId());
			List<String> images = Arrays.asList(phone.getImage().split(";"));
			List<Phone> relatedPhones = ProductDAO.getRelatedPhone(phone.getPhoneID(), phone.getBrandId());	
			model.addAttribute("phone", phone);
			model.addAttribute("brandName", brand.getName());
			model.addAttribute("images", images);
			model.addAttribute("relatedPhones", relatedPhones);
			return "product-single";
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "";
	}
}
