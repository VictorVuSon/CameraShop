package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.Category;
import bean.Contact;
public class CatDAO {
	static DataBase db = new DataBase();
	public ArrayList<Category> getListCat() {
		ArrayList<Category> listCat = new ArrayList<>();
		Category cat;
		String sql = "SELECT id_cat, name_cat FROM category ORDER BY id_cat DESC";
		try {
			Statement stm = db.connectDB().createStatement();
			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) {
				cat = new Category(rs.getInt(1), rs.getString(2));
				listCat.add(cat);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return listCat;
	}
	public boolean addCat(String nameCat) {
		String sql = "INSERT INTO category(name_cat) VALUE(?)";
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
	public boolean delCat(int idCat) {
		String sql = "DELETE FROM category WHERE id_cat=?";
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
	public Category getCatDetail(int idCat) {
		Category cat = null;
		String sql = "SELECT id_cat, name_cat FROM category WHERE id_cat="+idCat;
		try {
			Statement stm = db.connectDB().createStatement();
			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) {
				cat = new Category(rs.getInt(1), rs.getString(2));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return cat;
	}
	public boolean editCat(Category cat) {
		String sql = "UPDATE category SET name_cat = '"+cat.getNameCat()+"' WHERE id_cat="+cat.getIdCat();
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
	public ArrayList<Category> getListCatPerPage(int offset, int NUMBER_NEWS_PER_PAGE) {
		ArrayList<Category> listCat = new ArrayList<>();
		Category cat;
		String sql = "SELECT id_cat, name_cat FROM category ORDER BY id_cat DESC LIMIT "+offset+", "+NUMBER_NEWS_PER_PAGE+"";
		try {
			Statement stm = db.connectDB().createStatement();
			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) {
				cat = new Category(rs.getInt(1), rs.getString(2));
				listCat.add(cat);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return listCat;
	}
	public static int countAllCat() {
		String sql = "SELECT count(*) as sotin FROM category";
		int soDanhMucTin = 0;
		try {
			Statement stm = db.connectDB().createStatement();
			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) {
				soDanhMucTin = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return soDanhMucTin;
	}
	public boolean saveContact(String name, String email, String message) {
		String sql = "INSERT INTO contact(name,email,content) VALUE(?,?,?)";
		int check = 0;
		try {
			PreparedStatement pstm = db.connectDB().prepareStatement(sql);
			pstm.setString(1, name);
			pstm.setString(2, email);
			pstm.setString(3, message);
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
	public  ArrayList<Contact> getListContact() {
		ArrayList<Contact> listContact = new ArrayList<>();
		Contact contact;
		String sql = "SELECT * FROM contact";
		try {
			Statement stm = db.connectDB().createStatement();
			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) {
				contact = new Contact(rs.getInt("id"),rs.getString("name"),rs.getString("email"),rs.getString("content"));
				listContact.add(contact);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return listContact;
	}
}
