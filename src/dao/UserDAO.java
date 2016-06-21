package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.Category;
import bean.User;

public class UserDAO {
	DataBase db = new DataBase();
	public ArrayList<User> getListUser() {
		ArrayList<User> listUser = new ArrayList<>();
		User user;
		String sql = "SELECT id_user, username, password, role, full_name, phone_number, address, email FROM users";
		try {
			Statement stm = db.connectDB().createStatement();
			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) {
				user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8));
				listUser.add(user);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return listUser;
	}
	public boolean addUser(User user) {
		String sql = "INSERT INTO users(username, password, role, full_name, phone_number, address, email) VALUES(?,?,?,?,?,?,?)";
		int check = 0;
		try {
			PreparedStatement pstm = db.connectDB().prepareStatement(sql);
			pstm.setString(1, user.getUserName());
			pstm.setString(2, user.getPassword());
			pstm.setInt(3, 1);
			pstm.setString(4, user.getFullName());
			pstm.setString(5, user.getPhone_number());
			pstm.setString(6, user.getAddress());
			pstm.setString(7, user.getEmail());
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
	public User getUserDetail(int idUser) {
		User user = null;
		String sql = "SELECT id_user, username, password, role, full_name, phone_number, address, email  FROM users WHERE id_user="+idUser;
		try {
			Statement stm = db.connectDB().createStatement();
			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) {
				user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return user;
	}
	public boolean editUser(User user) {
		String query = "UPDATE users SET username = ?, password = ?, full_name = ? WHERE id_user = ?";
		int check = 0;
		try {
			PreparedStatement pstm = db.connectDB().prepareStatement(query);
			pstm.setString(1, user.getUserName());
			pstm.setString(2, user.getPassword());
			pstm.setString(3, user.getFullName());
			pstm.setInt(4, user.getUserID());
			check = pstm.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (check > 0){
			return true;
		} else {
			return false;
		}
	}
	public boolean delUser(int idUser) {
		String sql = "DELETE FROM users WHERE id_user=?";
		int check = 0;
		try {
			PreparedStatement pstm = db.connectDB().prepareStatement(sql);
			pstm.setInt(1, idUser);
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
	public User checkLogin(String username, String password) {
		User user = null;
		String sql = "SELECT id_user, username, password, role, full_name, phone_number, address, email FROM users WHERE username = '"+username+"' && password = '"+password+"' && role = '"+1+"'";
		try {
			Statement stm = db.connectDB().createStatement();
			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) {
				user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return user;
	}
	public boolean checkUser(String username) {
		String sql = "SELECT count(*) as soluong FROM users WHERE username="+username+"";
		int soluong = 0;
		try {
			Statement stm = db.connectDB().createStatement();
			ResultSet rs = stm.executeQuery(sql);
			while (rs.next()) {
				soluong = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (soluong == 0) {
			return true;
		} else {
			return false;
		}
	}

}
