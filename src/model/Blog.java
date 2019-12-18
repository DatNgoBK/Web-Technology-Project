package model;

import java.sql.Timestamp;

public class Blog {

	private int id;
	private String title;
	private String image;
	private String intro;
	private String content;
	private java.sql.Timestamp postedAt;
	private String author;
	
	public Blog() {
		super();
	}	
	
	public Blog(int id, String title, String image, String intro, String content, Timestamp postedAt, String author) {
		super();
		this.id = id;
		this.title = title;
		this.image = image;
		this.intro = intro;
		this.content = content;
		this.postedAt = postedAt;
		this.author = author;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}	
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public java.sql.Timestamp getPostedAt() {
		return postedAt;
	}
	public void setPostedAt(java.sql.Timestamp postedAt) {
		this.postedAt = postedAt;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	
	
	
}
