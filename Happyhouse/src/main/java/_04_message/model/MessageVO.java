package _04_message.model;

public class MessageVO {
	private Integer message_id;
	private String user_account;
	private String message_title;
	private String message_describe;
	private java.sql.Date message_date;
	private String message_type;
	private String message_actiontype;
	private String user_name;
	private String message_reportfrom;
	private String message_reportreason;
	public MessageVO() {
		super();
	}
	
	public String getMessage_actiontype() {
		return message_actiontype;
	}

	public void setMessage_actiontype(String message_actiontype) {
		this.message_actiontype = message_actiontype;
	}

	public Integer getMessage_id() {
		return message_id;
	}

	public void setMessage_id(Integer message_id) {
		this.message_id = message_id;
	}

	public String getUser_account() {
		return user_account;
	}
	public void setUser_account(String user_account) {
		this.user_account = user_account;
	}
	public String getMessage_title() {
		return message_title;
	}
	public void setMessage_title(String message_title) {
		this.message_title = message_title;
	}
	public String getMessage_describe() {
		return message_describe;
	}
	public void setMessage_describe(String message_describe) {
		this.message_describe = message_describe;
	}
	
	public java.sql.Date getMessage_date() {
		return message_date;
	}

	public void setMessage_date(java.sql.Date message_date) {
		this.message_date = message_date;
	}

	public String getMessage_type() {
		return message_type;
	}
	public void setMessage_type(String message_type) {
		this.message_type = message_type;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getMessage_reportfrom() {
		return message_reportfrom;
	}

	public void setMessage_reportfrom(String message_reportfrom) {
		this.message_reportfrom = message_reportfrom;
	}

	public String getMessage_reportreason() {
		return message_reportreason;
	}

	public void setMessage_reportreason(String message_reportreason) {
		this.message_reportreason = message_reportreason;
	}
	
}
