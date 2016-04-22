package _06_currentprice.model;

import java.util.List;

public interface CurrentPriceDAO {

	List<CurrentPriceBean> select();

	List<CurrentPriceBean> select_by_cp_city(String currentprice_city);

	List<CurrentPriceBean> select_avgoneprice_by_city_type(String currentprice_city);


	List<CurrentPriceBean> select_avgoneprice_by_city_type_tradedate(String currentprice_city,
			String currentprice_bdtype);

	List<CurrentPriceBean> select_all_by_city_type_transes(String currentprice_city, String currentprice_bdtype,
			String currentprice_transes);

	List<CurrentPriceBean> select_count_by_city_type(String currentprice_city);

	List<CurrentPriceBean> select_count_by_city_transes(String currentprice_city);

	List<CurrentPriceBean> select_count_by_city_housearea(String currentprice_city);

	List<CurrentPriceBean> select_all_by_address(String currentprice_address);

	List<CurrentPriceBean> select_all_84_by_city_type(String currentprice_city, String currentprice_bdtype);
	
	

}