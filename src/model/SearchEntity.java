package model;

public class SearchEntity {

	private String typeSort;
	private int page;
	private String brandID;
	private String price;
	private String ram;
	private String memory;

	public SearchEntity() {
		super();
	}

	public String getTypeSort() {
		return typeSort;
	}

	public void setTypeSort(String typeSort) {
		this.typeSort = typeSort;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public String getBrandID() {
		return brandID;
	}

	public void setBrandID(String brandID) {
		this.brandID = brandID;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getRam() {
		return ram;
	}

	public void setRam(String ram) {
		this.ram = ram;
	}

	public String getMemory() {
		return memory;
	}

	public void setMemory(String memory) {
		this.memory = memory;
	}

}
