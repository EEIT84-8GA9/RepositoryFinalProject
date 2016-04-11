package _05_sms.model;

public class SmsVO {
	private Integer sms_id;
	private String user_account; 
	private String sms_mailers;
	private String sms_title;
	private String sms_describe;
	private java.sql.Date sms_date;
	
	public SmsVO() {
		super();
	}
	
	public Integer getSms_id() {
		return sms_id;
	}

	public void setSms_id(Integer sms_id) {
		this.sms_id = sms_id;
	}

	public String getUser_account() {
		return user_account;
	}
	public void setUser_account(String user_account) {
		this.user_account = user_account;
	}
	public String getSms_mailers() {
		return sms_mailers;
	}
	public void setSms_mailers(String sms_mailers) {
		this.sms_mailers = sms_mailers;
	}
	public String getSms_title() {
		return sms_title;
	}
	public void setSms_title(String sms_title) {
		this.sms_title = sms_title;
	}
	public String getSms_describe() {
		return sms_describe;
	}
	public void setSms_describe(String sms_describe) {
		this.sms_describe = sms_describe;
	}
	public java.sql.Date getSms_date() {
		return sms_date;
	}
	public void setSms_date(java.sql.Date sms_date) {
		this.sms_date = sms_date;
	}
	
}
