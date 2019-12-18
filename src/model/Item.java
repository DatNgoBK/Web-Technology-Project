package model;

public class Item {
	private Phone phone;
    private int quantity;
 
    public Item() {
    }
 
    public Item(Phone phone, int quantity) {
        this.phone = phone;
        this.quantity = quantity;
    }
 
    public Phone getPhone() {
        return phone;
    }
 
    public void setPhone(Phone phone) {
        this.phone = phone;
    }
 
    public int getQuantity() {
        return quantity;
    }
 
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
