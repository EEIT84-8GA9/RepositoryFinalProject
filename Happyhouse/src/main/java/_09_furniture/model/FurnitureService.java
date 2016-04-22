package _09_furniture.model;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

import _02_sellhouse.model.SellHouseService;
import _09_furniture.model.dao.FurnitureDAO;
import _09_furniture.model.dao.FurnitureDAOJdbc;


public class FurnitureService {
	private FurnitureDAO productDao = new FurnitureDAOJdbc();
	public static final int IMAGE_FILENAME_LENGTH = 20;
	public static void main(String[] args) {
		FurnitureService service = new FurnitureService();
//		FurnitureBean f=new FurnitureBean();
//		f.setFurniture_id(1000);
//		f.setUser_account("Alex123");
		List<FurnitureBean> beans = service.selectSelf("Alex123");
		System.out.println("beans="+beans);
	}
	public List<FurnitureBean> select(FurnitureBean bean) {
		List<FurnitureBean> result = null;
	
	 if((bean!=null && bean.getFurniture_id()!=0) ) {
			FurnitureBean temp = productDao.select(bean.getFurniture_id());
//			String temp1= bean.getUser_account();
//			String temp2= bean.getFurniture_neme();
			if(temp!=null) {
				result = new ArrayList<FurnitureBean>();
				result.add(temp);
			}
//			else if(temp1!=""){
//				result =productDao.select(temp1);
//			}
//			else if(temp2!="") {
//				result =productDao.selectKeyWord(temp2);
//			}
		} else {
			result = productDao.selectAllFurniture(); 
		}
		return result;
	}
	
	public List<FurnitureBean> selectSelf(String user_account){
		List<FurnitureBean> result = null;
		
		if(user_account!=""){
			
			result=	productDao.select(user_account);
			
			
		}
		
		return result;
	}
	
	
	
	
	
	public FurnitureBean insert(FurnitureBean bean,InputStream is1,long size1,InputStream is2,long size2) {
		FurnitureBean result = null;
		if(bean!=null) {
			result = productDao.insert(bean,is1,size1,is2,size2);
		}
		return result;
	}
	public FurnitureBean update(FurnitureBean bean) {
		FurnitureBean result = null;
		if(bean!=null) {
			result = productDao.update(bean);
		}
		return result;
	}
	public boolean delete(FurnitureBean bean) {
		boolean result = false;
		if(bean!=null) {
			result = productDao.delete(bean.getFurniture_id());
		}
		return result;
	}
	
	
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

}
}
