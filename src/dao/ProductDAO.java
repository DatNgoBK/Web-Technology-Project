package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader.Array;

import model.Phone;

public class ProductDAO {
	
	private static String sqlNumTotalPhone = "";

	/**
	 * lấy danh sách các mặt hàng theo danh mục từ mặt hàng có số thứ tự
	 * firstResult
	 * 
	 * @param categoryType
	 *            loại danh mục mặt hàng
	 * @param firstResult
	 *            mặt hàng đầu tiên
	 * @param maxResult
	 *            số mặt hàng tối đa
	 * @return
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public static ArrayList<Phone> getPhones(int firstResult, int maxResult)
			throws SQLException, ClassNotFoundException {
		String sql = "SELECT phone.* FROM phone  order by price DESC LIMIT ?,?";
//		String sql = " SELECT product.*, userprofile.username, userprofile.address, userprofile.avatar, category.*"
//				+ " FROM product, userprofile, category"
//				+ " WHERE userprofile.username = product.seller AND categoryType = ? AND product.categoryType = category.id LIMIT ?, ? ";
		PreparedStatement ps = DBConnection.getConnect().prepareStatement(sql);
		ps.setInt(1, firstResult);
		ps.setInt(2, maxResult);
		ResultSet rs = ps.executeQuery();
		ArrayList<Phone> list = new ArrayList<>();
		while (rs.next()) {
			Phone phone = new Phone();
			phone.setPhoneID(rs.getLong("id"));
			phone.setName(rs.getString("name"));
			phone.setPrice(rs.getLong("price"));
			phone.setRam(rs.getFloat("ram"));
			phone.setMemory(rs.getFloat("memory"));
			phone.setImage(rs.getString("image").split(";")[0] + "");
			list.add(phone);
		}
		return list;
	}
	
	public static ArrayList<String> getAllPhoneNames()
			throws SQLException, ClassNotFoundException {
		String sql = "SELECT name FROM phone";
		PreparedStatement ps = DBConnection.getConnect().prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		ArrayList<String> list = new ArrayList<>();
		while (rs.next()) {
			list.add(rs.getString("name"));
		}
		return list;
	}
	
	public static Phone getPhoneByID(long id) throws ClassNotFoundException, SQLException {
		String sql = "SELECT * from phone where id=?";
		PreparedStatement ps = DBConnection.getConnect().prepareStatement(sql);
		ps.setLong(1, id);
		ResultSet rs = ps.executeQuery();
		Phone phone = null;
		if(rs.next()) {
			phone = new Phone();
			phone.setPhoneID(rs.getLong("id"));
			phone.setName(rs.getString("name"));
			phone.setScreen(rs.getString("screen"));
			phone.setOs(rs.getString("os"));
			phone.setFrontCamera(rs.getFloat("front_camera"));
			phone.setFollowingCamera(rs.getFloat("following_camera"));
			phone.setCpu(rs.getString("cpu"));
			phone.setRam(rs.getFloat("ram"));
			phone.setMemory(rs.getFloat("memory"));
			phone.setMemoryCard(rs.getString("memory_card"));
			phone.setSim(rs.getString("sim"));
			phone.setBattery(rs.getString("battery"));
			phone.setBrandId(rs.getInt("brand_id"));
			phone.setImage(rs.getString("image"));
			phone.setPrice(rs.getInt("price"));
			phone.setAmount(rs.getInt("amount"));
		}
		return phone;
	}
	
	public static ArrayList<Phone> getListPhoneByNameFromTo(int firstResult, int maxResult, String name)
			throws SQLException, ClassNotFoundException {
		String sql = "SELECT phone.* FROM phone where name like '"+name+"%' order by price DESC LIMIT ?,?";
		PreparedStatement ps = DBConnection.getConnect().prepareStatement(sql);
		ps.setInt(1, firstResult);
		ps.setInt(2, maxResult);
		ResultSet rs = ps.executeQuery();
		ArrayList<Phone> list = new ArrayList<>();
		while (rs.next()) {
			Phone phone = new Phone();
			phone.setPhoneID(rs.getLong("id"));
			phone.setName(rs.getString("name"));
			phone.setRam(rs.getFloat("ram"));
			phone.setMemory(rs.getFloat("memory"));
			phone.setPrice(rs.getLong("price"));
			phone.setImage(rs.getString("image").split(";")[0] + "");
			list.add(phone);
		}
		return list;
	}
	
	public static ArrayList<Phone> getRelatedPhone(long phoneID, int brandId) throws ClassNotFoundException, SQLException{
		String sql = "select * from phone where brand_id = ? and id != ?";
		PreparedStatement ps = DBConnection.getConnect().prepareStatement(sql);
		ps.setInt(1, brandId);
		ps.setLong(2, phoneID);
		ResultSet rs = ps.executeQuery();
		ArrayList<Phone> list = new ArrayList<>();
		while(rs.next()) {
			Phone phone = new Phone();
			String image;
			image = Arrays.asList(rs.getString("image").split(";")).get(0);
			phone.setPhoneID(rs.getLong("id"));
			phone.setName(rs.getString("name"));
			phone.setScreen(rs.getString("screen"));
			phone.setOs(rs.getString("os"));
			phone.setFrontCamera(rs.getFloat("front_camera"));
			phone.setFollowingCamera(rs.getFloat("following_camera"));
			phone.setCpu(rs.getString("cpu"));
			phone.setRam(rs.getFloat("ram"));
			phone.setMemory(rs.getFloat("memory"));
			phone.setMemoryCard(rs.getString("memory_card"));
			phone.setSim(rs.getString("sim"));
			phone.setBattery(rs.getString("battery"));
			phone.setBrandId(rs.getInt("brand_id"));
			phone.setImage(image);
			phone.setPrice(rs.getInt("price"));
			phone.setAmount(rs.getInt("amount"));
			list.add(phone);
		}
		return list;
	}
	public static ArrayList<Phone> getListPhoneByPropertiesFromTo(int firstResult, int maxResult, String[] brands, String[] prices, String[] rams, String[] memories)
			throws SQLException, ClassNotFoundException {
		String sql;
		if (brands == null)
			sql = "select * from phone limit ?,?";
		else {
			sql = "select * from phone where brand_id in ('";
			for (int i = 0; i < brands.length; i++) {
				System.out.println(brands[i]);
				if (i != brands.length - 1) {
					sql += brands[i] + "','";
				} else {
					sql += brands[i] + "')";
				}
			}
		}
		if(prices!=null) {
			sql += " and (";
			for (int i = 0; i < prices.length-1; i++) {
				String[] splitedPrice = prices[i].split("-");
				sql+="( price < "+splitedPrice[1] + " and price >="+ splitedPrice[0]+") or ";
			}
			String[] splitedPrice = prices[prices.length-1].split("-");
			sql+="( price < "+splitedPrice[1] + " and price >="+ splitedPrice[0]+"))";
		}
		
		if(rams!=null) {
			sql += " and (";
			for (int i = 0; i < rams.length-1; i++) {
				String[] splitedRam = rams[i].split("-");
				sql+="( ram < "+splitedRam[1] + " and ram >="+ splitedRam[0]+") or ";
			}
			String[] splitedRam = rams[rams.length-1].split("-");
			sql+="( ram < "+splitedRam[1] + " and ram >="+ splitedRam[0]+"))";
		}
		
		if(memories!=null) {
			sql += " and (";
			for (int i = 0; i < memories.length-1; i++) {
				sql+="(memory = "+memories[i]+") or ";
			}
			sql+="( memory = "+memories[memories.length-1]+"))";
		}
		
		sql += " limit ?,?";
		PreparedStatement ps = DBConnection.getConnect().prepareStatement(sql);
		ps.setInt(1, firstResult);
		ps.setInt(2, maxResult);
		ResultSet rs = ps.executeQuery();
		ArrayList<Phone> list = new ArrayList<>();
		while (rs.next()) {
			Phone phone = new Phone();
			phone.setName(rs.getString("name"));
			phone.setPrice(rs.getLong("price"));
			phone.setRam(rs.getFloat("ram"));
			phone.setMemory(rs.getFloat("memory"));
			phone.setImage(rs.getString("image").split(";")[0] + "");
			list.add(phone);
			System.out.println(phone.getName());
		}
		return list;
	}
	
	public static ArrayList<Phone> getPhonesByPropertiesOrderBy(int firstResult, int maxResult, String[] brands, String[] prices, String[] rams, String[] memories, String typeOrder, String columnOrder)
			throws SQLException, ClassNotFoundException {
//		if (brands.length == 1)
//			sql = "select * from phone ";
//		else {
//			sql = "select * from phone where brand_id in ('";
//			for (int i = 0; i < brands.length; i++) {
//				System.out.println(brands[i]);
//				if (i != brands.length - 1) {
//					sql += brands[i] + "','";
//				} else {
//					sql += brands[i] + "')";
//				}
//			}
//		}
		String sqlTemp = "select * from phone ";
		String sql = "";
		if(!brands[0].equals("")) {
			sql = "where brand_id in ('";
			for (int i = 0; i < brands.length; i++) {
				if (i != brands.length - 1) {
					sql += brands[i] + "','";
				} else {
					sql += brands[i] + "')";
				}
			}
		}
		
		if(!prices[0].equals("")) {
			
			if (brands[0].equals(""))
				sql += "where (";
			else
				sql += " and (";
			
			for (int i = 0; i < prices.length-1; i++) {
				String[] splitedPrice = prices[i].split("-");
				sql+="( price < "+splitedPrice[1] + " and price >="+ splitedPrice[0]+") or ";
			}
			String[] splitedPrice = prices[prices.length-1].split("-");
			sql+="( price < "+splitedPrice[1] + " and price >="+ splitedPrice[0]+"))";
		}
		
		
		
		if(!rams[0].equals("")) {
			if (brands[0].equals("") && prices[0].equals(""))
				sql += "where (";
			else
				sql += " and (";
			for (int i = 0; i < rams.length-1; i++) {
				String[] splitedRam = rams[i].split("-");
				sql+="( ram < "+splitedRam[1] + " and ram >="+ splitedRam[0]+") or ";
			}
			String[] splitedRam = rams[rams.length-1].split("-");
			sql+="( ram < "+splitedRam[1] + " and ram >="+ splitedRam[0]+"))";
		}
		
		if(!memories[0].equals("") ) {
			if (brands[0].equals("") && prices[0].equals("") && rams[0].equals(""))
				sql += "where (";
			else
				sql += " and (";
			for (int i = 0; i < memories.length-1; i++) {
				sql+="(memory = "+memories[i]+") or ";
			}
			sql+="( memory = "+memories[memories.length-1]+"))";
		}
		sqlNumTotalPhone = "select count(*) from phone " + sql;
		sql = sqlTemp + sql;
		sql += " order by " + columnOrder + " " +typeOrder + " limit ?,?";
		

		System.out.println(sql);
		PreparedStatement ps = DBConnection.getConnect().prepareStatement(sql);
		ps.setInt(1, firstResult);
		ps.setInt(2, maxResult);
		ResultSet rs = ps.executeQuery();
		ArrayList<Phone> list = new ArrayList<>();
		while (rs.next()) {
			Phone phone = new Phone();
			phone.setPhoneID(rs.getLong("id"));
			phone.setName(rs.getString("name"));
			phone.setPrice(rs.getLong("price"));
			phone.setRam(rs.getFloat("ram"));
			phone.setMemory(rs.getFloat("memory"));
			phone.setImage(rs.getString("image").split(";")[0] + "");
			list.add(phone);
			System.out.println(phone.getName());
		}
		
		return list;
	}
	
	public static int getNumberOfPhone() throws ClassNotFoundException, SQLException{
		PreparedStatement ps = DBConnection.getConnect().prepareStatement(sqlNumTotalPhone);
		ResultSet rs = ps.executeQuery();
		System.out.println(sqlNumTotalPhone);
		if(rs.next()) {
//			System.out.println("count" + rs.getInt("count(*)"));
			return rs.getInt("count(*)");
		}
		return 0;
	}
	
	public static ArrayList<Phone> getPhonesFromTo(int firstResult, int maxResult)
			throws SQLException, ClassNotFoundException {
		String sql = "SELECT phone.* FROM phone LIMIT ?,?";
		PreparedStatement ps = DBConnection.getConnect().prepareStatement(sql);
		ps.setInt(1, firstResult);
		ps.setInt(2, maxResult);
		ResultSet rs = ps.executeQuery();
		ArrayList<Phone> list = new ArrayList<>();
		while (rs.next()) {
			Phone phone = new Phone();
			phone.setPhoneID(rs.getLong("id"));
			phone.setName(rs.getString("name"));
			phone.setScreen(rs.getString("screen"));
			phone.setOs(rs.getString("os"));
			phone.setFrontCamera(rs.getInt("front_camera"));
			phone.setFollowingCamera(rs.getInt("following_camera"));
			phone.setCpu(rs.getString("cpu"));
			phone.setRam(rs.getFloat("ram"));
			phone.setMemory(rs.getInt("memory"));
			phone.setMemoryCard(rs.getString("memory_card"));
			phone.setSim(rs.getString("sim"));
			phone.setBattery(rs.getString("battery"));
			phone.setPrice(rs.getLong("price"));
			phone.setAmount(rs.getInt("amount"));
			phone.setBrandName(BrandDAO.getBrandByID(rs.getInt("brand_id")).getName());
			phone.setImage(rs.getString("image").split(";")[0] + "");
			list.add(phone);
		}
		return list;
	}
	
	public static void addPhone(Phone phone) throws ClassNotFoundException, SQLException {
		String sql = "insert into phone (name,screen,os,front_camera,following_camera,cpu,ram,memory,memory_card,sim,battery,brand_id,price,amount,image)"
				+ " values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement ps = DBConnection.getConnect().prepareStatement(sql);
		ps.setString(1, phone.getName());
		ps.setString(2, phone.getScreen());
		ps.setString(3, phone.getOs());
		ps.setFloat(4, phone.getFrontCamera());
		ps.setFloat(5, phone.getFollowingCamera());
		ps.setString(6, phone.getCpu());
		ps.setFloat(7, phone.getRam());
		ps.setFloat(8, phone.getMemory());
		ps.setString(9, phone.getMemoryCard());
		ps.setString(10, phone.getSim());
		ps.setString(11, phone.getBattery());
		ps.setInt(12, phone.getBrandId());
		ps.setInt(13, (int)phone.getPrice());
		ps.setInt(14, phone.getAmount());
		ps.setString(15, phone.getImage());
		
		ps.executeUpdate();
		ps.close();
	}
	
	public static void editPhone(Phone phone) throws ClassNotFoundException, SQLException {
		String sql = "update phone set name=?,screen=?,os=?,front_camera=?,following_camera=?,cpu=?,ram=?,memory=?,memory_card=?,"
				+ "sim=?,battery=?,brand_id=?,image=?,price=?,amount=? where id=?";
		PreparedStatement ps = DBConnection.getConnect().prepareStatement(sql);
		ps.setString(1, phone.getName());
		ps.setString(2, phone.getScreen());
		ps.setString(3, phone.getOs());
		ps.setFloat(4, phone.getFrontCamera());
		ps.setFloat(5, phone.getFollowingCamera());
		ps.setString(6, phone.getCpu());
		ps.setFloat(7, phone.getRam());
		ps.setFloat(8, phone.getMemory());
		ps.setString(9, phone.getMemoryCard());
		ps.setString(10, phone.getSim());
		ps.setString(11, phone.getBattery());
		ps.setInt(12, phone.getBrandId());
		ps.setString(13, phone.getImage());
		ps.setInt(14, (int)phone.getPrice());
		ps.setInt(15, phone.getAmount());
		ps.setInt(16, Integer.valueOf(phone.getPhoneID().toString()));
		
		ps.executeUpdate();
		ps.close();
	}
	
	public static String getImagePathById(int id) throws ClassNotFoundException, SQLException {
		String sql = "select image from phone where id = ?";
		PreparedStatement ps = DBConnection.getConnect().prepareStatement(sql);
		ps.setInt(1, id);
		ResultSet rs = ps.executeQuery();
		String imagePath = "";
		if(rs.next()) {
			imagePath = rs.getString("image");
		}
		return imagePath;
	}
	
	public static void deletePhoneById(int id) throws ClassNotFoundException, SQLException {
		String sql = "delete from phone where id = ?";
		PreparedStatement ps = DBConnection.getConnect().prepareStatement(sql);
		ps.setInt(1, id);
		ps.executeUpdate();
	}
}
