package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.PreparedStatement;
import model.Blog;
import model.Phone;

public class BlogDAO {
	public static ArrayList<Blog> getListBlogFromTo(int firstResult, int maxResult) throws ClassNotFoundException, SQLException {
		String sql = "Select * from Blog limit ?,?";
		PreparedStatement ps = DBConnection.getConnect().prepareStatement(sql);
		ps.setInt(1, firstResult);
		ps.setInt(2, maxResult);
		ResultSet rs = ps.executeQuery();
		ArrayList<Blog> list = new ArrayList<>();
		while (rs.next()) {
			Blog blog = new Blog();
			blog.setId(rs.getInt("id"));
			blog.setTitle(rs.getString("title"));
			blog.setImage(rs.getString("img"));
			blog.setIntro(rs.getString("intro"));
			blog.setPostedAt(rs.getTimestamp("posted_at"));
			blog.setAuthor(rs.getString("author"));
			list.add(blog);
		}
		return list;
		}
	
	public static Blog getBlog(int id) throws ClassNotFoundException, SQLException {
		String sql = "Select * from blog where id = ?";
		PreparedStatement ps = DBConnection.getConnect().prepareStatement(sql);
		ps.setInt(1, id);
		ResultSet rs = ps.executeQuery();
		
		if(rs.next()) {
			Blog blog = new Blog();
			blog.setId(rs.getInt("id"));
			blog.setTitle(rs.getString("title"));
			blog.setIntro(rs.getString("intro"));
			blog.setContent(rs.getString("content"));
			blog.setPostedAt(rs.getTimestamp("posted_at"));
			blog.setAuthor(rs.getString("author"));
			blog.setImage(rs.getString("img"));
			return blog;
		}
		return null;
	}
	
	public static boolean updateBlogInfo(Blog blog) throws SQLException, ClassNotFoundException {
		String sql = "update blog set title = ?, author = ?, intro = ?, "
				+ "content = ?, posted_at = ?, img = ? where id = ?";
		PreparedStatement ps = DBConnection.getConnect().prepareStatement(sql);
		ps.setString(1, blog.getTitle());
		ps.setString(2, blog.getAuthor());
		ps.setString(3, blog.getIntro());
		ps.setString(4, blog.getContent());
		ps.setTimestamp(5, blog.getPostedAt());
		ps.setString(6, blog.getImage());
		ps.setInt(7, blog.getId());
		int result = ps.executeUpdate();
		if(result > 0)
			return true;
		return false;
		
	}
	
	public static boolean insertBlog(Blog blog) throws ClassNotFoundException, SQLException {
		String sql = "insert into blog(title, author, intro, content, posted_at, img) value(?, ?, ?, ?, ?, ?)";
		PreparedStatement ps = DBConnection.getConnect().prepareStatement(sql);
		ps.setString(1, blog.getTitle());
		ps.setString(2, blog.getAuthor());
		ps.setString(3, blog.getIntro());
		ps.setString(4, blog.getContent());
		ps.setTimestamp(5, blog.getPostedAt());
		ps.setString(6, blog.getImage());
		int result = ps.executeUpdate();
		if(result > 0)
			return true;
		return false;
	}
	
	public static boolean deleteBlogById(int id) throws ClassNotFoundException, SQLException {
		String sql = "delete from blog where id = ?";
		PreparedStatement ps = DBConnection.getConnect().prepareStatement(sql);
		ps.setInt(1, id);
		int result = ps.executeUpdate();
		if(result > 0)
			return true;
		return false;
	}
}
