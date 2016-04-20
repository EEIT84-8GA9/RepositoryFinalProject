package _08_news.model;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

import _02_sellhouse.model.SellHouseService;
import _05_sms.model.SmsVO;
import _08_news.model.dao.newDAO;


public class NewsService {

	public static final int IMAGE_FILENAME_LENGTH = 20;
	private newDAO dao = new newDAO();

	private static void main(String[] args) {
		// NewsService service = new NewsService();
		// List<newsBean> bean = service

		// NewsService service = new NewsService();
		// List<newsBean> beans = service.select(null);
		// System.out.println("beans=" + beans);

	}

	public newsBean select(int id) {
		newsBean result = dao.select(id);
		return result;
	}
	
	public List<newsBean> select(newsBean bean) {
		List<newsBean> result = null;

		if (bean != null && bean.getNew_id() != 0) {
			newsBean temp = dao.select(bean.getNew_id());
			if (temp != null) {
				result = new ArrayList<newsBean>();
				result.add(temp);
			}
		} else {
			result = dao.select();
		}
		return result;
	}

	public newsBean insert(newsBean bean) {
		newsBean result = null;
		if (bean != null) {
			result = dao.insert(bean);

		}

		return result;

	}

	public newsBean update(newsBean bean , InputStream is1,long size1,InputStream is2,long size2,InputStream is3,long size3) {
		newsBean result = null;
		if (bean != null) {

			result = dao.update(bean.getNew_title(), bean.getNew_describe(), bean.getNew_photo1_name(), bean.getNew_photo2_name(), bean.getNew_photo3_name() , is1, size1, is2, size2, is3, size3, bean.getNew_id());
			

		}
		return result;
	}

     public boolean delete(newsBean bean){
    	 boolean result = false;
    	 if(bean!=null){
    		 result = dao.delete(bean.getNew_id());
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
//+上去到此為止
}
}
