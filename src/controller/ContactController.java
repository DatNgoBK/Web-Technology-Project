package controller;

import java.sql.SQLException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import dao.CustomerReplyDAO;
import model.CustomerReply;

@Controller
public class ContactController {
	@RequestMapping(value = "contact-us", method = RequestMethod.GET)
	public String showContact(ModelMap model) {
		model.addAttribute("reply", new CustomerReply());
		return "contact-us";
	}
	
	@RequestMapping(value = "contact-us", method = RequestMethod.POST)
	public String sendReply(ModelMap model, 
			@ModelAttribute("reply") CustomerReply reply) {
		String result = null;
		try {
			CustomerReplyDAO.insertCustomerReply(reply);
			result = "Success! Thank you for reply!";
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			result = "Failed! Please try again!";
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			result = "Failed! Please try again!";
			e.printStackTrace();
		}
		model.addAttribute("result", result);
		return "redirect:result.htm";
	}
	
	@RequestMapping(value="result")
	public String showResult(ModelMap model, @RequestParam("result") String result) {
		model.addAttribute("result", result);
		return "result";
	}
}
