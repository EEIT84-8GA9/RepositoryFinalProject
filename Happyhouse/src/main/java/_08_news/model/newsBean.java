package _08_news.model;

import java.sql.Blob;

public class newsBean {

private Integer new_id;
private String new_title;
private String new_describe;
private java.sql.Date new_date;
private Blob  new_photo1;
private Blob  new_photo2;
private Blob  new_photo3;


@Override
public String toString() {
	return "newsBean [new_id=" + new_id + ", new_title=" + new_title
			+ ", new_describe=" + new_describe + ", new_date=" + new_date
			+ ", new_photo1=" + new_photo1 + ", new_photo2=" + new_photo2
			+ ", new_photo3=" + new_photo3 + "]";
}

public Integer getNew_id() {
	return new_id;
}

public void setNew_id(Integer new_id) {
	this.new_id = new_id;
}

public String getNew_title() {
	return new_title;
}

public void setNew_title(String new_title) {
	this.new_title = new_title;
}

public String getNew_describe() {
	return new_describe;
}

public void setNew_describe(String new_describe) {
	this.new_describe = new_describe;
}

public java.sql.Date getNew_date() {
	return new_date;
}

public void setNew_date(java.sql.Date new_date) {
	this.new_date = new_date;
}

public Blob getNew_photo1() {
	return new_photo1;
}

public void setNew_photo1(Blob new_photo1) {
	this.new_photo1 = new_photo1;
}

public Blob getNew_photo2() {
	return new_photo2;
}

public void setNew_photo2(Blob new_photo2) {
	this.new_photo2 = new_photo2;
}

public Blob getNew_photo3() {
	return new_photo3;
}

public void setNew_photo3(Blob new_photo3) {
	this.new_photo3 = new_photo3;
}



	
	
	
	
}
