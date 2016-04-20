package _08_news.model;

import java.sql.Blob;

public class newsBean {

private Integer new_id;
private String new_title;
private String new_describe;
private java.sql.Date new_date;
private String new_photo1_name;
private Blob  new_photo1;
private String new_photo2_name;
private Blob  new_photo2;
private String new_photo3_name;
private Blob  new_photo3;
/* (non-Javadoc)
 * @see java.lang.Object#toString()
 */
@Override
public String toString() {
	return "newsBean [new_id=" + new_id + ", new_title=" + new_title
			+ ", new_describe=" + new_describe + ", new_date=" + new_date
			+ ", new_photo1_name=" + new_photo1_name + ", new_photo1="
			+ new_photo1 + ", new_photo2_name=" + new_photo2_name
			+ ", new_photo2=" + new_photo2 + ", new_photo3_name="
			+ new_photo3_name + ", new_photo3=" + new_photo3 + "]";
}
/**
 * @return the new_id
 */
public Integer getNew_id() {
	return new_id;
}
/**
 * @param new_id the new_id to set
 */
public void setNew_id(Integer new_id) {
	this.new_id = new_id;
}
/**
 * @return the new_title
 */
public String getNew_title() {
	return new_title;
}
/**
 * @param new_title the new_title to set
 */
public void setNew_title(String new_title) {
	this.new_title = new_title;
}
/**
 * @return the new_describe
 */
public String getNew_describe() {
	return new_describe;
}
/**
 * @param new_describe the new_describe to set
 */
public void setNew_describe(String new_describe) {
	this.new_describe = new_describe;
}
/**
 * @return the new_date
 */
public java.sql.Date getNew_date() {
	return new_date;
}
/**
 * @param new_date the new_date to set
 */
public void setNew_date(java.sql.Date new_date) {
	this.new_date = new_date;
}
/**
 * @return the new_photo1_name
 */
public String getNew_photo1_name() {
	return new_photo1_name;
}
/**
 * @param new_photo1_name the new_photo1_name to set
 */
public void setNew_photo1_name(String new_photo1_name) {
	this.new_photo1_name = new_photo1_name;
}
/**
 * @return the new_photo1
 */
public Blob getNew_photo1() {
	return new_photo1;
}
/**
 * @param new_photo1 the new_photo1 to set
 */
public void setNew_photo1(Blob new_photo1) {
	this.new_photo1 = new_photo1;
}
/**
 * @return the new_photo2_name
 */
public String getNew_photo2_name() {
	return new_photo2_name;
}
/**
 * @param new_photo2_name the new_photo2_name to set
 */
public void setNew_photo2_name(String new_photo2_name) {
	this.new_photo2_name = new_photo2_name;
}
/**
 * @return the new_photo2
 */
public Blob getNew_photo2() {
	return new_photo2;
}
/**
 * @param new_photo2 the new_photo2 to set
 */
public void setNew_photo2(Blob new_photo2) {
	this.new_photo2 = new_photo2;
}
/**
 * @return the new_photo3_name
 */
public String getNew_photo3_name() {
	return new_photo3_name;
}
/**
 * @param new_photo3_name the new_photo3_name to set
 */
public void setNew_photo3_name(String new_photo3_name) {
	this.new_photo3_name = new_photo3_name;
}
/**
 * @return the new_photo3
 */
public Blob getNew_photo3() {
	return new_photo3;
}
/**
 * @param new_photo3 the new_photo3 to set
 */
public void setNew_photo3(Blob new_photo3) {
	this.new_photo3 = new_photo3;
}



	
	
	
	
}
