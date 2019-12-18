package model;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class Cart {
	private ArrayList<Item> cartItems;

	public Cart() {
		cartItems = new ArrayList<Item>();
	}

	public Cart(ArrayList<Item> cartItems) {
		this.cartItems = cartItems;
	}

	public ArrayList<Item> getCartItems() {
		return cartItems;
	}

	public void setCartItems(ArrayList<Item> cartItems) {
		this.cartItems = cartItems;
	}
	
	public void deleteAllItems() {
		cartItems = new ArrayList<>();
	}

	public void insertToCart(Phone phone, int quantity) {
		if(checkItem(phone)) {
			for(Item i: cartItems) {
				if(i.getPhone().getPhoneID() == phone.getPhoneID())
					i.setQuantity(i.getQuantity() + quantity);
			}
		}
		else
			cartItems.add(new Item(phone, quantity));
	}
	
	public void deleteItem(Phone phone) {
			for(Item i: cartItems) {
				if(i.getPhone().getPhoneID() == phone.getPhoneID()) {
					cartItems.remove(i);
					return;
				}
			}
	}
	
	
	public void updateQuantity(Phone phone, int quantity) {
		for(Item i: cartItems) {
			if(i.getPhone().getPhoneID() == phone.getPhoneID()) {
				i.setQuantity(quantity);
				return;
			}
		}
	}
	protected boolean checkItem(Phone phone) {
		for(Item i: cartItems) {
			if(i.getPhone().getPhoneID() == phone.getPhoneID())
				return true;
		}
		return false;
	}

	public int getQuantity(Phone phone) {
		for(Item i: cartItems) {
			if(i.getPhone().getPhoneID() == phone.getPhoneID())
				return i.getQuantity();
		}
		return 0;
	}
	/*public void removeToCart(Long product) {
		boolean bln = cartItems.containsKey(product);
		if (bln) {
			cartItems.remove(product);
		}
	}*/

	public int countItem() {
		int count = 0;
		for (Item i: cartItems) {
			count += i.getQuantity();
		}
		return count;
	}

	public Long total() {
		Long count = (long) 0;
		for (Item i: cartItems) {
			count += i.getPhone().getPrice() * i.getQuantity();
		}
		return count;
	}
	
	
}
