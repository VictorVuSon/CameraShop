package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import bean.Bill;
import bean.Products;
import bean.User;

public class ProductsDAO {
	 static DataBase db = new DataBase();
		public ArrayList<Products> getListNews() {
			ArrayList<Products> list = new ArrayList<Products>();
			Products product;
			String sql = "SELECT p.id_product, p.name_product, p.photo_product, p.preview_text, p.price, p.detail, p.id_is_product, p.id_cat, c.name_cat, i.name_is_product FROM products AS p INNER JOIN category as c ON p.id_cat = c.id_cat INNER JOIN is_product AS i ON i.id_is_product = p.id_is_product ORDER BY id_product DESC";
			try {
				Statement stm = db.connectDB().createStatement();
				ResultSet rs = stm.executeQuery(sql);
				while (rs.next()) {
					product = new Products(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getString(6), rs.getInt(7),rs.getInt(8), rs.getString(9),rs.getString(10));
					list.add(product);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return list;
		}
		public boolean addNews(Products product) {
			String sql = "INSERT INTO products(name_product, photo_product, preview_text, price, detail, id_is_product, id_cat) VALUES(?,?,?,?,?,?,?)";
			int check = 0;
			try {
				PreparedStatement pstm = db.connectDB().prepareStatement(sql);
				pstm.setString(1, product.getNameProduct());
				pstm.setString(2, product.getPhotoProduct());
				pstm.setString(3, product.getPreviewText());
				pstm.setInt(4, product.getPrice());
				pstm.setString(5, product.getDetail());
				pstm.setInt(6, product.getIsProduct());
				pstm.setInt(7, product.getIdCat());
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
		public Products getDetail(int idProduct) {
			Products product = new Products();
			String sql = "SELECT id_product, name_product, photo_product, preview_text, price, detail, id_is_product, id_cat FROM products WHERE id_product="+idProduct;
			try {
				Statement stm = db.connectDB().createStatement();
				ResultSet rs = stm.executeQuery(sql);
				while (rs.next()) {
					product.setIdProduct((rs.getInt(1)));
					product.setNameProduct((rs.getString(2)));
					product.setPhotoProduct((rs.getString(3)));
					product.setPreviewText((rs.getString(4)));
					product.setPrice((rs.getInt(5)));
					product.setDetail((rs.getString(6)));
					product.setIsProduct((rs.getInt(7)));
					product.setIdCat((rs.getInt(8)));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return product;
		}
		public boolean edit(Products product) {
			String query = "UPDATE products SET name_product = ?, photo_product = ?, preview_text = ?, price = ?, detail = ?, id_is_product = ?, id_cat = ? WHERE id_product = ?";
			int check = 0;
			try {
				PreparedStatement pstm = db.connectDB().prepareStatement(query);
				pstm.setString(1, product.getNameProduct());
				pstm.setString(2, product.getPhotoProduct());
				pstm.setString(3, product.getPreviewText());
				pstm.setInt(4, product.getPrice());
				pstm.setString(5, product.getDetail());
				pstm.setInt(6, product.getIsProduct());
				pstm.setInt(7, product.getIdCat());
				pstm.setInt(8, product.getIdProduct());
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
		public boolean delNews(int idProduct) {
			String sql = "DELETE FROM products WHERE id_product=?";
			int check = 0;
			try {
				PreparedStatement pstm = db.connectDB().prepareStatement(sql);
				pstm.setInt(1, idProduct);
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
		public ArrayList<Products> getListByIDCat(int idCat) {
			ArrayList<Products> list = new ArrayList<Products>();
			Products product;
//			String sql = "SELECT id_product, p.name_product, p.photo_product, p.preview_text, p.price, p.detail, p.id_is_product, p.id_cat, c.name_cat as cname FROM products as p"
//					+ " INNER JOIN category as c USING(id_cat) "
//					+ "	WHERE id_cat = '"+idCat+"'"
//					+ "ORDER BY id_news DESC";
			String sql = "SELECT p.id_product, p.name_product, p.photo_product, p.preview_text, p.price, p.detail, p.id_is_product, p.id_cat, c.name_cat, i.name_is_product "
					+ "FROM products AS p INNER JOIN category as c ON p.id_cat = c.id_cat INNER JOIN is_product AS i ON i.id_is_product = p.id_is_product"
					+ "	WHERE id_cat = '"+idCat+"'"
					+ " ORDER BY id_product DESC";
			
			try {
				Statement stm = db.connectDB().createStatement();
				ResultSet rs = stm.executeQuery(sql);
				while (rs.next()) {
					product = new Products(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getString(6), rs.getInt(7),rs.getInt(8), rs.getString(9),rs.getString(10));
					list.add(product);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return list;
		}
		public ArrayList<Products> getListLienQuanByIDCat(int idCat, int idProduct) {
			ArrayList<Products> list = new ArrayList<Products>();
			Products product;
			//String sql = "SELECT id_news,n.name,preview_text,detail_text,picture,id_cat,c.name AS cname FROM news AS n INNER JOIN category AS c USING(id_cat) ORDER BY id_cat ASC";
			String sql = "SELECT p.id_product, p.name_product, p.photo_product, p.preview_text, p.price, p.detail, p.id_is_product, p.id_cat, c.name_cat, i.name_is_product "
					+ "FROM products AS p INNER JOIN category as c ON p.id_cat = c.id_cat INNER JOIN is_product AS i ON i.id_is_product = p.id_is_product"
					+ "	WHERE id_cat = '"+idCat+"'"
					+ " && id_product != '"+idProduct+"'"
					+ " ORDER BY id_product DESC"
					+ " LIMIT "+0+", "+2+"";
				
					
			try {
				Statement stm = db.connectDB().createStatement();
				ResultSet rs = stm.executeQuery(sql);
				while (rs.next()) {
					product = new Products(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getString(6), rs.getInt(7),rs.getInt(8), rs.getString(9),rs.getString(10));
					list.add(product);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return list;
		}
		public ArrayList<Products> getListPerPage(int offset, int numberPerPage) {
			ArrayList<Products> list = new ArrayList<Products>();
			Products product;
			String sql = "SELECT p.id_product, p.name_product, p.photo_product, p.preview_text, p.price, p.detail, p.id_is_product, p.id_cat, c.name_cat, i.name_is_product "
					+ "FROM products AS p INNER JOIN category as c ON p.id_cat = c.id_cat INNER JOIN is_product AS i ON i.id_is_product = p.id_is_product"
					+ " ORDER BY id_product DESC"
					+ " LIMIT "+offset+", "+numberPerPage+"";
			try {
				Statement stm = db.connectDB().createStatement();
				ResultSet rs = stm.executeQuery(sql);
				while (rs.next()) {
					product = new Products(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getString(6), rs.getInt(7),rs.getInt(8), rs.getString(9),rs.getString(10));
					list.add(product);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return list;
		}
		public static int countAll() {
			String sql = "SELECT count(*) as sotin FROM products";
			int sotin = 0;
			try {
				Statement stm = db.connectDB().createStatement();
				ResultSet rs = stm.executeQuery(sql);
				while (rs.next()) {
					sotin = rs.getInt(1);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return sotin;
		}
		public static ArrayList<Products> getListByIDCatPerPage(int idCat, int offset, int numberPerPage) {
			ArrayList<Products> list = new ArrayList<Products>();
			Products product;
			//String sql = "SELECT id_news,n.name,preview_text,detail_text,picture,id_cat,c.name AS cname FROM news AS n INNER JOIN category AS c USING(id_cat) ORDER BY id_cat ASC";
			String sql ="SELECT p.id_product, p.name_product, p.photo_product, p.preview_text, p.price, p.detail, p.id_is_product, p.id_cat, c.name_cat, i.name_is_product "
					+ "FROM products AS p INNER JOIN category as c ON p.id_cat = c.id_cat INNER JOIN is_product AS i ON i.id_is_product = p.id_is_product"
					+ "	WHERE id_cat = '"+idCat+"'"
					+ " ORDER BY id_product DESC"
					+ " LIMIT "+offset+", "+numberPerPage+"";
			try {
				Statement stm = db.connectDB().createStatement();
				ResultSet rs = stm.executeQuery(sql);
				while (rs.next()) {
					product = new Products(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getString(6), rs.getInt(7),rs.getInt(8), rs.getString(9),rs.getString(10));
					list.add(product);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return list;
		}
		public static int countAllByIDCat(int idCat) {
			String sql = "SELECT count(*) as sotin FROM news WHERE id_cat = "+idCat+"";
			int soTinByIdCat = 0;
			try {
				Statement stm = db.connectDB().createStatement();
				ResultSet rs = stm.executeQuery(sql);
				while (rs.next()) {
					soTinByIdCat = rs.getInt(1);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return soTinByIdCat;
		}
		public static boolean checkout(User guest, ArrayList<Products> listCart) {
			String sql = "INSERT INTO order_list(status,full_name,phone_number,address,email,total) VALUES(?,?,?,?,?,?)";
			String sql2 = "INSERT INTO order_detail(id_product,quanlity,id_order) VALUES(?,?,?)";
			String getmax = "SELECT MAX(id_order) FROM order_list";
			int check = 0;
			int check2 = 0;
			int total = 0;
			int id_order = 0;
			try {
				for(Products pr:listCart){
					total+=pr.getSoluong()*pr.getPrice();
				}
				PreparedStatement pstm = db.connectDB().prepareStatement(sql);
				pstm.setInt(1, 0);
				pstm.setString(2, guest.getFullName());
				pstm.setString(3, guest.getPhone_number());
				pstm.setString(4, guest.getAddress());
				pstm.setString(5, guest.getEmail());
				pstm.setInt(6, total);
				check = pstm.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if (check == 0) {
				return false;
			} else {
				try {
					Statement stm = db.connectDB().createStatement();
					ResultSet rsmax = stm.executeQuery(getmax);
					while(rsmax.next()){
						id_order = rsmax.getInt(1);
					}
						for(Products pr:listCart){
							PreparedStatement pstm = db.connectDB().prepareStatement(sql2);
							pstm.setInt(1, pr.getIdProduct());
							pstm.setInt(2, pr.getSoluong());
							pstm.setInt(3, id_order);
							check2 = pstm.executeUpdate();
							if(check2 == 0){
								return false;
							}
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return true;
			}
		}
		public static ArrayList<Bill> getListBill() {
			ArrayList<Bill> list = new ArrayList<Bill>();
			String sql = "SELECT  * FROM order_list";
			try {
				Statement stm = db.connectDB().createStatement();
				ResultSet rs = stm.executeQuery(sql);
				while (rs.next()) {
					Bill bill = new Bill();
					int id_order =  rs.getInt(1);
					int status = rs.getInt(2);
					String fullname = rs.getString(3);
					String phone = rs.getString(4);
					String address = rs.getString(5);
					String email = rs.getString(6);
					int total = rs.getInt(7);
					User user = new User();
					user.setAddress(address);
					user.setEmail(email);
					user.setFullName(fullname);
					user.setPhone_number(phone);
					bill.setId_order(id_order);
					bill.setStatus(status);
					bill.setTotal(total);
					bill.setUser(user);
					list.add(bill);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return list;
		}
		public static boolean executeBill(String id_order) {
			String query = "UPDATE order_list SET status = ? WHERE id_order = ?";
			int check = 0;
			try {
				PreparedStatement pstm = db.connectDB().prepareStatement(query);
				pstm.setInt(1, 1);
				pstm.setInt(2, Integer.parseInt(id_order));
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
		public static ArrayList<Bill> getProductBill(int id_order) {
			ArrayList<Bill> list = new ArrayList<>();
			Products products;
			Bill bill;
			User user;
			String sql = "SELECT products.*,order_detail.*,order_list.* FROM order_detail inner join products on order_detail.id_product = products.id_product inner join order_list on order_list.id_order = order_detail.id_order where order_detail.id_order = "+id_order;
			try {
				Statement stm = db.connectDB().createStatement();
				ResultSet rs = stm.executeQuery(sql);
				while (rs.next()) {
					products = new Products();
					user = new User();
					bill = new Bill();
					products.setIdProduct(rs.getInt("id_product"));
					products.setNameProduct(rs.getString("name_product"));
					products.setPrice(rs.getInt("price"));
					products.setSoluong(rs.getInt("quanlity"));
					user.setAddress(rs.getString("address"));
					user.setEmail(rs.getString("email"));
					user.setPhone_number(rs.getString("phone_number"));
					user.setFullName(rs.getString("full_name"));
					bill.setId_order(rs.getInt("id_order"));
					bill.setTotal(rs.getInt("total"));
					bill.setUser(user);
					bill.setStatus(rs.getInt("status"));
					bill.setProduct(products);
					list.add(bill);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return list;
		}
		public static ArrayList<Products> getListNews(String keyWord) {
			ArrayList<Products> list = new ArrayList<Products>();
			Products product;
			String sql = "SELECT p.id_product, p.name_product, p.photo_product, p.preview_text, p.price, p.detail, p.id_is_product, p.id_cat, c.name_cat, i.name_is_product FROM products AS p INNER JOIN category as c ON p.id_cat = c.id_cat INNER JOIN is_product AS i ON i.id_is_product = p.id_is_product WHERE p.name_product LIKE '%"+keyWord+"%' ORDER BY id_product DESC";
			try {
				Statement stm = db.connectDB().createStatement();
				ResultSet rs = stm.executeQuery(sql);
				while (rs.next()) {
					product = new Products(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getString(6), rs.getInt(7),rs.getInt(8), rs.getString(9),rs.getString(10));
					list.add(product);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return list;
		}
}
