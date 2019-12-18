package controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dao.BillDAO;
import model.Bill;
import model.BillDetail;
import model.Cart;
import model.Item;

@Controller
@RequestMapping("checkout")
public class CheckoutController {
	@RequestMapping()
	public String showUI(ModelMap model) {
		model.addAttribute("message", "");
		return "checkout";
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public String saveBill(HttpServletRequest request) throws ClassNotFoundException, SQLException {
		String full_name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		Long total = cart.total();
		Bill bill = new Bill(full_name, email, phone, address, total);
		BillDAO.insertBill(bill);
		for(Item i:cart.getCartItems()) {
			BillDetail billDetail = new BillDetail(i.getPhone().getPhoneID(), i.getQuantity(), i.getPhone().getPrice());
			BillDAO.insertBillDetail(billDetail);
		}
		cart.deleteAllItems();
		session.setAttribute("cart", cart);
		String message = "Checkout Success";
		session.setAttribute("message", message);
		return "checkout";
	}
}
