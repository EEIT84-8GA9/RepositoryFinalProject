package _06_currentprice.controller;

import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.util.Collection;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import _06_currentprice.model.dao.CurrentPriceUpdateJdbc;


@MultipartConfig(location = "", fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 500, maxRequestSize = 1024 * 1024 * 500 * 5)
@WebServlet(
		urlPatterns={"/house/text.controller"}
)
public class TextInsertServlet extends HttpServlet {
		 CurrentPriceUpdateJdbc dao=new CurrentPriceUpdateJdbc();
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		long sizeInBytes1 = 0;
		String fldName1 = "";
		InputStream is1 = null;
		String fileName1 = "";
		String city=request.getParameter("city");
		String update=request.getParameter("update");
		Collection<Part> parts = request.getParts() ;
		 if(update!=null&&"新增".equals(update)){
				if (parts != null) {
					for (Part p : parts) {
						if (p.getContentType() == null) {
							if (fldName1.equals("text")) {
								//memberID = value1;
							}
						} else {
							if (is1 == null) {
								is1 = p.getInputStream();
								sizeInBytes1 = p.getSize();
								fileName1 = dao.getFileName(p); // 此為圖片檔的檔名
								fileName1 = dao.adjustFileName(fileName1,
										dao.IMAGE_FILENAME_LENGTH);
							} 
							
//							if (fileName1 !=null && fileName1.trim().length() > 0) {
//						
//								
//							}
							
						}
						
					}
				
				}
			 dao.inserttext(city, fileName1, is1, sizeInBytes1);
//			 http://localhost:8080/Happyhouse/text?id=600
			 String	d=request.getServerName();
			 int	e=request.getServerPort();
			 String path="http://"+d+":"+e+"/Happyhouse/text?id=600";
			FileReader fr=new FileReader(path);
			dao.insert(fr);
			 System.out.println(path);

		 }
		
		
		
		
		
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		this.doGet(request, response);
	}

	
	
}
