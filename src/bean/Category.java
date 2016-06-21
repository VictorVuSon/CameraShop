package bean;

public class Category {
	private int idCat;
	private String nameCat;

	public Category(int idCat, String nameCat) {
		super();
		this.idCat = idCat;
		this.nameCat = nameCat;
	}

	public Category() {
		super();
		// TODO Auto-generated constructor stub
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

}
