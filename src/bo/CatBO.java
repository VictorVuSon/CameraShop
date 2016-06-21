package bo;

import java.util.ArrayList;

import bean.Category;
import bean.Contact;
import dao.CatDAO;

public class CatBO {
	static CatDAO catDAO = new CatDAO();
	public ArrayList<Category> getListCat() {
		return catDAO.getListCat();
	}
	public boolean addCat(String nameCat) {
		return catDAO.addCat(nameCat);
	}
	public boolean delCat(int idCat) {
		return catDAO.delCat(idCat);
	}
	public Category getCatDetail(int idCat) {
		return catDAO.getCatDetail(idCat);
	}
	public boolean editCat(Category cat) {
		return catDAO.editCat(cat);
	}
	public ArrayList<Category> getListCatPerPage(int offset, int NUMBER_NEWS_PER_PAGE) {
		return catDAO.getListCatPerPage(offset, NUMBER_NEWS_PER_PAGE);
	}
	public static int countAllCat() {
		return catDAO.countAllCat();
	}
	public boolean saveContact(String name, String email, String message) {
		return catDAO.saveContact(name,email,message);
	}
	public ArrayList<Contact> getListContact() {
		return catDAO.getListContact();
	}
}
