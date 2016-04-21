package _03_renthouse.model;

import java.io.InputStream;
import java.util.List;

import _02_sellhouse.model.SellHouseBean;

public interface RentHouseDAO {

	public abstract List<RentHouseBean> SELECT_ALL();

	//標題搜尋
	public abstract List<RentHouseBean> select_renthouse_name(
			String renthouse_name);

	//使用者搜尋
	public abstract List<RentHouseBean> select_user_account(String user_account);

	//價格搜尋
	public abstract List<RentHouseBean> select_renthouse_price(
			float renthouse_price);

	//地址搜尋
	public abstract List<RentHouseBean> select_renthouse_address(
			String renthouse_address);

	//id搜尋
	public abstract RentHouseBean select_renthouse_id(int id);

	public abstract RentHouseBean insert(RentHouseBean bean,InputStream is1,long size1,InputStream is2,long size2,InputStream is3,long size3);

	public abstract RentHouseBean update(RentHouseBean bean,InputStream is1,long size1,InputStream is2,long size2,InputStream is3,long size3);

	public abstract boolean delete(int id);
	
	public abstract RentHouseBean updatereport(RentHouseBean bean);

	public abstract  RentHouseBean GMupdate(RentHouseBean bean);

}