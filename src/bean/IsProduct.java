package bean;

public class IsProduct {
	private int idIsProduct;
	private String nameIsProduct;
	public IsProduct() {
		super();
		// TODO Auto-generated constructor stub
	}
	public IsProduct(int idIsProduct, String nameIsProduct) {
		super();
		this.idIsProduct = idIsProduct;
		this.nameIsProduct = nameIsProduct;
	}
	public int getIdIsProduct() {
		return idIsProduct;
	}
	public void setIdIsProduct(int idIsProduct) {
		this.idIsProduct = idIsProduct;
	}
	public String getNameIsProduct() {
		return nameIsProduct;
	}
	public void setNameIsProduct(String nameIsProduct) {
		this.nameIsProduct = nameIsProduct;
	}
	
}
