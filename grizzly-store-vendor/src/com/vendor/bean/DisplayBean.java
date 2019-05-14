package com.vendor.bean;

public class DisplayBean {
	//ProductDetailsBean product = new ProductDetailsBean();
	//VendorDetailsBean vendor = new VendorDetailsBean();
	//BrandTableBean brand = new BrandTableBean();
	private int prodId;
	private String prodName;
	private String category;
	private String brandName;
	private String description;
	private int price;
	private float offer;
	private float rating;
	
	
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	public int getProdId() {
		return prodId;
	}
	public float getRating() {
		return rating;
	}
	public void setRating(float rating) {
		this.rating = rating;
	}
	public void setProdId(int prodId) {
		this.prodId = prodId;
	}
	public String getProdName() {
		return prodName;
	}
	public void setProdName(String prodName) {
		this.prodName = prodName;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getBrandName() {
		return brandName;
	}
	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}
	public float getOffer() {
		return offer;
	}
	public void setOffer(float offer) {
		this.offer = offer;
	}
	
}
