package admincontroller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.UserDAO;
import model.User;

@Controller
@RequestMapping("/admin/")
public class LoginController {
	@RequestMapping("login")
	public String showLoginUI(ModelMap model, HttpServletRequest request) {
		request.getSession().setAttribute("id", -1);;
		model.addAttribute("account", new User());
		model.addAttribute("message", "");
		return "admin/Login";
	}
	
	@RequestMapping(value = "login", params = "message")
	public String falseLogin(ModelMap model, 
			@RequestParam("message") String message) {
		model.addAttribute("account", new User());
		model.addAttribute("message", message);
		return "admin/Login";
	}
	
	@RequestMapping(value = "authenticate")
	public String authenticate(HttpServletRequest request, HttpServletResponse response,
					ModelMap model, @ModelAttribute("account") User account) {
		try { 		
			PrintWriter out = response.getWriter(); 
			int id = UserDAO.authenticate(account);
			if(id > 0) {
				int role = UserDAO.getRoleById(id);
				if(role >= 0) {
					HttpSession session = request.getSession(true);
					session.setAttribute("id", id);
					session.setAttribute("role", role);
					return "redirect:/admin/phone-management.htm";
				}
			}
		} catch (ClassNotFoundException | SQLException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("message", "Wrong username or password");
		return "redirect:/admin/login.htm";
	}
	
	@RequestMapping("logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if(session != null) {
			session.removeAttribute("id");
			session.removeAttribute("role");
		}
		return "redirect:/admin/login.htm";
	}
}
