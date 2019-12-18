package dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import model.CustomerReply;

public class CustomerReplyDAO {
	public static void insertCustomerReply(CustomerReply customerReply) throws SQLException, ClassNotFoundException {
		String sql = "insert into contact_info value(?, ?, ?, ?, ?);";
		PreparedStatement ps = DBConnection.getConnect().prepareStatement(sql);
		ps.setString(1, customerReply.getPhone());
		ps.setString(2, customerReply.getName());
		ps.setString(3, customerReply.getEmail());
		ps.setString(4, customerReply.getSubject());
		ps.setString(5, customerReply.getMessages());
		ps.executeUpdate();
	}
}
