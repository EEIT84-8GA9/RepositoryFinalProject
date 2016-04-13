package _02_sellhouse.model;

import java.io.Serializable;
import java.sql.Blob;

public class SellHouseBean implements Serializable{
	private int	sellhouse_id;
	private String	user_account;
	private	String sellhouse_name;
	private	float sellhouse_price;
	private String sellhouse_patterns;
	private	String sellhouse_address;
	private	String sellhouse_describe;
	private	float sellhouse_size;
	private	String sellhouse_floor;
	private	float	sellhouse_age;
	private String sellhouse_photo1_name;
	private	Blob	sellhouse_photo1;
	private String sellhouse_photo2_name;
	private	Blob	sellhouse_photo2;
	private String sellhouse_photo3_name;
	private	Blob	sellhouse_photo3;
	private	String	sellhouse_type;
	private	String	sellhouse_message;
	private java.util.Date	sellhouse_date;
	private	String	sellhouse_car;
	private	String sellhouse_phone;
	private	String	sellhouse_email;
	
	

	
	
	
	@Override
	public String toString() {
		return "SellHouseBean [sellhouse_id=" + sellhouse_id
				+ ", user_account=" + user_account + ", sellhouse_name="
				+ sellhouse_name + ", sellhouse_price=" + sellhouse_price
				+ ", sellhouse_patterns=" + sellhouse_patterns
				+ ", sellhouse_address=" + sellhouse_address
				+ ", sellhouse_describe=" + sellhouse_describe
				+ ", sellhouse_size=" + sellhouse_size + ", sellhouse_floor="
				+ sellhouse_floor + ", sellhouse_age=" + sellhouse_age
				+ ", sellhouse_photo1=" + sellhouse_photo1
				+ ", sellhouse_photo2=" + sellhouse_photo2
				+ ", sellhouse_photo3=" + sellhouse_photo3
				+ ", sellhouse_type=" + sellhouse_type + ", sellhouse_message="
				+ sellhouse_message + ", sellhouse_date=" + sellhouse_date
				+ ", sellhouse_car=" + sellhouse_car + ", sellhouse_phone="
				+ sellhouse_phone + ", sellhouse_email=" + sellhouse_email
				+ "]";
	}


	public int getSellhouse_id() {
		return sellhouse_id;
	}


	public void setSellhouse_id(int sellhouse_id) {
		this.sellhouse_id = sellhouse_id;
	}


	public String getUser_account() {
		return user_account;
	}
	public Blob getSellhouse_photo1() {
		return sellhouse_photo1;
	}
	public void setSellhouse_photo1(Blob sellhouse_photo1) {
		this.sellhouse_photo1 = sellhouse_photo1;
	}
	public Blob getSellhouse_photo2() {
		return sellhouse_photo2;
	}
	public void setSellhouse_photo2(Blob sellhouse_photo2) {
		this.sellhouse_photo2 = sellhouse_photo2;
	}
	public Blob getSellhouse_photo3() {
		return sellhouse_photo3;
	}
	public void setSellhouse_photo3(Blob sellhouse_photo3) {
		this.sellhouse_photo3 = sellhouse_photo3;
	}
	public void setUser_account(String user_account) {
		this.user_account = user_account;
	}
	
	
	public String getSellhouse_name() {
		return sellhouse_name;
	}


	public void setSellhouse_name(String sellhouse_name) {
		this.sellhouse_name = sellhouse_name;
	}


	public String getSellhouse_photo1_name() {
		return sellhouse_photo1_name;
	}


	public void setSellhouse_photo1_name(String sellhouse_photo1_name) {
		this.sellhouse_photo1_name = sellhouse_photo1_name;
	}


	public String getSellhouse_photo2_name() {
		return sellhouse_photo2_name;
	}


	public void setSellhouse_photo2_name(String sellhouse_photo2_name) {
		this.sellhouse_photo2_name = sellhouse_photo2_name;
	}


	public String getSellhouse_photo3_name() {
		return sellhouse_photo3_name;
	}


	public void setSellhouse_photo3_name(String sellhouse_photo3_name) {
		this.sellhouse_photo3_name = sellhouse_photo3_name;
	}


	public float getSellhouse_price() {
		return sellhouse_price;
	}
	public void setSellhouse_price(float sellhouse_price) {
		this.sellhouse_price = sellhouse_price;
	}
	public String getSellhouse_patterns() {
		return sellhouse_patterns;
	}
	public void setSellhouse_patterns(String sellhouse_patterns) {
		this.sellhouse_patterns = sellhouse_patterns;
	}
	public String getSellhouse_address() {
		return sellhouse_address;
	}
	public void setSellhouse_address(String sellhouse_address) {
		this.sellhouse_address = sellhouse_address;
	}
	public String getSellhouse_describe() {
		return sellhouse_describe;
	}
	public void setSellhouse_describe(String sellhouse_describe) {
		this.sellhouse_describe = sellhouse_describe;
	}
	public float getSellhouse_size() {
		return sellhouse_size;
	}
	public void setSellhouse_size(float sellhouse_size) {
		this.sellhouse_size = sellhouse_size;
	}
	public String getSellhouse_floor() {
		return sellhouse_floor;
	}
	public void setSellhouse_floor(String sellhouse_floor) {
		this.sellhouse_floor = sellhouse_floor;
	}
	public float getSellhouse_age() {
		return sellhouse_age;
	}
	public void setSellhouse_age(float sellhouse_age) {
		this.sellhouse_age = sellhouse_age;
	}
	
	public String getSellhouse_type() {
		return sellhouse_type;
	}
	public void setSellhouse_type(String sellhouse_type) {
		this.sellhouse_type = sellhouse_type;
	}
	public String getSellhouse_message() {
		return sellhouse_message;
	}
	public void setSellhouse_message(String sellhouse_message) {
		this.sellhouse_message = sellhouse_message;
	}
	public java.util.Date getSellhouse_date() {
		return sellhouse_date;
	}
	public void setSellhouse_date(java.util.Date sellhouse_date) {
		this.sellhouse_date = sellhouse_date;
	}
	public String getSellhouse_car() {
		return sellhouse_car;
	}
	public void setSellhouse_car(String sellhouse_car) {
		this.sellhouse_car = sellhouse_car;
	}
	
	public String getSellhouse_email() {
		return sellhouse_email;
	}
	public void setSellhouse_email(String sellhouse_email) {
		this.sellhouse_email = sellhouse_email;
	}
	public String getSellhouse_phone() {
		return sellhouse_phone;
	}
	public void setSellhouse_phone(String sellhouse_phone) {
		this.sellhouse_phone = sellhouse_phone;
	}
	
	
	
	
	
}
