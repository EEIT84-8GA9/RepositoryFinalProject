package _02_sellhouse.model;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

import _02_sellhouse.model.dao.SellHouseDAOJdbc;



public class SellHouseService {
//	public static void main(String[] args){
//		SellHouseService service=new SellHouseService();
//		SellHouseBean bean=new SellHouseBean();
//		bean.setUser_account("Alex123");
//		List<SellHouseBean>	beans=service.select(bean);
//		System.err.println(beans);
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
//	}
	//+上去
	public static final int IMAGE_FILENAME_LENGTH = 20;
	//+上去到此為止
	private SellHouseDAO dao=new SellHouseDAOJdbc();
//	private SellHouseDAO dao= new SellHouseDAOJdbc(); 
	public	List<SellHouseBean> select(SellHouseBean bean){
		List<SellHouseBean> result=null;
		if(bean !=null&&bean.getSellhouse_id()!=0){
			SellHouseBean temp=dao.select_sellhouse_id(bean.getSellhouse_id());
			if(temp !=null){
			result = new ArrayList<SellHouseBean>();
			result.add(temp);
				 return result;
			}
		}
		else if(bean !=null &&bean.getSellhouse_price()!=0.0){
				 List<SellHouseBean> temp = dao.select_sellhouse_price(bean.getSellhouse_price());
				 System.out.println("price");
				 if(temp !=null){
					 result=temp; 
					 return result;
				 }
			}
		else if(bean !=null&&bean.getSellhouse_name().length()!=0){
			 List<SellHouseBean> temp = dao.select_sellhouse_name(bean.getSellhouse_name());
			 if(temp !=null){
				 result=temp;
				 return result;
			 }
		}
		 else if(bean !=null&&bean.getSellhouse_address().length()!=0){
			 List<SellHouseBean> temp = dao.select_sellhouse_address(bean.getSellhouse_address());
			 if(temp !=null){
				 result=temp;
				 return result;
			 }			 
		}
		 else if(bean !=null&&bean.getUser_account().length()!=0){
			 List<SellHouseBean> temp = dao.select_user_account(bean.getUser_account());
			 if(temp !=null){

				 result=temp;	
			 }
			 return result;
		}else{
			 result = dao.SELECT_ALL();		 
		}
		return result;
	}
	public SellHouseBean insert(SellHouseBean bean,InputStream is1,long size1,InputStream is2,long size2,InputStream is3,long size3){
		SellHouseBean result=null;
		if(bean!=null){
			result=dao.insert(bean,is1,size1,is2,size2,is3,size3);
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
	public SellHouseBean updatereport(SellHouseBean bean){
		SellHouseBean result=null;
		result=dao.updatereport(bean);
		return bean;	
	}
	
	//+上去
	public static String adjustFileName(String fileName, int maxLength) {
		  int length = fileName.length();
		  if ( length <= maxLength ) {
			  return fileName ;
		  }
		int n      = fileName.lastIndexOf(".");
      int sub    = fileName.length() - n - 1;
      fileName = fileName.substring(0, maxLength-1-sub) + "." 
                   + fileName.substring(n+1); 
		return fileName;
	}
	
	public static String getFileName(final Part part) {
		for (String content : part.getHeader("content-disposition").split(";")) {
			if (content.trim().startsWith("filename")) {
				return content.substring(content.indexOf('=') + 1).trim()
						.replace("\"", "");
			}
		}
		return null;
	}
	
	public static void exploreParts(Collection<Part> parts, HttpServletRequest req){
		try {
			for (Part part: parts){
				String name = part.getName();
				String contentType = part.getContentType();
				String value = "";
				long size = part.getSize(); // 上傳資料的大小，即上傳資料的位元組數
				InputStream is =part.getInputStream();
				if (contentType != null) { // 表示該part為檔案
				   // 取出上傳檔案的檔名
				   String filename = SellHouseService.getFileName(part);
				   // 將上傳的檔案寫入到location屬性所指定的資料夾
				   if (filename != null && filename.trim().length() > 0) {
					   part.write(filename);	
					   System.out.println(part.getClass().getName());
				   }
				} else {  // 表示該part為一般的欄位
				   // 將上傳的欄位資料寫入到location屬性所指定的資料夾，檔名為"part_"+ name
				   part.write("part_"+ name);	
				   value = req.getParameter(name);    
				}
				System.out.printf("%-15s %-15s %8d  %-20s \n", name, contentType, size, value);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
//+上去到此為止
}
	
	
	
	
	
}
