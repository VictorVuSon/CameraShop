package bean;

public class Contact {
	private int idContact;
	private String name;
	private String email;
	private String message;
	public int getIdContact() {
		return idContact;
	}
	public void setIdContact(int idContact) {
		this.idContact = idContact;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Contact() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Contact(int idContact, String name, String email, String message) {
		super();
		this.idContact = idContact;
		this.name = name;
		this.email = email;
		this.message = message;
	}
	
}
