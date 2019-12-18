package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Brand;

public class BrandDAO {
	public static Brand getBrandByID(int id) throws ClassNotFoundException, SQLException {
		String sql = "select * from brand where id=?";
		PreparedStatement ps = DBConnection.getConnect().prepareStatement(sql);
		ps.setInt(1, id);
		ResultSet rs = ps.executeQuery();
		Brand brand = null;
		if(rs.next()) {
			brand = new Brand(rs.getInt("id"), rs.getString("name"));
		}
		return brand;
	}
	
	public static ArrayList<Brand> getAllBrands() {
		ArrayList<Brand> brands = new ArrayList<>();
		try {
			String sql = "select * from brand";
			PreparedStatement ps = DBConnection.getConnect().prepareStatement(sql);	
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Brand brand = new Brand();
				brand.setBrandID(rs.getInt("id"));
				brand.setName(rs.getString("name"));
				brands.add(brand);
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			return brands;
		}
	}
}
