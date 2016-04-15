package _09_furniture.model;

import java.util.Arrays;

public class FurnitureBean {

	private int furniture_id;
	private String user_account;
	private String furniture_neme;
	private double furniture_price;
	private String furniture_status;
	private String furniture_time;
	private String furniture_address;
	private byte[] furniture_photo1;
	private byte[] furniture_photo2;
	private String furniture_message;
	private String furniture_type;

	public int getFurniture_id() {
		return furniture_id;
	}

	public void setFurniture_id(int furniture_id) {
		this.furniture_id = furniture_id;
	}

	public String getUser_account() {
		return user_account;
	}

	public void setUser_account(String user_account) {
		this.user_account = user_account;
	}

	public String getFurniture_neme() {
		return furniture_neme;
	}

	public void setFurniture_neme(String furniture_neme) {
		this.furniture_neme = furniture_neme;
	}

	public double getFurniture_price() {
		return furniture_price;
	}

	public void setFurniture_price(double furniture_price) {
		this.furniture_price = furniture_price;
	}

	public String getFurniture_status() {
		return furniture_status;
	}

	public void setFurniture_status(String furniture_status) {
		this.furniture_status = furniture_status;
	}

	public String getFurniture_time() {
		return furniture_time;
	}

	public void setFurniture_time(String furniture_time) {
		this.furniture_time = furniture_time;
	}



	public String getFurniture_address() {
		return furniture_address;
	}

	public void setFurniture_address(String furniture_address) {
		this.furniture_address = furniture_address;
	}



	public byte[] getFurniture_photo1() {
		return furniture_photo1;
	}

	public void setFurniture_photo1(byte[] furniture_photo1) {
		this.furniture_photo1 = furniture_photo1;
	}

	public byte[] getFurniture_photo2() {
		return furniture_photo2;
	}

	public void setFurniture_photo2(byte[] furniture_photo2) {
		this.furniture_photo2 = furniture_photo2;
	}

	public String getFurniture_message() {
		return furniture_message;
	}

	public void setFurniture_message(String furniture_message) {
		this.furniture_message = furniture_message;
	}

	public String getFurniture_type() {
		return furniture_type;
	}

	public void setFurniture_type(String furniture_type) {
		this.furniture_type = furniture_type;
	}

	@Override
	public String toString() {
		return "FurnitureBean [furniture_id=" + furniture_id
				+ ", user_account=" + user_account + ", furniture_neme="
				+ furniture_neme + ", furniture_price=" + furniture_price
				+ ", furniture_status=" + furniture_status
				+ ", furniture_time=" + furniture_time + ", furniture_address="
				+ furniture_address + ", furniture_photo1="
				+ Arrays.toString(furniture_photo1) + ", furniture_photo2="
				+ Arrays.toString(furniture_photo2) + ", furniture_message="
				+ furniture_message + ", furniture_type=" + furniture_type
				+ "]";
	}

	

}
