package _06_currentprice.model;

import java.util.ArrayList;





import java.util.List;

import _06_currentprice.model.dao.CurrentPriceDAOJdbc;

public class CurrentPriceService {
   
	private CurrentPriceDAO currentPriceDao = new CurrentPriceDAOJdbc();
	
	
		
	
	public static void main(String[] args) {
	CurrentPriceBean bean = new CurrentPriceBean();
	 CurrentPriceService  aaa = new CurrentPriceService();
	
	 bean.setCurrentprice_city("大同區");
	 List<CurrentPriceBean> beans =aaa.select(bean);	  
	 System.out.println(beans);	
		
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
	
	
	
	
	public List<CurrentPriceBean> pick(CurrentPriceBean bean){
		List<CurrentPriceBean> result = null;
		if(bean.getCurrentprice_address() != null && bean.getCurrentprice_address().length()!=0){
//							System.out.println(bean.getCurrentprice_city());
//	       if(temp!=null){
//	    	   result = new ArrayList<CurrentPriceBean>();
//	    	   result.add(temp);\
			System.out.println("rr"+bean+"ssss");
			result = currentPriceDao.select_all_by_address(bean.getCurrentprice_address());
			
		}
		System.out.println("ending");
		System.out.println("ee"+result);
		return result;
		
		}
	
	
	
	
	
	
	
}

	
	