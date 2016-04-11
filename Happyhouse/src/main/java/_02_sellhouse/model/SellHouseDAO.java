package _02_sellhouse.model;

import java.util.List;

public interface SellHouseDAO {

	public abstract List<SellHouseBean> SELECT_ALL();

	//標題搜尋
	public abstract List<SellHouseBean> select_sellhouse_name(
			String sellhouse_name);

	//價格搜尋
	public abstract List<SellHouseBean> select_sellhouse_price(
			float sellhouse_price);
	//地址搜尋
	public abstract List<SellHouseBean> select_sellhouse_address(
			String sellhouse_address);

	//id搜尋
	public abstract SellHouseBean select_sellhouse_id(int id);
	//使用者搜尋
	public abstract List<SellHouseBean> select_user_account(String user_account);
	public abstract SellHouseBean insert(SellHouseBean bean);

	public abstract SellHouseBean update(SellHouseBean bean);

	public abstract boolean delete(int id);


}