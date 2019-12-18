package model;

public class CustomerReply {
	private String name;
	private String phone;
	private String email;
	private String subject;
	private String messages;
	
	public CustomerReply() {
		super();
	}
	
	public CustomerReply(String name, String phone, String email, String subject, String messages) {
		super();
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.subject = subject;
		this.messages = messages;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getMessages() {
		return messages;
	}

	public void setMessages(String messages) {
		this.messages = messages;
	}
}
