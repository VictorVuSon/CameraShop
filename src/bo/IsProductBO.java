package bo;

import java.util.ArrayList;

import dao.IsProductDAO;
import bean.IsProduct;


public class IsProductBO {
	static IsProductDAO isproductDAO = new IsProductDAO();
	public ArrayList<IsProduct> getListIsProduct() {
		return IsProductDAO.getListIsProduct();
	}
	public IsProduct getIsProductDetail(int idCat) {
		return isproductDAO.getIsProductDetail(idCat);
	}
	public boolean editIsProduct(IsProduct cat) {
		return isproductDAO.editIsProduct(cat);
	}
	public boolean addIsProduct(String nameCat) {
		return isproductDAO.addIsProduct(nameCat);
	}
	public boolean delIsProduct(int idCat) {
		return isproductDAO.delIsProduct(idCat);
	}
}
