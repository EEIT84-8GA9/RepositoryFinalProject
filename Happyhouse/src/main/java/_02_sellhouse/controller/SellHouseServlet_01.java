package _02_sellhouse.controller;

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

import _02_sellhouse.model.SellHouseBean;
import _02_sellhouse.model.SellHouseService;




@MultipartConfig(location = "", fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 500, maxRequestSize = 1024 * 1024 * 500 * 5)
@WebServlet("/house/house1.controller")
public class SellHouseServlet_01 extends HttpServlet {
	private SellHouseService sellHouseService=new SellHouseService();
	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session=request.getSession();
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
		//接收圖片資料
	Collection<Part> parts = request.getParts() ;
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
		String sellhouse_type = request.getParameter("sellhouse_type");//預設值，記得去jdbc加
		String sellhouse_message = request.getParameter("sellhouse_message");
		String sellhouse_date = request.getParameter("sellhouse_date");
		String sellhouse_car = request.getParameter("sellhouse_car");
		String sellhouse_phone = request.getParameter("sellhouse_phone");
		String sellhouse_email = request.getParameter("sellhouse_email");
		String prodaction = request.getParameter("prodaction"); 
		String select=request.getParameter("choise");
		// 轉換資料
		Map<String, String> error = new HashMap<String, String>();
		Map<String, String> right = new HashMap<String, String>();
		Map<String, String> style = new HashMap<String, String>();
		request.setAttribute("style", style);
		request.setAttribute("error", error);
		request.setAttribute("right", right);
		
	
		//判斷
		int sellhouse_id=0;
		//ID
		if(temp1 !=null&&temp1.trim().length()!=0){
			try {
				sellhouse_id = Integer.parseInt(temp1);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				error.put("sellhouse_id", "id必須是數字");
			}
		}
		//帳號
		if(user_account ==null||user_account.trim().length()==0){
			System.out.println("無使用者帳號");
			error.put("user_account", "請輸入使用者帳號");
		}
		//標題
		if(sellhouse_name==null||sellhouse_name.trim().length()==0){
			error.put("sellhouse_name", "");
			right.put("sellhouse_name", "");
			style.put("sellhouse_name", "background-color:pink");
		}
		else if(sellhouse_name!=null){
			right.put("sellhouse_name", sellhouse_name);
			style.put("sellhouse_name", "");
		}
		//價格
		int sellhouse_price = 0;
		if (temp3 != null || temp3.trim().length() != 0) {
			try {
				sellhouse_price = Integer.parseInt(temp3);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				error.put("sellhouse_price", "");
				right.put("sellhouse_price", "");
				style.put("sellhouse_price", "background-color:pink");
			}
		}	
		if(sellhouse_price!=0.0){
			right.put("sellhouse_price",""+sellhouse_price);
			style.put("sellhouse_price", "");
		}else if(sellhouse_price==0.0){
			error.put("sellhouse_price", "");
			right.put("sellhouse_price", "");
			style.put("sellhouse_price", "background-color:pink");
		}
		
//		else if(temp3==null){
//			error.put("sellhouse_price","必須為數字且不可為0元");
//			style.put("sellhouse_price", "background-color:pink");
//		}
//		else {
//			error.put("sellhouse_name",temp3);
//			style.put("sellhouse_name", "");
//		}
		//格局
		if(sellhouse_patterns==null||sellhouse_patterns.trim().length()==0){
			error.put("sellhouse_patterns", "");
			right.put("sellhouse_patterns", "");
			style.put("sellhouse_patterns", "background-color:pink");
		}
		else if(sellhouse_patterns!=null){
			right.put("sellhouse_patterns",sellhouse_patterns);
			style.put("sellhouse_patterns","");
		}
		//地址
		if(sellhouse_address==null||sellhouse_address.trim().length()==0){
			error.put("sellhouse_address", "");
			right.put("sellhouse_address", "");
			style.put("sellhouse_address", "background-color:pink");
		}
		else if(sellhouse_address!=null){
			right.put("sellhouse_address", sellhouse_address);
			style.put("sellhouse_address","");
		}
		//額外描述  可以為NULL
		if(sellhouse_describe==null||sellhouse_describe.trim().length()==0){
			error.put("sellhouse_describe", "");
			right.put("sellhouse_describe", "");
			style.put("sellhouse_describe", "background-color:pink");
		}
		else if(sellhouse_describe !=null){
			right.put("sellhouse_describe", sellhouse_describe);
			style.put("sellhouse_describe","");
		}
		//坪數
		int sellhouse_size = 0;
		System.out.println(temp7);
		if (temp7 != null || temp7.trim().length() != 0) {
			try {
				sellhouse_size = Integer.parseInt(temp7);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				error.put("sellhouse_size", "");
				right.put("sellhouse_size", "");
				style.put("sellhouse_size", "background-color:pink");
			}
		}
		
		
		if(sellhouse_size!=0.0){
			right.put("sellhouse_size",""+sellhouse_size);
			style.put("sellhouse_size", "");
		}else if(sellhouse_size==0.0){
			error.put("sellhouse_size", "");
			right.put("sellhouse_size", "");
			style.put("sellhouse_size", "background-color:pink");
		}
//		else if(temp7==null||temp7.trim().length() ==0){
//			error.put("sellhouse_size", "跑到這");
//			style.put("sellhouse_size", "background-color:pink");
//		}else{
//			error.put("sellhouse_size", temp7);
//			style.put("sellhouse_size", "");
//		}
		//樓層
		if(sellhouse_floor==null||sellhouse_floor.trim().length()==0){
			error.put("sellhouse_floor", "");
			right.put("sellhouse_floor", "");
			style.put("sellhouse_floor", "background-color:pink");
		}
		else if(sellhouse_floor!=null){
			right.put("sellhouse_floor", sellhouse_floor);
			style.put("sellhouse_floor", "");
		}
		//屋齡 不需要?
		int sellhouse_age = 0;
		if (temp9 != null || temp9.trim().length() != 0) {
			try {
				sellhouse_age = Integer.parseInt(temp9);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				error.put("sellhouse_age","");
				right.put("sellhouse_age","");
				style.put("sellhouse_age", "background-color:pink");
			}
		}

		
		
