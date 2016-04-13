package _10_chart.model;

import java.util.ArrayList;


import java.util.List;

import _06_currentprice.model.CurrentPriceBean;
import _06_currentprice.model.CurrentPriceDAO;
import _06_currentprice.model.dao.CurrentPriceDAOJdbc;


//此版Copy from CurrentPriceService
public class ChartService {
   
	private CurrentPriceDAO currentPriceDao = new CurrentPriceDAOJdbc();
	
	
		
	
	public static void main(String[] args) {
//	CurrentPriceBean bean = new CurrentPriceBean();
//	 ChartService  aaa = new ChartService();
//	
//	 bean.setCurrentprice_city("大同區");
//	 List<CurrentPriceBean> beans =aaa.select(bean);	  
//	 System.out.println(beans);	
		
	}
	
//賢哥版~ 可跑單格CITY 找多筆資料 	
//	public List<CurrentPriceBean> select(CurrentPriceBean bean){
//		List<CurrentPriceBean> temp =	null;
//	if(bean!=null && bean.getCurrentprice_city()!=null){
//       temp = currentPriceDao.select_by_cp_city(bean.getCurrentprice_city());				
//           	} 
//			return temp;	
//	} 
	
	

//由CurrentPriveServlet而來
//		if("Select".equals(prodaction)) {
//	List<CurrentPriceBean> result = currentpriceService.select(bean);
//  只選取select方法 然後在service中判斷~  City有值且不為空格 時用select_by_cp_city方法,  反之!!! 則使用 select() 方法
	public List<CurrentPriceBean> select(CurrentPriceBean bean){
		List<CurrentPriceBean> result = null;
		if(bean.getCurrentprice_city() != null && bean.getCurrentprice_city().length()!=0){
//							System.out.println(bean.getCurrentprice_city());
//	       if(temp!=null){
//	    	   result = new ArrayList<CurrentPriceBean>();
//	    	   result.add(temp);
			result = currentPriceDao.select_by_cp_city(bean.getCurrentprice_city());
			
		} else {
			result =currentPriceDao.select();	
		
		}
		return result;
		
		}
	
	//!!  第三個方法  選區域 求 AVG坪數與類型
	public List<CurrentPriceBean> select_avg_type(CurrentPriceBean bean){
		List<CurrentPriceBean> result = null;
		if(bean.getCurrentprice_city() != null && bean.getCurrentprice_city().length()!=0){
//							System.out.println(bean.getCurrentprice_city());
//	       if(temp!=null){
//	    	   result = new ArrayList<CurrentPriceBean>();
//	    	   result.add(temp);
			result = currentPriceDao.select_avgoneprice_by_city_type(bean.getCurrentprice_city());
			
		} 
		return result;
		
		}
	
	
	//!!  第四個方法  選區域 求 AVG坪數與類型
	public List<CurrentPriceBean> select_avg_month(CurrentPriceBean bean){
		List<CurrentPriceBean> result = null;
		if(bean.getCurrentprice_city() != null && bean.getCurrentprice_city().length()!=0 
				&&	bean.getCurrentprice_bdtype() != null && bean.getCurrentprice_bdtype().length()!=0			
				){
//							System.out.println(bean.getCurrentprice_city());
//	       if(temp!=null){
//	    	   result = new ArrayList<CurrentPriceBean>();
//	    	   result.add(temp);
			result = currentPriceDao.select_avgoneprice_by_city_type_tradedate(bean.getCurrentprice_city(),bean.getCurrentprice_bdtype());
			
		} 
		return result;
		
		}
	
	// 第五個方法 區 類 樓層  取 坪價 與 坪數 
	
	public List<CurrentPriceBean> select_oneprice_area_by_three(CurrentPriceBean bean){
		List<CurrentPriceBean> result1 = null;
		if(bean.getCurrentprice_city() != null && bean.getCurrentprice_city().length()!=0 
				&&	bean.getCurrentprice_bdtype() != null && bean.getCurrentprice_bdtype().length()!=0			
				&&	bean.getCurrentprice_transes() != null && bean.getCurrentprice_transes().length()!=0	
				
				){
//							System.out.println(bean.getCurrentprice_city());
//	       if(temp!=null){
//	    	   result = new ArrayList<CurrentPriceBean>();
//	    	   result.add(temp);
			result1 = currentPriceDao.select_all_by_city_type_transes(bean.getCurrentprice_city(),bean.getCurrentprice_bdtype(),bean.getCurrentprice_transes());
			
		} 
		return result1;
		
		}
	
	
	
	// 第六個方法 用區域 取     PEI圖的   類型    坪數範圍 樓層
	
	public List<CurrentPriceBean> select_pei_by_three_type(CurrentPriceBean bean){
		List<CurrentPriceBean> result1 = null;
		if(bean.getCurrentprice_city() != null && bean.getCurrentprice_city().length()!=0 
								
				){
//							System.out.println(bean.getCurrentprice_city());
//	       if(temp!=null){
//	    	   result = new ArrayList<CurrentPriceBean>();
//	    	   result.add(temp);
			result1 = currentPriceDao.select_count_by_city_type(bean.getCurrentprice_city());
			
		} 
		return result1;
		
		}
	
	public List<CurrentPriceBean> select_pei_by_three_area(CurrentPriceBean bean){
		List<CurrentPriceBean> result2 = null;
		if(bean.getCurrentprice_city() != null && bean.getCurrentprice_city().length()!=0 
								
				){
//							System.out.println(bean.getCurrentprice_city());
//	       if(temp!=null){
//	    	   result = new ArrayList<CurrentPriceBean>();
//	    	   result.add(temp);
			result2 = currentPriceDao.select_count_by_city_housearea(bean.getCurrentprice_city());
			
		} 
		return result2;
		
		}
	
	public List<CurrentPriceBean> select_pei_by_three_transes(CurrentPriceBean bean){
		List<CurrentPriceBean> result3 = null;
		if(bean.getCurrentprice_city() != null && bean.getCurrentprice_city().length()!=0 
								
				){
//							System.out.println(bean.getCurrentprice_city());
//	       if(temp!=null){
//	    	   result = new ArrayList<CurrentPriceBean>();
//	    	   result.add(temp);
			result3 = currentPriceDao.select_count_by_city_transes(bean.getCurrentprice_city());
			
		} 
		return result3;
		
		}
	
	
	
	
	
//result = currentPriceDao.select_by_cp_city(bean.getCurrentprice_city());
//	
//} else {
//	result =currentPriceDao.select();	
//
//}
//return result;
//
//}
	
	
	
	
	
}
