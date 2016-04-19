package _03_renthouse.model;

import java.sql.Blob;

public class RentHouseBean {
private int	renthouse_id;
private	String user_account;
private	String	renthouse_name;
private	float	renthouse_price;
private	String	renthouse_deposit;
private	String	renthouse_patterns;
private	String	renthouse_address;
private	String	renthouse_describe;
private	float	renthouse_size;
private	String	renthouse_floor;
private	String	renthouse_rentdate;
private String renthouse_photo1_name;
private	Blob	renthouse_photo1;
private String renthouse_photo2_name;
private	Blob	renthouse_photo2;
private String renthouse_photo3_name;
private	Blob	renthouse_photo3;
private	String	renthouse_type;
private	String	renthouse_message;
private	java.util.Date	renthouse_date;
private	String	renthouse_car;
private	String	renthouse_phone;
private	String	renthouse_email;
private String renthouse_reportfrom;
private String renthouse_reportreason;
private String user_name;
@Override
public String toString() {
	return "RentHouseBean [renthouse_id=" + renthouse_id + ", user_account="
			+ user_account + ", renthouse_name=" + renthouse_name
			+ ", renthouse_price=" + renthouse_price + ", renthouse_deposit="
			+ renthouse_deposit + ", renthouse_patterns=" + renthouse_patterns
			+ ", renthouse_address=" + renthouse_address
			+ ", renthouse_describe=" + renthouse_describe
			+ ", renthouse_size=" + renthouse_size + ", renthouse_floor="
			+ renthouse_floor + ", renthouse_rentdate=" + renthouse_rentdate
			+ ", renthouse_photo1=" + renthouse_photo1 + ", renthouse_photo2="
			+ renthouse_photo2 + ", renthouse_photo3=" + renthouse_photo3
			+ ", renthouse_type=" + renthouse_type + ", renthouse_message="
			+ renthouse_message + ", renthouse_date=" + renthouse_date
			+ ", renthouse_car=" + renthouse_car + ", renthouse_phone="
			+ renthouse_phone + ", renthouse_email=" + renthouse_email + "]";
}



public String getUser_name() {
	return user_name;
}



public void setUser_name(String user_name) {
	this.user_name = user_name;
}



public int getRenthouse_id() {
	return renthouse_id;
}
public void setRenthouse_id(int renthouse_id) {
	this.renthouse_id = renthouse_id;
}
public String getUser_account() {
	return user_account;
}
public void setUser_account(String user_account) {
	this.user_account = user_account;
}
public String getRenthouse_name() {
	return renthouse_name;
}
public void setRenthouse_name(String renthouse_name) {
	this.renthouse_name = renthouse_name;
}
public float getRenthouse_price() {
	return renthouse_price;
}
public void setRenthouse_price(float renthouse_price) {
	this.renthouse_price = renthouse_price;
}
public String getRenthouse_deposit() {
	return renthouse_deposit;
}
public void setRenthouse_deposit(String renthouse_deposit) {
	this.renthouse_deposit = renthouse_deposit;
}
public String getRenthouse_patterns() {
	return renthouse_patterns;
}
public void setRenthouse_patterns(String renthouse_patterns) {
	this.renthouse_patterns = renthouse_patterns;
}
public String getRenthouse_address() {
	return renthouse_address;
}
public void setRenthouse_address(String renthouse_address) {
	this.renthouse_address = renthouse_address;
}
public String getRenthouse_describe() {
	return renthouse_describe;
}
public void setRenthouse_describe(String renthouse_describe) {
	this.renthouse_describe = renthouse_describe;
}
public float getRenthouse_size() {
	return renthouse_size;
}
public void setRenthouse_size(float renthouse_size) {
	this.renthouse_size = renthouse_size;
}
public String getRenthouse_floor() {
	return renthouse_floor;
}
public void setRenthouse_floor(String renthouse_floor) {
	this.renthouse_floor = renthouse_floor;
}
public String getRenthouse_rentdate() {
	return renthouse_rentdate;
}
public void setRenthouse_rentdate(String renthouse_rentdate) {
	this.renthouse_rentdate = renthouse_rentdate;
}
public Blob getRenthouse_photo1() {
	return renthouse_photo1;
}
public void setRenthouse_photo1(Blob renthouse_photo1) {
	this.renthouse_photo1 = renthouse_photo1;
}
public Blob getRenthouse_photo2() {
	return renthouse_photo2;
}
public void setRenthouse_photo2(Blob renthouse_photo2) {
	this.renthouse_photo2 = renthouse_photo2;
}
public Blob getRenthouse_photo3() {
	return renthouse_photo3;
}
public void setRenthouse_photo3(Blob renthouse_photo3) {
	this.renthouse_photo3 = renthouse_photo3;
}
public String getRenthouse_type() {
	return renthouse_type;
}
public void setRenthouse_type(String renthouse_type) {
	this.renthouse_type = renthouse_type;
}
public String getRenthouse_message() {
	return renthouse_message;
}
public void setRenthouse_message(String renthouse_message) {
	this.renthouse_message = renthouse_message;
}
public java.util.Date getRenthouse_date() {
	return renthouse_date;
}
public void setRenthouse_date(java.util.Date renthouse_date) {
	this.renthouse_date = renthouse_date;
}
public String getRenthouse_car() {
	return renthouse_car;
}
public void setRenthouse_car(String renthouse_car) {
	this.renthouse_car = renthouse_car;
}
public String getRenthouse_phone() {
	return renthouse_phone;
}
public void setRenthouse_phone(String renthouse_phone) {
	this.renthouse_phone = renthouse_phone;
}
public String getRenthouse_email() {
	return renthouse_email;
}
public void setRenthouse_email(String renthouse_email) {
	this.renthouse_email = renthouse_email;
}
public String getRenthouse_reportfrom() {
	return renthouse_reportfrom;
}
public void setRenthouse_reportfrom(String renthouse_reportfrom) {
	this.renthouse_reportfrom = renthouse_reportfrom;
}
public String getRenthouse_reportreason() {
	return renthouse_reportreason;
}
public void setRenthouse_reportreason(String renthouse_reportreason) {
	this.renthouse_reportreason = renthouse_reportreason;
}



public String getRenthouse_photo1_name() {
	return renthouse_photo1_name;
}



public void setRenthouse_photo1_name(String renthouse_photo1_name) {
	this.renthouse_photo1_name = renthouse_photo1_name;
}



public String getRenthouse_photo2_name() {
	return renthouse_photo2_name;
}



public void setRenthouse_photo2_name(String renthouse_photo2_name) {
	this.renthouse_photo2_name = renthouse_photo2_name;
}



public String getRenthouse_photo3_name() {
	return renthouse_photo3_name;
}



public void setRenthouse_photo3_name(String renthouse_photo3_name) {
	this.renthouse_photo3_name = renthouse_photo3_name;
}





	
	
}
