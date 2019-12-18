package model;

public class Bill {
	private Long id;
	private String fullName;
	private String email;
	private String phone;
	private String address;
	private Long total;
	
	public Bill(String fullName, String email, String phone, String address, Long total) {
		super();
		this.fullName = fullName;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.total = total;
	}
	
	public Bill(Long id, String fullName, String email, String phone, String address, Long total) {
		super();
		this.id = id;
		this.fullName = fullName;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.total = total;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Long getTotal() {
		return total;
	}

	public void setTotal(Long total) {
		this.total = total;
	}
	
	
}
