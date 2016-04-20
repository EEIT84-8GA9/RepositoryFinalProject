package _03_renthouse.model;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

import _02_sellhouse.model.SellHouseBean;
import _02_sellhouse.model.SellHouseService;
import _03_renthouse.model.dao.RentHouseDAOJdbc;









public class RentHouseService {
	public static final int IMAGE_FILENAME_LENGTH = 20;
	public static void main(String[] args){
		RentHouseService service=new RentHouseService();
		RentHouseBean bean=new RentHouseBean();
		bean.setRenthouse_id(105);
	List<RentHouseBean>	beans=service.select(bean);
	System.out.println(beans);
	//System.err.println(beans);
	//bean.setRenthouse_id(113);
//		bean.setUser_account("Alex123");
//		bean.setRenthouse_name("qqaaa公dddd寓出租");
//		bean.setRenthouse_price(1119999);
//		bean.setRenthouse_patterns("sssssss");
//		bean.setRenthouse_address("ss心北北北市");
//		bean.setRenthouse_describe("s環境優美");
//		bean.setRenthouse_deposit("1年");
//		bean.setRenthouse_rentdate("1年");
//		bean.setRenthouse_size(555);
//		bean.setRenthouse_floor("s3樓");
//		bean.setRenthouse_type("sA");
//		bean.setRenthouse_message("sddddddd");
//		bean.setRenthouse_car("s車位");
//		bean.setRenthouse_phone("155555");
//		bean.setRenthouse_email("1dd!55555");
//		RentHouseBean beansss=service.insert(bean);

		//service.delete(bean);
	}
	private RentHouseDAO dao=new RentHouseDAOJdbc(); 
	public	List<RentHouseBean> select(RentHouseBean bean){
		List<RentHouseBean> result=null;
		if(bean !=null&&bean.getRenthouse_id()!=0){
			RentHouseBean temp=dao.select_renthouse_id(bean.getRenthouse_id());
			if(temp !=null){
				result=new ArrayList<RentHouseBean>();
				result.add(temp);
			}
		}else if(bean !=null&&bean.getRenthouse_name()!=null){
			 List<RentHouseBean> temp = dao.select_renthouse_name(bean.getRenthouse_name());
			 if(temp !=null){
				 result=temp;
			 }
		}else if(bean !=null &&bean.getRenthouse_price()!=0){
			 List<RentHouseBean> temp = dao.select_renthouse_price(bean.getRenthouse_price());
			 if(temp !=null){
				 result=temp;
			 }
		}else if(bean !=null&&bean.getRenthouse_address()!=null){
			 List<RentHouseBean> temp = dao.select_renthouse_address(bean.getRenthouse_address());
			 if(temp !=null){
				 result=temp;
			 }
		}else if(bean !=null&&bean.getUser_account()!=null){
			 List<RentHouseBean> temp = dao.select_user_account(bean.getUser_account());
			 if(temp !=null){
				 result=temp;
			 }
		}else{
			 result = dao.SELECT_ALL();
		}
		return result;
	}
	public RentHouseBean insert(RentHouseBean bean,InputStream is1,long size1,InputStream is2,long size2,InputStream is3,long size3){
		RentHouseBean result=null;
		if(bean!=null){
			result=dao.insert(bean, is1, size1, is2,size2,is3,size3);
		}
		return result;		
	}
	public RentHouseBean update(RentHouseBean bean,InputStream is1,long size1,InputStream is2,long size2,InputStream is3,long size3){
		RentHouseBean result=null;
		result=dao.select_renthouse_id(bean.getRenthouse_id());
		if(result !=null){
			result=dao.update(bean,is1,size1,is2,size2,is3,size3);
		}
		return result;
	}
	public boolean delete(RentHouseBean bean){
		boolean result=false;
		if(bean !=null){
		result=dao.delete(bean.getRenthouse_id());	
		}
		return result;
		
	}
	public RentHouseBean updatereport(RentHouseBean bean){
		RentHouseBean result=null;
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

