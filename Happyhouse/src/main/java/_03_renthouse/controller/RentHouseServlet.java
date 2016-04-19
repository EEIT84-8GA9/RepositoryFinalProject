package _03_renthouse.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.imageio.stream.FileImageOutputStream;
import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;








import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.taglibs.standard.lang.jstl.test.PageContextImpl;

import _01_users.model.UsersBean;
import _02_sellhouse.model.SellHouseBean;
import _02_sellhouse.model.SellHouseService;
import _03_renthouse.model.RentHouseBean;
import _03_renthouse.model.RentHouseService;




@MultipartConfig(location = "", fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 500, maxRequestSize = 1024 * 1024 * 500 * 5)
@WebServlet(
		urlPatterns={"/house/renthouse.controller"}
)
public class RentHouseServlet extends HttpServlet {
	private RentHouseService sellHouseService=new RentHouseService();

	
	
	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session=request.getSession();
		UsersBean userbean= (UsersBean) session.getAttribute("LoginOK");
		System.out.println(userbean.getUser_account());
		//圖片上傳
		long sizeInBytes1 = 0;
		long sizeInBytes2 = 0;
		long sizeInBytes3 = 0;
		String fldName1 = "";
		String fldName2 = "";
		String fldName3 = "";
		String value1 = "";
		String value2 = "";
		String value3 = "";
		String memberID = "";
		String fileName1 = "";
		InputStream is1 = null;
		String fileName2 = "";
		InputStream is2 = null;
		String fileName3 = "";
		InputStream is3 = null;
//		Collection<Part> parts = request.getParts();
		// 接收資料
		String keyword=request.getParameter("keyword");
		String temp1 = request.getParameter("sellhouse_id");
		String user_account = request.getParameter("user_account");
		String sellhouse_name = request.getParameter("sellhouse_name");
		String temp3 = request.getParameter("sellhouse_price");
		String sellhouse_patterns = request.getParameter("sellhouse_patterns");
		String sellhouse_address = request.getParameter("sellhouse_address");
		String sellhouse_describe = request.getParameter("sellhouse_describe");
		String temp7 = request.getParameter("sellhouse_size");
		String sellhouse_floor = request.getParameter("sellhouse_floor");
		String temp9 = request.getParameter("sellhouse_age");
		String sellhouse_type = request.getParameter("sellhouse_type");
		String sellhouse_message = request.getParameter("sellhouse_message");
		String sellhouse_date = request.getParameter("sellhouse_date");
		String sellhouse_car = request.getParameter("sellhouse_car");
		String sellhouse_phone = request.getParameter("sellhouse_phone");
		String sellhouse_email = request.getParameter("sellhouse_email");
		String prodaction = request.getParameter("prodaction"); 
		String select=request.getParameter("choise");
		System.out.println(select);
		// 轉換資料
		Map<String, String> error = new HashMap<String, String>();
		request.setAttribute("error", error);
		int sellhouse_id=0;
		if(temp1 !=null&&temp1.trim().length()!=0){
			try {
				sellhouse_id = Integer.parseInt(temp1);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				error.put("sellhouse_id", "id必須是數字");
			}
		}
		int sellhouse_price = 0;
		if (temp3 != null && temp3.trim().length() != 0) {
			try {
				sellhouse_price = Integer.parseInt(temp3);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				error.put("sellhouse_price", "價錢必須是數字");
			}
		}
		int sellhouse_size = 0;
		if (temp7 != null && temp7.trim().length() != 0) {
			try {
				sellhouse_size = Integer.parseInt(temp7);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				error.put("sellhouse_size", "坪數必須是數字");
			}
		}
		int sellhouse_age = 0;
		if (temp9 != null && temp9.trim().length() != 0) {
			try {
				sellhouse_age = Integer.parseInt(temp9);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				error.put("sellhouse_age", "屋齡必須是數字");
			}
		}
		//驗證HTML Form資料
		RentHouseBean bean=new RentHouseBean();
		if("搜尋".equals(prodaction)&&"address".equals(select)){
			bean.setUser_account(user_account);
			bean.setRenthouse_address(keyword);
			bean.setRenthouse_price(sellhouse_price);
			bean.setRenthouse_name(sellhouse_name);
			bean.setRenthouse_id(sellhouse_id);
			System.out.println(bean.getRenthouse_address());
			List<RentHouseBean> result=sellHouseService.select(bean);
			request.setAttribute("rent_select", result);
			request.getRequestDispatcher("/_03_renthouse/RentHouseSearch.jsp").forward(request, response);
		}else if("搜尋".equals(prodaction)&&"name".equals(select)){
			bean.setUser_account(user_account);
			bean.setRenthouse_address(sellhouse_address);
			bean.setRenthouse_price(sellhouse_price);
			bean.setRenthouse_name(keyword);
			bean.setRenthouse_id(sellhouse_id);
			System.out.println(bean.getRenthouse_address());
			List<RentHouseBean> result=sellHouseService.select(bean);
			request.setAttribute("rent_select", result);
			request.getRequestDispatcher("/_03_renthouse/RentHouseSearch.jsp").forward(request, response);	
		}else if("搜尋".equals(prodaction)&&"price".equals(select)){
		int price=0;
		try {
			price = Integer.parseInt(keyword);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
			if(price==0.0){
				bean.setUser_account(user_account);
				bean.setRenthouse_address(sellhouse_address);
				bean.setRenthouse_name(sellhouse_name);
				bean.setRenthouse_id(sellhouse_id);
				bean.setRenthouse_price(sellhouse_price);
				List<RentHouseBean> result=sellHouseService.select(bean);
				request.setAttribute("rent_select", result);
				request.getRequestDispatcher("/_03_renthouse/RentHouseSearch.jsp").forward(request, response);
			}
			else{
				bean.setUser_account(user_account);
				bean.setRenthouse_address(sellhouse_address);
				bean.setRenthouse_name(sellhouse_name);
				bean.setRenthouse_id(sellhouse_id);
				bean.setRenthouse_price(price);
				List<RentHouseBean> result=sellHouseService.select(bean);
				request.setAttribute("rent_select", result);
				request.getRequestDispatcher("/_03_renthouse/RentHouseSearch.jsp").forward(request, response);
			}
		}
		else{
			response.sendRedirect("/Happyhouse/_03_renthouse/RentHouseSearch.jsp");
			
		}
		
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

	
	
}
