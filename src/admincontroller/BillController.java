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

import dao.BillDAO;
import model.Bill;
import model.BillDetail;

@Controller
@RequestMapping("/admin/")
public class BillController {
	public final static int billsPerPage = 10;

	@RequestMapping("bill-management")
	public String showBillUI(ModelMap model, HttpServletRequest request) {
		try {
			if(request.getSession(false) == null || request.getSession(false).getAttribute("id")==null) {
				return "redirect:/admin/login.htm";
			}
			int id = (int)request.getSession(false).getAttribute("id");
			if(id==-1)
				return "redirect:/admin/login.htm";
			ArrayList<Bill> bills = BillDAO.getBillsFromTo(0, billsPerPage + 1);
			int nextPage = 0;
			if (bills.size() == billsPerPage + 1) {
				nextPage = 1;
				bills.remove(billsPerPage);
			}
			model.addAttribute("billList", bills);
			model.addAttribute("curPage", 0);
			model.addAttribute("nextPage", nextPage);
			model.addAttribute("offset", 0);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return "admin/BillManagement";
	}

	@RequestMapping(value = "bill-management", params = "page")
	public String showBillUI(ModelMap model, @RequestParam("page") int page, HttpServletRequest request) {
		try {
			if(request.getSession(false) == null || request.getSession(false).getAttribute("id")==null) {
				return "redirect:/admin/login.htm";
			}
			int id = (int)request.getSession(false).getAttribute("id");
			if(id==-1)
				return "redirect:/admin/login.htm";
			ArrayList<Bill> bills = BillDAO.getBillsFromTo(page * billsPerPage, billsPerPage + 1);
			int nextPage = page;
			if (bills.size() == billsPerPage + 1) {
				bills.remove(billsPerPage);
				nextPage++;
			}
			model.addAttribute("billList", bills);
			model.addAttribute("curPage", page);
			model.addAttribute("nextPage", nextPage);
			model.addAttribute("offset", billsPerPage * page);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return "admin/BillManagement";
	}

	@RequestMapping(value = "bill-detail.htm", method = RequestMethod.POST)
	@ResponseBody
	public byte[] getBillDetail(@RequestBody String id) throws IOException, ClassNotFoundException, SQLException {
		ArrayList<BillDetail> bills = BillDAO.getAllBillDetailByBillID(id);
		ObjectMapper mapper = new ObjectMapper();
		return mapper.writeValueAsBytes(bills);
	}
	
	@RequestMapping(value = "bill-delete.htm", method = RequestMethod.POST)
	@ResponseBody
	public byte[] deleteBill(@RequestParam("ids") String ids) throws IOException, ClassNotFoundException, SQLException {
		String[] arr = ids.split("a");
		for(String id: arr) {
			BillDAO.deleteBillById(Integer.valueOf(id));
		}
		ArrayList<Bill> bills = BillDAO.getBillsFromTo(0, billsPerPage);
		ObjectMapper mapper = new ObjectMapper();
		return mapper.writeValueAsBytes(bills);

	}
}
