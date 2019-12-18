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
import dao.ProductDAO;
import model.Phone;

@Controller
@RequestMapping("/admin/")
public class PhoneController {
	private String query;

	public final static int phonesPerPage = 15;
	
	@RequestMapping("phone-management")
	public String showPhoneUI(ModelMap model, HttpServletRequest request) {
		try {
			if(request.getSession(false) == null || request.getSession(false).getAttribute("id")==null) {
				return "redirect:/admin/login.htm";
			}
			int id = (int)request.getSession(false).getAttribute("id");
			if(id==-1)
				return "redirect:/admin/login.htm";
			ArrayList<Phone> phones = ProductDAO.getPhonesFromTo(0, phonesPerPage + 1);
			int nextPage = 0;
			if(phones.size() == phonesPerPage + 1) {
				nextPage = 1;
				phones.remove(phonesPerPage);
			}
			model.addAttribute("phoneList", phones);
			model.addAttribute("brands", BrandDAO.getAllBrands());
			model.addAttribute("curPage", 0);
			model.addAttribute("nextPage", nextPage);
			model.addAttribute("offset", 0);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return "admin/PhoneManagement";
	}
	
	@RequestMapping(value="phone-management", params= "page")
	public String showPhoneUI(ModelMap model, @RequestParam("page") int page, HttpServletRequest request) {
		try {
			if(request.getSession(false) == null || request.getSession(false).getAttribute("id")==null) {
				return "redirect:/admin/login.htm";
			}
			int id = (int)request.getSession(false).getAttribute("id");
			if(id==-1)
				return "redirect:/admin/login.htm";
			ArrayList<Phone> phones = ProductDAO.getPhonesFromTo(page * phonesPerPage, phonesPerPage + 1);
			int nextPage = page;
			if(phones.size() == phonesPerPage + 1) {
				phones.remove(phonesPerPage);
				nextPage++;
			}			
			model.addAttribute("phoneList", phones);
			model.addAttribute("brands", BrandDAO.getAllBrands());
			model.addAttribute("curPage", page);
			model.addAttribute("nextPage", nextPage);
			model.addAttribute("offset", phonesPerPage * page);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return "admin/PhoneManagement";
	}

	@RequestMapping(value = "phone-info.htm", method = RequestMethod.POST)
	@ResponseBody
	public byte[] getUserInfo(@RequestBody String id) throws IOException, ClassNotFoundException, SQLException {
		Phone phone = ProductDAO.getPhoneByID(Long.valueOf(id));
		ObjectMapper mapper = new ObjectMapper();
		return mapper.writeValueAsBytes(phone);

	}

	@RequestMapping(value = "update.htm", method = RequestMethod.POST)
	@ResponseBody
	public byte[] updatePhone(@RequestParam("name") String name, @RequestParam("screen") String screen,
			@RequestParam("os") String os, @RequestParam("frontCamera") float frontCamera,
			@RequestParam("followingCamera") float followingCamera, @RequestParam("cpu") String cpu,
			@RequestParam("ram") float ram, @RequestParam("amount") int amount,
			@RequestParam("memoryCard") String memoryCard, @RequestParam("battery") String battery,
			@RequestParam("brandID") int brandID, @RequestParam("memory") float memory,
			@RequestParam("price") int price, @RequestParam("img1") String img1, @RequestParam("img2") String img2,
			@RequestParam("img3") String img3, @RequestParam("img4") String img4,
			@RequestParam("sim") String sim, @RequestParam("id") String id, ModelMap model) {
		ArrayList<Phone> phones;
		try {
			if (id.equals("")) { //add
				Phone phone = new Phone();
				phone.setAmount(amount);
				phone.setBattery(battery);
				phone.setBrandId(brandID);
				phone.setCpu(cpu);
				phone.setFollowingCamera(followingCamera);
				phone.setFrontCamera(frontCamera);
				phone.setMemory(memory);
				phone.setMemoryCard(memoryCard);
				phone.setName(name);
				phone.setOs(os);
				phone.setPrice(price);
				phone.setRam(ram);
				phone.setScreen(screen);
				phone.setSim(sim);
				String url = "";
				if(!img1.equals("")) {
					url = img1.split(".jpg")[0].substring(img1.split(".jpg")[0].lastIndexOf('\\')+1) + ";";
				}
				if(!img2.equals("")) {
					url += img2.split(".jpg")[0].substring(img2.split(".jpg")[0].lastIndexOf('\\')+1) + ";";
				}
				if(!img3.equals("")) {
					url += img3.split(".jpg")[0].substring(img3.split(".jpg")[0].lastIndexOf('\\')+1) + ";";
				}
				if(!img4.equals("")) {
					url += img4.split(".jpg")[0].substring(img4.split(".jpg")[0].lastIndexOf('\\')+1) + ";";
				}
				phone.setImage(url);
				ProductDAO.addPhone(phone);
			}else { //edit
				Phone phone = new Phone();
				phone.setPhoneID(Long.valueOf(id));
				phone.setAmount(amount);
				phone.setBattery(battery);
				phone.setBrandId(brandID);
				phone.setCpu(cpu);
				phone.setFollowingCamera(followingCamera);
				phone.setFrontCamera(frontCamera);
				phone.setMemory(memory);
				phone.setMemoryCard(memoryCard);
				phone.setName(name);
				phone.setOs(os);
				phone.setPrice(price);
				phone.setRam(ram);
				phone.setScreen(screen);
				phone.setSim(sim); 
				
				String[] imagePath = ProductDAO.getImagePathById(Integer.valueOf(id)).split(";");
				String[] images = new String[4];
				for(int i=0; i<imagePath.length; i++)
					images[i] = imagePath[i]+";";
				if(!img1.equals("")) {
					images[0] = img1.split(".jpg")[0].substring(img1.split(".jpg")[0].lastIndexOf('\\')+1) + ";";
				}
				if(!img2.equals("")) {
					images[1] = img2.split(".jpg")[0].substring(img2.split(".jpg")[0].lastIndexOf('\\')+1) + ";";
				}
				if(!img3.equals("")) {
					images[2] = img3.split(".jpg")[0].substring(img3.split(".jpg")[0].lastIndexOf('\\')+1) + ";";
				}
				if(!img4.equals("")) {
					images[3] = img4.split(".jpg")[0].substring(img4.split(".jpg")[0].lastIndexOf('\\')+1) + ";";
				}
				
				phone.setImage(images[0] +images[1] + images[2] + images[3]);
				ProductDAO.editPhone(phone);
			}
			phones = ProductDAO.getPhonesFromTo(0, phonesPerPage);
			ObjectMapper mapper1 = new ObjectMapper();
			return mapper1.writeValueAsBytes(phones);	
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		} 
	}
	
	@RequestMapping(value = "delete.htm", method = RequestMethod.POST)
	@ResponseBody
	public byte[] deletePhone(@RequestParam("ids") String ids) throws IOException, ClassNotFoundException, SQLException {
		String[] arr = ids.split("a");
		for(String id: arr) {
			ProductDAO.deletePhoneById(Integer.valueOf(id));
		}
		ArrayList<Phone> phones = ProductDAO.getPhonesFromTo(0, phonesPerPage);
		ObjectMapper mapper = new ObjectMapper();
		return mapper.writeValueAsBytes(phones);

	}
}
