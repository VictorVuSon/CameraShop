package bo;

import java.util.ArrayList;

import bean.Bill;
import bean.Products;
import bean.User;
import dao.ProductsDAO;

public class ProductBO {
	
	ProductsDAO newsDAO = new ProductsDAO();
	public ArrayList<Products> getListNews() {
		return newsDAO.getListNews();
	}
	public boolean addNews(Products news) {
		return newsDAO.addNews(news);
	}
	public Products getDetail(int idProduct) {
		return newsDAO.getDetail(idProduct);
	}
	public boolean editNews(Products product) {
		return newsDAO.edit(product);
	}
	public boolean delNews(int idNews) {
		return newsDAO.delNews(idNews);
	}
	public ArrayList<Products> getListNewsByIDCat(int idCat) {
		return newsDAO.getListByIDCat(idCat);
	}
	public ArrayList<Products> getListNewsLienQuanByIDCat(int idCat, int idNews) {
		return newsDAO.getListLienQuanByIDCat(idCat, idNews);
	}
	public ArrayList<Products> getListNewsPerPage(int offset, int numberNewsPerPage) {
		return newsDAO.getListPerPage(offset, numberNewsPerPage);
	}
	public static int countAllNews() {
		return ProductsDAO.countAll();
	}
	public ArrayList<Products> getListNewsByIDCatPerPage(int idCat, int offset, int numberNewsPerPage) {
		return ProductsDAO.getListByIDCatPerPage(idCat, offset, numberNewsPerPage);
	}
	public static int countAllNewsByIDCat(int idCat) {
		return ProductsDAO.countAllByIDCat(idCat);
	}
	public boolean checkout(User guest, ArrayList<Products> listCart) {
		return ProductsDAO.checkout(guest,listCart);
	}
	public ArrayList<Bill> getListBill() {
		return ProductsDAO.getListBill();
	}
	public boolean executeBill(String id_order) {
		return ProductsDAO.executeBill(id_order);
	}
	public ArrayList<Bill> getProductBill(int id_order) {
		return ProductsDAO.getProductBill(id_order);
	}
	public ArrayList<Products> getListNews(String keyWord) {
		return ProductsDAO.getListNews(keyWord);
	}
}
