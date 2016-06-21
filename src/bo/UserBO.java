package bo;

import java.util.ArrayList;

import bean.User;
import dao.UserDAO;

public class UserBO {
	UserDAO userDAO = new UserDAO();
	public ArrayList<User> getListUser() {
		return userDAO.getListUser();
	}
	public boolean addUser(User user) {
		return userDAO.addUser(user);
	}
	public User getUserDetail(int idUser) {
		return userDAO.getUserDetail(idUser);
	}
	public boolean editUser(User user) {
		return userDAO.editUser(user);
	}
	public boolean delUser(int idUser) {
		return userDAO.delUser(idUser);
	}
	public User checkLogin(String username, String password) {
		return userDAO.checkLogin(username, password);
	}
	public boolean checkUser(String username) {
		return userDAO.checkUser(username);
	}
}
