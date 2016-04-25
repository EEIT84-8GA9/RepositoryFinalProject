package _07_carts.model;

import java.sql.Blob;

public class cartsrentBean {
	
	private Integer cart_id;
	private String user_account;
	private Integer renthouse_id;
	private	String renthouse_name;
	private	float renthouse_price;
	private String renthouse_patterns;
	private	String renthouse_address;
	private	String renthouse_describe;
	private	float renthouse_size;
	private	String renthouse_floor;
	private String renthouse_photo1_name;
	private	Blob	renthouse_photo1;
	private String renthouse_photo2_name;
	private	Blob	renthouse_photo2;
	private String renthouse_photo3_name;
	private	Blob	renthouse_photo3;
	
	
	private String user_name;
	private	String	renthouse_message;
	private	java.util.Date	renthouse_date;
	private	String	renthouse_car;
	private	String	renthouse_phone;
	private	String	renthouse_email;
	private	String	renthouse_type;
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "cartsrentBean [cart_id=" + cart_id + ", user_account="
				+ user_account + ", renthouse_id=" + renthouse_id
				+ ", renthouse_name=" + renthouse_name + ", renthouse_price="
				+ renthouse_price + ", renthouse_patterns="
				+ renthouse_patterns + ", renthouse_address="
				+ renthouse_address + ", renthouse_describe="
				+ renthouse_describe + ", renthouse_size=" + renthouse_size
				+ ", renthouse_floor=" + renthouse_floor
				+ ", renthouse_photo1_name=" + renthouse_photo1_name
				+ ", renthouse_photo1=" + renthouse_photo1
				+ ", renthouse_photo2_name=" + renthouse_photo2_name
				+ ", renthouse_photo2=" + renthouse_photo2
				+ ", renthouse_photo3_name=" + renthouse_photo3_name
				+ ", renthouse_photo3=" + renthouse_photo3 + ", user_name="
				+ user_name + ", renthouse_type=" + renthouse_type
				+ ", renthouse_message=" + renthouse_message
				+ ", renthouse_date=" + renthouse_date + ", renthouse_car="
				+ renthouse_car + ", renthouse_phone=" + renthouse_phone
				+ ", renthouse_email=" + renthouse_email + "]";
	}
	/**
	 * @return the cart_id
	 */
	public Integer getCart_id() {
		return cart_id;
	}
	/**
	 * @param cart_id the cart_id to set
	 */
	public void setCart_id(Integer cart_id) {
		this.cart_id = cart_id;
	}
	/**
	 * @return the user_account
	 */
	public String getUser_account() {
		return user_account;
	}
	/**
	 * @param user_account the user_account to set
	 */
	public void setUser_account(String user_account) {
		this.user_account = user_account;
	}
	/**
	 * @return the renthouse_id
	 */
	public Integer getRenthouse_id() {
		return renthouse_id;
	}
	/**
	 * @param renthouse_id the renthouse_id to set
	 */
	public void setRenthouse_id(Integer renthouse_id) {
		this.renthouse_id = renthouse_id;
	}
	/**
	 * @return the renthouse_name
	 */
	public String getRenthouse_name() {
		return renthouse_name;
	}
	/**
	 * @param renthouse_name the renthouse_name to set
	 */
	public void setRenthouse_name(String renthouse_name) {
		this.renthouse_name = renthouse_name;
	}
	/**
	 * @return the renthouse_price
	 */
	public float getRenthouse_price() {
		return renthouse_price;
	}
	/**
	 * @param renthouse_price the renthouse_price to set
	 */
	public void setRenthouse_price(float renthouse_price) {
		this.renthouse_price = renthouse_price;
	}
	/**
	 * @return the renthouse_patterns
	 */
	public String getRenthouse_patterns() {
		return renthouse_patterns;
	}
	/**
	 * @param renthouse_patterns the renthouse_patterns to set
	 */
	public void setRenthouse_patterns(String renthouse_patterns) {
		this.renthouse_patterns = renthouse_patterns;
	}
	/**
	 * @return the renthouse_address
	 */
	public String getRenthouse_address() {
		return renthouse_address;
	}
	/**
	 * @param renthouse_address the renthouse_address to set
	 */
	public void setRenthouse_address(String renthouse_address) {
		this.renthouse_address = renthouse_address;
	}
	/**
	 * @return the renthouse_describe
	 */
	public String getRenthouse_describe() {
		return renthouse_describe;
	}
	/**
	 * @param renthouse_describe the renthouse_describe to set
	 */
	public void setRenthouse_describe(String renthouse_describe) {
		this.renthouse_describe = renthouse_describe;
	}
	/**
	 * @return the renthouse_size
	 */
	public float getRenthouse_size() {
		return renthouse_size;
	}
	/**
	 * @param renthouse_size the renthouse_size to set
	 */
	public void setRenthouse_size(float renthouse_size) {
		this.renthouse_size = renthouse_size;
	}
	/**
	 * @return the renthouse_floor
	 */
	public String getRenthouse_floor() {
		return renthouse_floor;
	}
	/**
	 * @param renthouse_floor the renthouse_floor to set
	 */
	public void setRenthouse_floor(String renthouse_floor) {
		this.renthouse_floor = renthouse_floor;
	}
	/**
	 * @return the renthouse_photo1_name
	 */
	public String getRenthouse_photo1_name() {
		return renthouse_photo1_name;
	}
	/**
	 * @param renthouse_photo1_name the renthouse_photo1_name to set
	 */
	public void setRenthouse_photo1_name(String renthouse_photo1_name) {
		this.renthouse_photo1_name = renthouse_photo1_name;
	}
	/**
	 * @return the renthouse_photo1
	 */
	public Blob getRenthouse_photo1() {
		return renthouse_photo1;
	}
	/**
	 * @param renthouse_photo1 the renthouse_photo1 to set
	 */
	public void setRenthouse_photo1(Blob renthouse_photo1) {
		this.renthouse_photo1 = renthouse_photo1;
	}
	/**
	 * @return the renthouse_photo2_name
	 */
	public String getRenthouse_photo2_name() {
		return renthouse_photo2_name;
	}
	/**
	 * @param renthouse_photo2_name the renthouse_photo2_name to set
	 */
	public void setRenthouse_photo2_name(String renthouse_photo2_name) {
		this.renthouse_photo2_name = renthouse_photo2_name;
	}
	/**
	 * @return the renthouse_photo2
	 */
	public Blob getRenthouse_photo2() {
		return renthouse_photo2;
	}
	/**
	 * @param renthouse_photo2 the renthouse_photo2 to set
	 */
	public void setRenthouse_photo2(Blob renthouse_photo2) {
		this.renthouse_photo2 = renthouse_photo2;
	}
	/**
	 * @return the renthouse_photo3_name
	 */
	public String getRenthouse_photo3_name() {
		return renthouse_photo3_name;
	}
	/**
	 * @param renthouse_photo3_name the renthouse_photo3_name to set
	 */
	public void setRenthouse_photo3_name(String renthouse_photo3_name) {
		this.renthouse_photo3_name = renthouse_photo3_name;
	}
	/**
	 * @return the renthouse_photo3
	 */
	public Blob getRenthouse_photo3() {
		return renthouse_photo3;
	}
	/**
	 * @param renthouse_photo3 the renthouse_photo3 to set
	 */
	public void setRenthouse_photo3(Blob renthouse_photo3) {
		this.renthouse_photo3 = renthouse_photo3;
	}
	/**
	 * @return the user_name
	 */
	public String getUser_name() {
		return user_name;
	}
	/**
	 * @param user_name the user_name to set
	 */
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	/**
	 * @return the renthouse_type
	 */
	public String getRenthouse_type() {
		return renthouse_type;
	}
	/**
	 * @param renthouse_type the renthouse_type to set
	 */
	public void setRenthouse_type(String renthouse_type) {
		this.renthouse_type = renthouse_type;
	}
	/**
	 * @return the renthouse_message
	 */
	public String getRenthouse_message() {
		return renthouse_message;
	}
	/**
	 * @param renthouse_message the renthouse_message to set
	 */
	public void setRenthouse_message(String renthouse_message) {
		this.renthouse_message = renthouse_message;
	}
	/**
	 * @return the renthouse_date
	 */
	public java.util.Date getRenthouse_date() {
		return renthouse_date;
	}
	/**
	 * @param renthouse_date the renthouse_date to set
	 */
	public void setRenthouse_date(java.util.Date renthouse_date) {
		this.renthouse_date = renthouse_date;
	}
	/**
	 * @return the renthouse_car
	 */
	public String getRenthouse_car() {
		return renthouse_car;
	}
	/**
	 * @param renthouse_car the renthouse_car to set
	 */
	public void setRenthouse_car(String renthouse_car) {
		this.renthouse_car = renthouse_car;
	}
	/**
	 * @return the renthouse_phone
	 */
	public String getRenthouse_phone() {
		return renthouse_phone;
	}
	/**
	 * @param renthouse_phone the renthouse_phone to set
	 */
	public void setRenthouse_phone(String renthouse_phone) {
		this.renthouse_phone = renthouse_phone;
	}
	/**
	 * @return the renthouse_email
	 */
	public String getRenthouse_email() {
		return renthouse_email;
	}
	/**
	 * @param renthouse_email the renthouse_email to set
	 */
	public void setRenthouse_email(String renthouse_email) {
		this.renthouse_email = renthouse_email;
	}
	
	

	
	
	
	
	
	
	
	
	
}