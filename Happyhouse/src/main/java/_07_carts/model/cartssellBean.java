package _07_carts.model;

import java.sql.Blob;

public class cartssellBean {
	
	
private Integer cart_id;
private String user_account;
private Integer sellhouse_id;
private	String sellhouse_name;
private	float sellhouse_price;
private String sellhouse_patterns;
private	String sellhouse_address;
private	String sellhouse_describe;
private	float sellhouse_size;
private	String sellhouse_floor;
private	float	sellhouse_age;
private String  sellhouse_photo1_name;
private	Blob	sellhouse_photo1;
private String  sellhouse_photo2_name;
private	Blob	sellhouse_photo2;
private String  sellhouse_photo3_name;
private	Blob	sellhouse_photo3;

/* (non-Javadoc)
 * @see java.lang.Object#toString()
 */
@Override
public String toString() {
	return "cartssellBean [cart_id=" + cart_id + ", user_account="
			+ user_account + ", sellhouse_id=" + sellhouse_id
			+ ", sellhouse_name=" + sellhouse_name + ", sellhouse_price="
			+ sellhouse_price + ", sellhouse_patterns=" + sellhouse_patterns
			+ ", sellhouse_address=" + sellhouse_address
			+ ", sellhouse_describe=" + sellhouse_describe
			+ ", sellhouse_size=" + sellhouse_size + ", sellhouse_floor="
			+ sellhouse_floor + ", sellhouse_age=" + sellhouse_age
			+ ", sellhouse_photo1_name=" + sellhouse_photo1_name
			+ ", sellhouse_photo1=" + sellhouse_photo1
			+ ", sellhouse_photo2_name=" + sellhouse_photo2_name
			+ ", sellhouse_photo2=" + sellhouse_photo2
			+ ", sellhouse_photo3_name=" + sellhouse_photo3_name
			+ ", sellhouse_photo3=" + sellhouse_photo3 + "]";
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
 * @return the sellhouse_id
 */
public Integer getSellhouse_id() {
	return sellhouse_id;
}

/**
 * @param sellhouse_id the sellhouse_id to set
 */
public void setSellhouse_id(Integer sellhouse_id) {
	this.sellhouse_id = sellhouse_id;
}

/**
 * @return the sellhouse_name
 */
public String getSellhouse_name() {
	return sellhouse_name;
}

/**
 * @param sellhouse_name the sellhouse_name to set
 */
public void setSellhouse_name(String sellhouse_name) {
	this.sellhouse_name = sellhouse_name;
}

/**
 * @return the sellhouse_price
 */
public float getSellhouse_price() {
	return sellhouse_price;
}

/**
 * @param sellhouse_price the sellhouse_price to set
 */
public void setSellhouse_price(float sellhouse_price) {
	this.sellhouse_price = sellhouse_price;
}

/**
 * @return the sellhouse_patterns
 */
public String getSellhouse_patterns() {
	return sellhouse_patterns;
}

/**
 * @param sellhouse_patterns the sellhouse_patterns to set
 */
public void setSellhouse_patterns(String sellhouse_patterns) {
	this.sellhouse_patterns = sellhouse_patterns;
}

/**
 * @return the sellhouse_address
 */
public String getSellhouse_address() {
	return sellhouse_address;
}

/**
 * @param sellhouse_address the sellhouse_address to set
 */
public void setSellhouse_address(String sellhouse_address) {
	this.sellhouse_address = sellhouse_address;
}

/**
 * @return the sellhouse_describe
 */
public String getSellhouse_describe() {
	return sellhouse_describe;
}

/**
 * @param sellhouse_describe the sellhouse_describe to set
 */
public void setSellhouse_describe(String sellhouse_describe) {
	this.sellhouse_describe = sellhouse_describe;
}

/**
 * @return the sellhouse_size
 */
public float getSellhouse_size() {
	return sellhouse_size;
}

/**
 * @param sellhouse_size the sellhouse_size to set
 */
public void setSellhouse_size(float sellhouse_size) {
	this.sellhouse_size = sellhouse_size;
}

/**
 * @return the sellhouse_floor
 */
public String getSellhouse_floor() {
	return sellhouse_floor;
}

/**
 * @param sellhouse_floor the sellhouse_floor to set
 */
public void setSellhouse_floor(String sellhouse_floor) {
	this.sellhouse_floor = sellhouse_floor;
}

/**
 * @return the sellhouse_age
 */
public float getSellhouse_age() {
	return sellhouse_age;
}

/**
 * @param sellhouse_age the sellhouse_age to set
 */
public void setSellhouse_age(float sellhouse_age) {
	this.sellhouse_age = sellhouse_age;
}

/**
 * @return the sellhouse_photo1_name
 */
public String getSellhouse_photo1_name() {
	return sellhouse_photo1_name;
}

/**
 * @param sellhouse_photo1_name the sellhouse_photo1_name to set
 */
public void setSellhouse_photo1_name(String sellhouse_photo1_name) {
	this.sellhouse_photo1_name = sellhouse_photo1_name;
}

/**
 * @return the sellhouse_photo1
 */
public Blob getSellhouse_photo1() {
	return sellhouse_photo1;
}

/**
 * @param sellhouse_photo1 the sellhouse_photo1 to set
 */
public void setSellhouse_photo1(Blob sellhouse_photo1) {
	this.sellhouse_photo1 = sellhouse_photo1;
}

/**
 * @return the sellhouse_photo2_name
 */
public String getSellhouse_photo2_name() {
	return sellhouse_photo2_name;
}

/**
 * @param sellhouse_photo2_name the sellhouse_photo2_name to set
 */
public void setSellhouse_photo2_name(String sellhouse_photo2_name) {
	this.sellhouse_photo2_name = sellhouse_photo2_name;
}

/**
 * @return the sellhouse_photo2
 */
public Blob getSellhouse_photo2() {
	return sellhouse_photo2;
}

/**
 * @param sellhouse_photo2 the sellhouse_photo2 to set
 */
public void setSellhouse_photo2(Blob sellhouse_photo2) {
	this.sellhouse_photo2 = sellhouse_photo2;
}

/**
 * @return the sellhouse_photo3_name
 */
public String getSellhouse_photo3_name() {
	return sellhouse_photo3_name;
}

/**
 * @param sellhouse_photo3_name the sellhouse_photo3_name to set
 */
public void setSellhouse_photo3_name(String sellhouse_photo3_name) {
	this.sellhouse_photo3_name = sellhouse_photo3_name;
}

/**
 * @return the sellhouse_photo3
 */
public Blob getSellhouse_photo3() {
	return sellhouse_photo3;
}

/**
 * @param sellhouse_photo3 the sellhouse_photo3 to set
 */
public void setSellhouse_photo3(Blob sellhouse_photo3) {
	this.sellhouse_photo3 = sellhouse_photo3;
}





























}




