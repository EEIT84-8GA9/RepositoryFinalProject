package _09_furniture.model;

import java.sql.Blob;
import java.util.Arrays;

public class FurnitureBean {

	private int furniture_id;
	private String user_account;
	private String furniture_name;
	private double furniture_price;
	private String furniture_status;
	private String furniture_time;
	private String furniture_address;
	private String furniture_message;
	private String furniture_type;
	private String Furnitur_photo1_name;
	private String Furnitur_photo2_name;
	private	Blob   Furnitur_photo1;
	private	Blob   Furnitur_photo2;
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

	public String getFurniture_name() {
		return furniture_name;
	}

	public void setFurniture_name(String furniture_name) {
		this.furniture_name = furniture_name;
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
	
	
	
	
	public String getFurnitur_photo1_name() {
		return Furnitur_photo1_name;
	}

	public void setFurnitur_photo1_name(String furnitur_photo1_name) {
		Furnitur_photo1_name = furnitur_photo1_name;
	}

	public String getFurnitur_photo2_name() {
		return Furnitur_photo2_name;
	}

	public void setFurnitur_photo2_name(String furnitur_photo2_name) {
		Furnitur_photo2_name = furnitur_photo2_name;
	}

	public Blob getFurnitur_photo1() {
		return Furnitur_photo1;
	}

	public void setFurnitur_photo1(Blob furnitur_photo1) {
		Furnitur_photo1 = furnitur_photo1;
	}

	public Blob getFurnitur_photo2() {
		return Furnitur_photo2;
	}

	public void setFurnitur_photo2(Blob furnitur_photo2) {
		Furnitur_photo2 = furnitur_photo2;
	}






	

}
