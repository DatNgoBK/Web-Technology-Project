package dao;

import java.sql.SQLException;
import java.util.ArrayList;

import model.Bill;
import model.BillDetail;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class BillDAO {
	public static ArrayList<BillDetail> getAllBillDetailByBillID(String id) throws ClassNotFoundException, SQLException{
		String sql ="select * from bill_detail where bill_id = ?";
		PreparedStatement ps = DBConnection.getConnect().prepareStatement(sql);
		ps.setString(1, id);
		ResultSet rs = ps.executeQuery();
		ArrayList<BillDetail>list = new ArrayList<>();
		while(rs.next()) {
			BillDetail billDetail = new BillDetail(rs.getString("bill_id"), rs.getLong("phone_id"), rs.getInt("number"), rs.getLong("price_unit"));
			list.add(billDetail);
		}
		return list;
	}
	
	public static void insertBill(Bill bill) throws SQLException, ClassNotFoundException{
		String sql = "INSERT INTO bill(full_name, email, phone, address, total) values(?, ?, ?, ?, ?)";
		PreparedStatement ps = DBConnection.getConnect().prepareStatement(sql);
		ps.setString(1, bill.getFullName());
		ps.setString(2, bill.getEmail());
		ps.setString(3, bill.getPhone());
		ps.setString(4, bill.getAddress());
		ps.setLong(5, bill.getTotal());
		ps.executeUpdate();
	}
	
	public static void insertBillDetail(BillDetail billDetail) {
		String sql = "INSERT INTO bill_detail values(?, ?, ?, ?)";
		String ssql = "select max(id) as max from bill";
		
		PreparedStatement ps;
		try {
			ps = DBConnection.getConnect().prepareStatement(ssql);
			ResultSet rs = ps.executeQuery();
			int id = 0;
			while(rs.next()) {
				id = rs.getInt("max");
			}
			Long price = ProductDAO.getPhoneByID(billDetail.getPhoneID()).getPrice();
			PreparedStatement ps1 = DBConnection.getConnect().prepareStatement(sql);
			ps1.setInt(2, Integer.valueOf(billDetail.getPhoneID()+""));
			ps1.setInt(3, billDetail.getQuantity());
			ps1.setLong(4, price);
			ps1.setInt(1, id);
			ps1.executeUpdate();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}


	public static ArrayList<Bill> getBillsFromTo(int firstResult, int maxResult) throws ClassNotFoundException, SQLException {
		String sql = "SELECT bill.* FROM bill LIMIT ?,?";
		PreparedStatement ps = DBConnection.getConnect().prepareStatement(sql);
		ps.setInt(1, firstResult);
		ps.setInt(2, maxResult);
		ResultSet rs = ps.executeQuery();
		ArrayList<Bill> list = new ArrayList<>();
		while (rs.next()) {
			Bill bill = new Bill(rs.getLong("id"), rs.getString("full_name"), rs.getString("email"), rs.getString("phone"), rs.getString("address"), rs.getLong("total"));			
			list.add(bill);
		}
		return list;
	}
	
	public static void deleteBillById(int id) throws ClassNotFoundException, SQLException {
		String sql2 = "delete from bill_detail where bill_id = ?";
		PreparedStatement ps1 = DBConnection.getConnect().prepareStatement(sql2);
		ps1.setInt(1, id);
		ps1.executeUpdate();
		String sql = "delete from bill where id = ?";
		PreparedStatement ps = DBConnection.getConnect().prepareStatement(sql);
		ps.setInt(1, id);
		ps.executeUpdate();
	}
	
}
