package bean;

public class User {
	private int userID;
	private String userName;
	private String password;
	private String fullName;
	private String address;
	private int role;
	private String email;
	private String phone_number;
	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getRole() {
		return role;
	}
	public void setRole(int role) {
		this.role = role;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone_number() {
		return phone_number;
	}
	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public User(int userID, String userName, String password, int role, String fullName, String phone_number,
			String address, String email) {
		super();
		this.userID = userID;
		this.userName = userName;
		this.password = password;
		this.fullName = fullName;
		this.address = address;
		this.role = role;
		this.email = email;
		this.phone_number = phone_number;
	}
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	
}
