package bean;

public class Bill {
	private int id_order;
	private int status;
	private User user;
	private Products product;
	int total;
	public Bill() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Bill(int id_order, int status, User user, int total) {
		super();
		this.id_order = id_order;
		this.status = status;
		this.user = user;
		this.total = total;
	}
	public int getId_order() {
		return id_order;
	}
	public void setId_order(int id_order) {
		this.id_order = id_order;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public Products getProduct() {
		return product;
	}
	public void setProduct(Products product) {
		this.product = product;
	}
}
