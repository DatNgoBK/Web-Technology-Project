package admincontroller;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import dao.BlogDAO;
import model.Blog;

@Controller
@RequestMapping("/admin/")
public class BlogManagementController {
	public final static int blogPerPage = 15;
	
	@RequestMapping("blog-management")
	public String showBlogInfo(ModelMap model, HttpServletRequest request) {
		try {
			if(request.getSession(false) == null || request.getSession(false).getAttribute("id")==null) {
				return "redirect:/admin/login.htm";
			}
			int id = (int)request.getSession(false).getAttribute("id");
			if(id==-1)
				return "redirect:/admin/login.htm";
			ArrayList<Blog> blogList = BlogDAO.getListBlogFromTo(0, blogPerPage + 1);
			int nextPage = 0;
			if(blogList.size() == blogPerPage + 1) {
				nextPage = 1;
				blogList.remove(blogPerPage);
			}
			model.addAttribute("blogList", blogList);
			model.addAttribute("curPage", 0);
			model.addAttribute("nextPage", nextPage);
			model.addAttribute("offset", 0);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "admin/BlogManagement";
	}
	
	@RequestMapping(value = "blog-info.htm", method = RequestMethod.POST)
	@ResponseBody
	public byte[] getBlogInfo(@RequestBody String id){		
		try {
			Blog blog = BlogDAO.getBlog(Integer.valueOf(id));
			ObjectMapper mapper = new ObjectMapper();
			return mapper.writeValueAsBytes(blog);
		} catch (JsonProcessingException | NumberFormatException | ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	@RequestMapping(value = "updateBlog.htm", method = RequestMethod.POST)
	@ResponseBody
	public byte[] updateBlog(@RequestParam("id") String id,
							 @RequestParam("title") String title,
							 @RequestParam("author") String author,
							 @RequestParam("intro") String intro,
							 @RequestParam("postedAt") String posted,
							 @RequestParam("image") String image,
							 @RequestParam("content") String content,
							 @RequestParam("curPage") int curPage) {
		Blog blog = new Blog();
		if(!id.equals(""))
			blog.setId(Integer.valueOf(id));
		blog.setTitle(title);
		blog.setAuthor(author);
		blog.setIntro(intro);
		blog.setPostedAt(Timestamp.valueOf(posted.replace("T", " ")));
		blog.setImage(image);
		blog.setContent(content);
		try {
			boolean flag = false;
			if(id.equals(""))
				flag = BlogDAO.insertBlog(blog);
			else
				flag = BlogDAO.updateBlogInfo(blog);
			ArrayList<Blog> list = null;
			if(flag)
				list = BlogDAO.getListBlogFromTo(curPage * blogPerPage, blogPerPage);
			
			ObjectMapper mapper = new ObjectMapper();
			return mapper.writeValueAsBytes(list);
		} catch (ClassNotFoundException | SQLException | JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	@RequestMapping(value = "deleteBlog.htm", method = RequestMethod.POST)
	@ResponseBody
	public byte[] deleteBlog(@RequestParam("ids") String ids,
							 @RequestParam("curPage") int curPage) {
		try {
			boolean flag = true;
			String[] arr = ids.split("a");
			for(String id: arr) {
				if(!BlogDAO.deleteBlogById(Integer.valueOf(id))) {
					flag = false;
					break;
				}
			}
			ArrayList<Blog> list = null;
			if(flag)
				list = BlogDAO.getListBlogFromTo(curPage * blogPerPage, blogPerPage);
			
			ObjectMapper mapper = new ObjectMapper();
			return mapper.writeValueAsBytes(list);
		} catch (ClassNotFoundException | SQLException | JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
