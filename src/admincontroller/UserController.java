package admincontroller;

import java.io.IOException;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import dao.BrandDAO;
import dao.UserDAO;
import model.User;

@Controller
@RequestMapping("/admin/")
public class UserController {

	public final static int usersPerPage = 10;
	
	@RequestMapping("user-management")
	public String showUserUI(ModelMap model, HttpServletRequest request) {
		try {
			if(request.getSession(false) == null || request.getSession(false).getAttribute("id")==null) {
				return "redirect:/admin/login.htm";
			}
			int id = (int)request.getSession(false).getAttribute("id");
			if(id==-1)
				return "redirect:/admin/login.htm";
			ArrayList<User> users = UserDAO.getUsers(0, usersPerPage + 1);
			int nextPage = 0;
			if(users.size() == usersPerPage + 1) {
				nextPage = 1;
				users.remove(usersPerPage);
			}
			model.addAttribute("userList", users);
			model.addAttribute("brands", BrandDAO.getAllBrands());
			model.addAttribute("curPage", 0);
			model.addAttribute("nextPage", nextPage);
			model.addAttribute("offset", 0);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return "admin/user-management";
	}
	
	@RequestMapping(value = "user-info.htm", method = RequestMethod.POST)
	@ResponseBody
	public byte[] getUserInfo(@RequestBody String id) throws IOException, ClassNotFoundException, SQLException {
		User user = UserDAO.getUser(Integer.valueOf(id));
		System.out.println(user.getUsername());
		ObjectMapper mapper = new ObjectMapper();
		return mapper.writeValueAsBytes(user);
	}

	@RequestMapping(value = "user-update.htm", method = RequestMethod.POST)
	@ResponseBody
	public byte[] updatePhone(@RequestParam("name") String name, @RequestParam("username") String username,
			@RequestParam("password") String password, @RequestParam("role") int role,
			@RequestParam("id") String id, ModelMap model) {
		ArrayList<User> users;
		try {
			if (id.equals("")) { //add
				User user = new User();
				user.setName(name);
				user.setUsername(username);
				user.setPassword(password);
				user.setRole(role);
				UserDAO.addUser(user);
			}else { //edit
				User user = new User();
				user.setId(Integer.valueOf(id));
				user.setName(name);
				user.setUsername(username);
				user.setPassword(password);
				user.setRole(role);
				UserDAO.editUser(user);
			}
			users = UserDAO.getUsers(0, 15);
			ObjectMapper mapper1 = new ObjectMapper();
			return mapper1.writeValueAsBytes(users);	
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		} 
	}

	@RequestMapping(value = "deleteUser.htm", method = RequestMethod.POST)
	@ResponseBody
	public byte[] deletePhone(@RequestParam("ids") String ids) throws IOException, ClassNotFoundException, SQLException {
		String[] arr = ids.split("a");
		for(String id: arr) {
			UserDAO.deleteUser(Integer.valueOf(id));
		}
		ArrayList<User> users = UserDAO.getUsers(0, 15);
		ObjectMapper mapper = new ObjectMapper();
		return mapper.writeValueAsBytes(users);
	}
}