		if(sellhouse_age!=0.0){
			right.put("sellhouse_age",""+sellhouse_age);
			style.put("sellhouse_age", "");
		}else if(sellhouse_age==0.0){
			error.put("sellhouse_age", "");
			right.put("sellhouse_age", "");
			style.put("sellhouse_age", "background-color:pink");
		}
//		else if(temp9==null||temp9.trim().length() ==0){
//			error.put("sellhouse_age", "");
//			style.put("sellhouse_age", "background-color:pink");
//		}else{
//			error.put("sellhouse_age", ""+sellhouse_age);
//			style.put("sellhouse_age", "background-color:pink");
//		}
		//車位
		if(sellhouse_car==null||sellhouse_car.trim().length()==0){
			error.put("sellhouse_car", "");
			right.put("sellhouse_car", "");
			style.put("sellhouse_car", "background-color:pink");
		}
		else if(sellhouse_car!=null){
			right.put("sellhouse_car", sellhouse_car);
			style.put("sellhouse_car", "");
		}
		//電話
		if(sellhouse_phone==null||sellhouse_phone.trim().length()==0){
			error.put("sellhouse_phone", "");
			right.put("sellhouse_phone", "");
			style.put("sellhouse_phone", "background-color:pink");
		}
		else if(sellhouse_phone!=null){
			right.put("sellhouse_phone", sellhouse_phone);
			style.put("sellhouse_phone", "");
		}
		//電話
		if(sellhouse_email==null||sellhouse_email.trim().length()==0){
		error.put("sellhouse_email", "");
		right.put("sellhouse_email", "");
		style.put("sellhouse_email", "background-color:pink");
		}
		else if(sellhouse_email !=null){
			right.put("sellhouse_email", sellhouse_email);
			style.put("sellhouse_email", "");
		}
		//驗證HTML Form資料
//		if(error.getOrDefault(error,sellhouse_name)==""||error.getOrDefault(error,sellhouse_address)==""||
//				error.getOrDefault(error,sellhouse_price)==""){
//			
//		}
		
		
		if(error!=null&&! error.isEmpty()){
			System.out.println("errior");
			request.getRequestDispatcher(
					"/_02_sellhouse/InsertSellHouse.jsp").forward(request, response);
			return;
		}
		//判斷
		
		
		SellHouseBean bean=new SellHouseBean();
//		if("搜尋".equals(prodaction)&&"address".equals(select)){
//			bean.setUser_account(user_account);
//			bean.setSellhouse_address(keyword);
//			bean.setSellhouse_price(sellhouse_price);
//			bean.setSellhouse_name(sellhouse_name);
//			bean.setSellhouse_id(sellhouse_id);
//			System.out.println(bean.getSellhouse_address());
//			List<SellHouseBean> result=sellHouseService.select(bean);
//			request.setAttribute("select", result);
//			request.getRequestDispatcher("/_02_sellhouse/SellHouseSearch.jsp").forward(request, response);
//		}
//		else if("搜尋".equals(prodaction)&&"name".equals(select)){
//			bean.setUser_account(user_account);
//			bean.setSellhouse_address(sellhouse_address);
//			bean.setSellhouse_price(sellhouse_price);
//			bean.setSellhouse_name(keyword);
//			bean.setSellhouse_id(sellhouse_id);
//			System.out.println(bean.getSellhouse_address());
//			List<SellHouseBean> result=sellHouseService.select(bean);
//			request.setAttribute("select", result);
//			request.getRequestDispatcher("/_02_sellhouse/SellHouseSearch.jsp").forward(request, response);	
//		}
//		else if("搜尋".equals(prodaction)&&"price".equals(select)){
//		int price=0;
//		try {
//			price = Integer.parseInt(keyword);
//		} catch (NumberFormatException e) {
//			e.printStackTrace();
//		}
//			if(price==0.0){
//				bean.setUser_account(user_account);
//				bean.setSellhouse_address(sellhouse_address);
//				bean.setSellhouse_name(sellhouse_name);
//				bean.setSellhouse_id(sellhouse_id);
//				bean.setSellhouse_price(sellhouse_price);
//				List<SellHouseBean> result=sellHouseService.select(bean);
//				request.setAttribute("select", result);
//				request.getRequestDispatcher("/_02_sellhouse/SellHouseSearch.jsp").forward(request, response);
//			}
//			else{
//				bean.setUser_account(user_account);
//				bean.setSellhouse_address(sellhouse_address);
//				bean.setSellhouse_name(sellhouse_name);
//				bean.setSellhouse_id(sellhouse_id);
//				bean.setSellhouse_price(price);
//				List<SellHouseBean> result=sellHouseService.select(bean);
//				request.setAttribute("select", result);
//				request.getRequestDispatcher("/_02_sellhouse/SellHouseSearch.jsp").forward(request, response);
//			}
//	
//		}	
		 if(prodaction!=null&&"新增".equals(prodaction)){
			 //parts = request.getParts();
			System.out.println("新增");
			bean.setUser_account(user_account);
			bean.setSellhouse_name(sellhouse_name);
			System.out.println(bean.getSellhouse_name());
			bean.setSellhouse_price(sellhouse_price);
			System.out.println(bean.getSellhouse_price());
			bean.setSellhouse_patterns(sellhouse_patterns);
			bean.setSellhouse_address(sellhouse_address);
			bean.setSellhouse_size(sellhouse_size);
			bean.setSellhouse_describe(sellhouse_describe);
			bean.setSellhouse_floor(sellhouse_floor);
			bean.setSellhouse_age(sellhouse_age);
			bean.setSellhouse_type(sellhouse_type);
			bean.setSellhouse_message(sellhouse_message);
			bean.setSellhouse_car(sellhouse_car);
			bean.setSellhouse_phone(sellhouse_phone);
			bean.setSellhouse_email(sellhouse_email);
			//圖片上傳部分		
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
							fileName1 = sellHouseService.getFileName(p); // 此為圖片檔的檔名
							fileName1 = sellHouseService.adjustFileName(fileName1,
									sellHouseService.IMAGE_FILENAME_LENGTH);
						} else if (is2 == null && is1 != null) {
							is2 = p.getInputStream();
							sizeInBytes2 = p.getSize();
							fileName2 = sellHouseService.getFileName(p); // 此為圖片檔的檔名
							fileName2 = sellHouseService.adjustFileName(fileName2,
									sellHouseService.IMAGE_FILENAME_LENGTH);
						} else if (is3 == null && is1 != null && is2 != null) {
							is3 = p.getInputStream();
							sizeInBytes3 = p.getSize();
							fileName3 = sellHouseService.getFileName(p); // 此為圖片檔的檔名
							fileName3 = sellHouseService.adjustFileName(fileName3,
									sellHouseService.IMAGE_FILENAME_LENGTH);
						}
						if (fileName1 != null && fileName1.trim().length() > 0) {
							bean.setSellhouse_photo1_name(fileName3);
							bean.setSellhouse_photo2_name(fileName2);
							bean.setSellhouse_photo3_name(fileName3);
							System.out.println("fileName1=" + fileName1
									+ "sizeInBytes1=" + sizeInBytes1);
							System.out.println("fileName2=" + fileName2
									+ "sizeInBytes2=" + sizeInBytes2);
							// dao.insert(bean,is1,sizeInBytes1,is2,sizeInBytes2);
						}
					}
				}
			}
			SellHouseBean result=sellHouseService.insert(bean, is1, sizeInBytes1, is2, sizeInBytes2, is3,
					sizeInBytes3);
			response.sendRedirect("/Happyhouse/_02_sellhouse/SellHouseSearch.jsp");
