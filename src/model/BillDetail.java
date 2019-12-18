package model;

public class BillDetail {
	private String billID;
	private Long phoneID;
	private int quantity;
	private Long priceUnit;
	
	public BillDetail(Long phoneID, int quantity, Long priceUnit) {
		super();
		this.phoneID = phoneID;
		this.quantity = quantity;
		this.priceUnit = priceUnit;
	}
	
	public BillDetail(String billID, Long phoneID, int quantity, Long priceUnit) {
		super();
		this.billID = billID;
		this.phoneID = phoneID;
		this.quantity = quantity;
		this.priceUnit = priceUnit;
	}
	
	public String getBillID() {
		return billID;
	}
	public void setBillID(String billID) {
		this.billID = billID;
	}
	public Long getPhoneID() {
		return phoneID;
	}
	public void setPhoneID(Long phoneID) {
		this.phoneID = phoneID;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Long getPriceUnit() {
		return priceUnit;
	}

	public void setPriceUnit(Long priceUnit) {
		this.priceUnit = priceUnit;
	}
	
	
}
