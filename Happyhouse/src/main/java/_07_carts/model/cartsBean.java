package _07_carts.model;

import java.sql.*;


public class cartsBean {

private Integer cart_id;
private String user_account;
private Integer sellhouse_id;
private Integer renthouse_id;
private java.sql.Date cart_date;










/* (non-Javadoc)
 * @see java.lang.Object#toString()
 */
@Override
public String toString() {
	return "cartsBean [cart_id=" + cart_id + ", user_account=" + user_account
			+ ", sellhouse_id=" + sellhouse_id + ", renthouse_id="
			+ renthouse_id + ", cart_date=" + cart_date + "]";
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
 * @return the cart_date
 */
public java.sql.Date getCart_date() {
	return cart_date;
}
/**
 * @param cart_date the cart_date to set
 */
public void setCart_date(java.sql.Date cart_date) {
	this.cart_date = cart_date;
}

















}
