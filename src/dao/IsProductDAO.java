package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.IsProduct;

public class IsProductDAO {
	static DataBase db = new DataBase();
	public static ArrayList<IsProduct> getListIsProduct() {
		ArrayList<IsProduct> list = new ArrayList<>();
		IsProduct isproduct;
		String sql = "SELECT id_is_product, name_is_product FROM is_product";
		try {
			Statement stm = db.connectDB().createStatement();
			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) {
				isproduct = new IsProduct(rs.getInt(1), rs.getString(2));
				list.add(isproduct);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	public IsProduct getIsProductDetail(int idCat) {
		IsProduct cat = null;
		String sql = "SELECT id_is_product, name_is_product FROM is_product WHERE id_is_product="+idCat;
		try {
			Statement stm = db.connectDB().createStatement();
			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) {
				cat = new IsProduct(rs.getInt(1), rs.getString(2));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return cat;
	}
	public boolean editIsProduct(IsProduct cat) {
		String sql = "UPDATE is_product SET name_is_product = '"+cat.getNameIsProduct()+"' WHERE id_is_product="+cat.getIdIsProduct();
		int check = 0;
		try {
			Statement stm = db.connectDB().createStatement();
			check = stm.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (check == 0) {
			return false;
		} else {
			return true;
		}
	}
	public boolean addIsProduct(String nameCat) {
		String sql = "INSERT INTO is_product(name_is_product) VALUE(?)";
		int check = 0;
		try {
			PreparedStatement pstm = db.connectDB().prepareStatement(sql);
			pstm.setString(1, nameCat);
			check = pstm.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (check == 0) {
			return false;
		} else {
			return true;
		}
	}
	public boolean delIsProduct(int idCat) {
		String sql = "DELETE FROM is_product WHERE id_is_product = ?";
		int check = 0;
		try {
			PreparedStatement pstm = db.connectDB().prepareStatement(sql);
			pstm.setInt(1, idCat);
			check = pstm.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (check == 0) {
			return false;
		} else {
			return true;
		}
	}

}
