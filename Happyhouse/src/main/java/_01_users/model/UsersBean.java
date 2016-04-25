package _01_users.model;


import java.sql.Blob;
import java.util.Arrays;

public class UsersBean {
	/*
	 * [user_account] vachar ,[user_password] vachar ,[user_name] vachar
	 * ,[user_address] vachar ,[user_phone] decimal(10, 0) ,[user_email] vachar
	 * ,[user_gender] vachar ,[user_type] vachar ,[user_photo] varbinary(MAX)
	 */
	private String user_account;
	private String user_password;
	private String user_name;
	private String user_address;
	private String user_phone;
	private String user_email;
	private String user_gender;
	private String user_type;
	private String user_photo1_name;
	private	Blob   user_photo1;
	public String getUser_account() {
		return user_account;
	}
	public void setUser_account(String user_account) {
		this.user_account = user_account;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_address() {
		return user_address;
	}
	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_gender() {
		return user_gender;
	}
	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}
	public String getUser_type() {
		return user_type;
	}
	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}
	public String getUser_photo1_name() {
		return user_photo1_name;
	}
	public void setUser_photo1_name(String user_photo1_name) {
		this.user_photo1_name = user_photo1_name;
	}
	public Blob getUser_photo1() {
		return user_photo1;
	}
	public void setUser_photo1(Blob user_photo1) {
		this.user_photo1 = user_photo1;
	}
	@Override
	public String toString() {
		return "UsersBean [user_account=" + user_account + ", user_password="
				+ user_password + ", user_name=" + user_name
				+ ", user_address=" + user_address + ", user_phone="
				+ user_phone + ", user_email=" + user_email + ", user_gender="
				+ user_gender + ", user_type=" + user_type
				+ ", user_photo1_name=" + user_photo1_name + ", user_photo1="
				+ user_photo1 + "]";
	}

	


}
