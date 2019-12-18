package controller;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import dao.BlogDAO;
import model.Blog;

@Controller
public class BlogController {
	private final int NUM_BLOG_PER_PAGE = 6;
	
	@RequestMapping("list-blog")
	public String showListBlogs(ModelMap model) throws ClassNotFoundException, SQLException {
		ArrayList<Blog> list = BlogDAO.getListBlogFromTo(0, NUM_BLOG_PER_PAGE);
		model.addAttribute("listBlog", list);
		return "blog-list";
	}
	
	@RequestMapping("blog")
	public String showBlogSingle(ModelMap model, @RequestParam int id) throws ClassNotFoundException, SQLException {
		Blog blog = BlogDAO.getBlog(id);
		model.addAttribute("blog", blog);
		return "blog-single";
	}
	
	@RequestMapping(value="load-more-blogs")
	@ResponseBody
	public byte[] loadMoreBlogs(@RequestParam int page) throws ClassNotFoundException, SQLException, JsonProcessingException, UnsupportedEncodingException {	
		ArrayList<Blog> list = BlogDAO.getListBlogFromTo(NUM_BLOG_PER_PAGE*page, NUM_BLOG_PER_PAGE);
		ObjectMapper obj = new ObjectMapper();
		return obj.writeValueAsBytes(list);
	}
	
}
