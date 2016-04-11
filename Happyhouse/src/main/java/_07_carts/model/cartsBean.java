package _07_carts.model;

import java.sql.*;


public class cartsBean {

private Integer cart_id;
private String user_account;
private Integer house_id;
private java.sql.Date catr_date;



@Override
public String toString() {
	return "CartBean [cart_id=" + cart_id + ", user_account=" + user_account
			+ ", house_id=" + house_id + ", catr_date=" + catr_date + "]";
}

public Integer getCart_id() {
	return cart_id;
}

public void setCart_id(Integer cart_id) {
	this.cart_id = cart_id;
}

public String getUser_account() {
	return user_account;
}

public void setUser_account(String user_account) {
	this.user_account = user_account;
}

public Integer getHouse_id() {
	return house_id;
}

public void setHouse_id(Integer house_id) {
	this.house_id = house_id;
}


public java.sql.Date getCatr_date() {
	return catr_date;
}


public void setCatr_date(java.sql.Date catr_date) {
	this.catr_date = catr_date;
}



	
	
	

	





	
}
