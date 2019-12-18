package controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.ProductDAO;
import model.Cart;
import model.Item;
import model.Phone;

@Controller
public class CartController {
	private final int MAX_QUANTITY = 6;
	@RequestMapping("cart")
	public String showUI(HttpServletRequest request) {
		return "cart";
	}
	
	@RequestMapping(value = "home", params = "phoneID")
	@ResponseBody
	public String processCart(HttpServletRequest request,@RequestParam long phoneID) throws ClassNotFoundException, SQLException {
		HttpSession session = request.getSession();
		String command = request.getParameter("command");
//		Long phoneID = Long.parseLong(request.getParameter("phoneID"));
		Cart cart = (Cart) session.getAttribute("cart");
		Phone phone = ProductDAO.getPhoneByID(phoneID);
		if(cart == null) cart = new Cart();
		if (cart.getQuantity(phone) == MAX_QUANTITY)
			return "fail";
		switch(command) {
			case "plus":
				cart.insertToCart(phone, 1);
                break;
		}	
		session.setAttribute("cart", cart);
		return cart.countItem() + "";
	}
	
	
	@RequestMapping(value = "cart", params = "phoneID")
	public String deleteCart(HttpServletRequest request,@RequestParam long phoneID) throws ClassNotFoundException, SQLException {
		HttpSession session = request.getSession();
		String command = request.getParameter("command");
//		Long phoneID = Long.parseLong(request.getParameter("phoneID"));
		Cart cart = (Cart) session.getAttribute("cart");
		Phone phone = ProductDAO.getPhoneByID(phoneID);
		switch(command) {
			case "delete":
				cart.deleteItem(phone);
				return "redirect:/cart.htm";
		}
		return "";
	}
	
	
	@RequestMapping(value = "product-single", params = "command")
	@ResponseBody
	public String processCartInSingle(HttpServletRequest request,@RequestParam long phoneID, @RequestParam int quantity) throws ClassNotFoundException, SQLException {
		HttpSession session = request.getSession();
		String command = request.getParameter("command");
		Cart cart = (Cart) session.getAttribute("cart");
		Phone phone = ProductDAO.getPhoneByID(phoneID);
		if(cart == null) cart = new Cart();
		switch(command) {
			case "plus":
				if ((cart.getQuantity(phone) + quantity) > MAX_QUANTITY)
				return "fail";
				cart.insertToCart(phone, quantity);
                break;
			case "update":
				cart.updateQuantity(phone, quantity);
				return "1";
		}	
		session.setAttribute("cart", cart);
		return "";
	}
	
}
