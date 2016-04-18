package _02_sellhouse.model;

import java.io.InputStream;
import java.util.List;

public interface SellHouseDAO {

	public abstract List<SellHouseBean> SELECT_ALL();

	public abstract List<SellHouseBean> select_sellhouse_name(
			String sellhouse_name);

	public abstract List<SellHouseBean> select_sellhouse_price(
			float sellhouse_price);

	public abstract List<SellHouseBean> select_sellhouse_address(
			String sellhouse_address);

	public abstract List<SellHouseBean> select_user_account(String user_account);

	public abstract SellHouseBean select_sellhouse_id(int id);

	public abstract SellHouseBean insert(SellHouseBean bean, InputStream is1,
			long size1, InputStream is2, long size2, InputStream is3, long size3);

	public abstract SellHouseBean update(SellHouseBean bean,InputStream is1,long size1,InputStream is2,long size2,InputStream is3,long size3);

	public abstract boolean delete(int id);

	public abstract SellHouseBean updatereport(SellHouseBean bean);

	List<SellHouseBean> select_sellhouse_type(String sellhouse_type);

	SellHouseBean GMupdate(SellHouseBean bean);

}