package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.User;

public class UserDAO {
	public static int authenticate(User user) throws ClassNotFoundException, SQLException {
		String sql = "select id from user where username = ? and password = ?";
		PreparedStatement ps = DBConnection.getConnect().prepareStatement(sql);
		ps.setString(1, user.getUsername());
		ps.setString(2, user.getPassword());
		ResultSet rs = ps.executeQuery();
		if(rs.next())
			return rs.getInt("id");
		return -1;
	}
	
	public static int getRoleById(int id) throws ClassNotFoundException, SQLException {
		String sql = "select role from user where id = ?";
		PreparedStatement ps = DBConnection.getConnect().prepareStatement(sql);
		ps.setInt(1, id);
		ResultSet rs = ps.executeQuery();
		if(rs.next())
			return rs.getInt("role");
		return -1;
	}
	
	public static ArrayList<User> getUsers(int firstResult, int maxResult) throws ClassNotFoundException, SQLException {
		String sql = "select * from user LIMIT ?,?";
		PreparedStatement ps = DBConnection.getConnect().prepareStatement(sql);
		ps.setInt(1, firstResult);
		ps.setInt(2, maxResult);
		ResultSet rs = ps.executeQuery();
		
		ArrayList<User> users = new ArrayList<>();
		
		while (rs.next()) {
			User user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5));
			users.add(user);
		}
		return users;
	}
	
	public static User getUser(int id) throws ClassNotFoundException, SQLException {
		String sql = "select * from user where id = ?";
		PreparedStatement ps = DBConnection.getConnect().prepareStatement(sql);
		ps.setInt(1, id);
		ResultSet rs = ps.executeQuery();
		
		if(rs.next()) {
			User user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5));
			return user;
		}
		return null;
	}
	
	public static void editUser(User user) throws ClassNotFoundException, SQLException {
		String sql = "update User set name=?, username=?, password=?, role=? where id = ?";
		PreparedStatement ps = DBConnection.getConnect().prepareStatement(sql);
		ps.setString(1, user.getName());
		ps.setString(2, user.getUsername());
		ps.setString(3, user.getPassword());
		ps.setInt(4, user.getRole());
		ps.setInt(5, user.getId());
		ps.executeUpdate();
	}
	
	public static void addUser(User user) throws ClassNotFoundException, SQLException {
		String sql = "insert into User values (?,?,?,?,?)";
		PreparedStatement ps = DBConnection.getConnect().prepareStatement(sql);
		ps.setString(1, null);
		ps.setString(2, user.getName());
		ps.setString(3, user.getUsername());
		ps.setString(4, user.getPassword());
		ps.setInt(5, user.getRole());
		System.out.println(user.getUsername());
		ps.executeUpdate();
	}
	
	public static void deleteUser(int id) throws ClassNotFoundException, SQLException {
		String sql = "delete from user where id = ?";
		PreparedStatement ps = DBConnection.getConnect().prepareStatement(sql);
		ps.setInt(1, id);
		ps.executeUpdate();
	}
}
