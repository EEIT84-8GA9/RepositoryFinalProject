package _02_sellhouse.model;

import java.util.ArrayList;
import java.util.List;

import _02_sellhouse.model.dao.SellHouseDAOJdbc;



public class SellHouseService {
	public static void main(String[] args){
		SellHouseService service=new SellHouseService();
		SellHouseBean bean=new SellHouseBean();
		bean.setUser_account("Alex123");
		List<SellHouseBean>	beans=service.select(bean);
		System.err.println(beans);
		//bean.setSellhouse_id(110);
//		bean.setUser_account("Alex123");
//		bean.setSellhouse_name("qqaaa公dddd寓出租");
//		bean.setSellhouse_price(1119999);
//		bean.setSellhouse_patterns("sssssss");
//		bean.setSellhouse_address("ss心北北北市");
//		bean.setSellhouse_describe("s環境優美");
//		bean.setSellhouse_size(555);
//		bean.setSellhouse_floor("s3樓");
//		bean.setSellhouse_age(10);
//		bean.setSellhouse_type("sA");
//		bean.setSellhouse_message("sddddddd");
//		bean.setSellhouse_car("s車位");
//		bean.setSellhouse_phone("155555");
//		bean.setSellhouse_email("1dd!55555");
//		SellHouseBean beansss=service.update(bean);

		//service.delete(bean);
	}
	
	
	private SellHouseDAO dao=new SellHouseDAOJdbc(); 
	public	List<SellHouseBean> select(SellHouseBean bean){
		List<SellHouseBean> result=null;
		if(bean !=null&&bean.getSellhouse_id()!=0){
			 System.out.println("id");
			SellHouseBean temp=dao.select_sellhouse_id(bean.getSellhouse_id());
			if(temp !=null){
				result=new ArrayList<SellHouseBean>();
				result.add(temp);
				return result;
			}
			
		}
		 if(bean !=null &&bean.getSellhouse_price()!=0.0){
				 List<SellHouseBean> temp = dao.select_sellhouse_price(bean.getSellhouse_price());
				 System.out.println("price");
				 if(temp !=null){
					 result=temp; 
					 return result;
				 }
				 
			}
		 if(bean !=null&&bean.getSellhouse_name().length()!=0){
			 List<SellHouseBean> temp = dao.select_sellhouse_name(bean.getSellhouse_name());
			 System.out.println("name");
			 if(temp !=null){
				 result=temp;
				 return result;
			 }
		}
		 if(bean !=null&&bean.getSellhouse_address().length()!=0){
			 List<SellHouseBean> temp = dao.select_sellhouse_address(bean.getSellhouse_address());
			 System.out.println("address");
			 if(temp !=null){
				 result=temp;
				 return result;
			 }
			 
		}
		 if(bean !=null&&bean.getUser_account().length()!=0){
			 List<SellHouseBean> temp = dao.select_user_account(bean.getUser_account());
			 if(temp !=null){
				 System.out.println("acc");
				 result=temp;
				
			 }
			 return result;
		}else{
			System.out.println("all");
			 result = dao.SELECT_ALL();		 
		}
		return result;
	}
	public SellHouseBean insert(SellHouseBean bean){
		SellHouseBean result=null;
		if(bean!=null){
			result=dao.insert(bean);
		}
		return result;		
	}
	public SellHouseBean update(SellHouseBean bean){
		SellHouseBean result=null;
		result=dao.select_sellhouse_id(bean.getSellhouse_id());
		if(result !=null){
			result=dao.update(bean);
		}
		return result;
	}
	public boolean delete(SellHouseBean bean){
		boolean result=false;
		if(bean !=null){
		result=dao.delete(bean.getSellhouse_id());	
		}
		return result;	
	}
}
