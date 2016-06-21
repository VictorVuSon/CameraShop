package bean;

public class Products {
	private int idProduct;
	private String nameProduct;
	private String photoProduct;
	private String previewText;
	private int price;
	private String detail;
	private int isProduct;
	private String namIsProduct;
	private int idCat;
	private String nameCat;
	private int soluong;
	public Products(int idProduct, String nameProduct, String photoProduct,
			String previewText, int price, String detail, int isProduct,
			int idCat, String nameCat, String nameIsProduct) {
		super();
		this.idProduct = idProduct;
		this.nameProduct = nameProduct;
		this.photoProduct = photoProduct;
		this.previewText = previewText;
		this.price = price;
		this.detail = detail;
		this.isProduct = isProduct;
		this.idCat = idCat;
		this.nameCat = nameCat;
		this.namIsProduct = nameIsProduct;
	}
	public Products() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getIdProduct() {
		return idProduct;
	}
	public void setIdProduct(int idProduct) {
		this.idProduct = idProduct;
	}
	public String getNameProduct() {
		return nameProduct;
	}
	public void setNameProduct(String nameProduct) {
		this.nameProduct = nameProduct;
	}
	public String getPhotoProduct() {
		return photoProduct;
	}
	public void setPhotoProduct(String photoProduct) {
		this.photoProduct = photoProduct;
	}
	public String getPreviewText() {
		return previewText;
	}
	public void setPreviewText(String previewText) {
		this.previewText = previewText;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public int getIsProduct() {
		return isProduct;
	}
	public void setIsProduct(int isProduct) {
		this.isProduct = isProduct;
	}
	public int getIdCat() {
		return idCat;
	}
	public void setIdCat(int idCat) {
		this.idCat = idCat;
	}
	public String getNameCat() {
		return nameCat;
	}
	public void setNameCat(String nameCat) {
		this.nameCat = nameCat;
	}
	public String getNamIsProduct() {
		return namIsProduct;
	}
	public void setNamIsProduct(String namIsProduct) {
		this.namIsProduct = namIsProduct;
	}
	public int getSoluong() {
		return soluong;
	}
	public void setSoluong(int soluong) {
		this.soluong = soluong;
	}
	
	
	
}
