package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DataBase {
	public Connection connectDB(){
		Connection cnn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			cnn = DriverManager.getConnection("jdbc:mysql://localhost:3306/camera_shop?useUnicode=true&characterEncoding=UTF-8","root","");
		} catch (Exception e) {
			// TODO: handle exception
		}
		return cnn;
	}
}