//			request.getRequestDispatcher("/_02_sellhouse/SellHouseSearch.jsp").forward(request, response);
		}
//		 else if(prodaction!=null&&"修改".equals(prodaction)){
//			bean.setSellhouse_id(sellhouse_id);
//			bean.setSellhouse_name(sellhouse_name);
//			bean.setSellhouse_price(sellhouse_price);
//			bean.setSellhouse_patterns(sellhouse_patterns);
//			bean.setSellhouse_address(sellhouse_address);
//			bean.setSellhouse_describe(sellhouse_describe);
//			bean.setSellhouse_floor(sellhouse_floor);
//			bean.setSellhouse_age(sellhouse_age);
//			bean.setSellhouse_type(sellhouse_type);
//			bean.setSellhouse_message(sellhouse_message);
//			bean.setSellhouse_car(sellhouse_car);
//			bean.setSellhouse_phone(sellhouse_phone);
//			bean.setSellhouse_email(sellhouse_email);
//			SellHouseBean result=sellHouseService.update(bean);	
//		}
		else{
			
			response.sendRedirect("/Happyhouse/_02_sellhouse/SellHouseSearch.jsp");
		}
//		else if(prodaction!=null&&"刪除".equals(prodaction)){
//			bean.setSellhouse_id(sellhouse_id);
//			boolean result=sellHouseService.delete(bean);
//		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

	
	
}
