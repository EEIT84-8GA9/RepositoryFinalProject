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

import _02_sellhouse.model.SellHouseBean;
import _02_sellhouse.model.SellHouseDAO;
import _02_sellhouse.model.SellHouseService;
import _02_sellhouse.model.dao.SellHouseDAOJdbc;
import _03_renthouse.model.RentHouseBean;
import _03_renthouse.model.RentHouseDAO;
import _03_renthouse.model.RentHouseService;
import _03_renthouse.model.dao.RentHouseDAOJdbc;




@MultipartConfig(location = "", fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 500, maxRequestSize = 1024 * 1024 * 500 * 5)
@WebServlet("/house/house3.controller")
public class UpdateRentHouseServlet extends HttpServlet {
	private RentHouseService rentHouseService=new  RentHouseService();
	private RentHouseDAO dao=new RentHouseDAOJdbc();
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
		String temp1 = request.getParameter("renthouse_id");
		String user_account = request.getParameter("user_account");
		String renthouse_name = request.getParameter("renthouse_name");
		String temp3 = request.getParameter("renthouse_price");
		String renthouse_deposit=request.getParameter("renthouse_deposit");
		String renthouse_patterns = request.getParameter("renthouse_patterns");
		String renthouse_address = request.getParameter("renthouse_address");
		String renthouse_describe = request.getParameter("renthouse_describe");
		String temp7 = request.getParameter("renthouse_size");
		String renthouse_floor = request.getParameter("renthouse_floor");
		String renthouse_rentdate = request.getParameter("renthouse_rentdate");
		String renthouse_type = request.getParameter("renthouse_type");//預設值，記得去jdbc加
		String renthouse_message = request.getParameter("renthouse_message");
		String renthouse_date = request.getParameter("renthouse_date");
		String renthouse_car = request.getParameter("renthouse_car");
		String renthouse_phone = request.getParameter("renthouse_phone");
		String renthouse_email = request.getParameter("renthouse_email");
		String prodaction = request.getParameter("prodaction"); 
		System.out.println(prodaction);
		String select=request.getParameter("choise");
		// 轉換資料
		Map<String, String> error = new HashMap<String, String>();
		Map<String, String> param = new HashMap<String, String>();
		Map<String, String> style = new HashMap<String, String>();
		request.setAttribute("style", style);
		request.setAttribute("error", error);
		request.setAttribute("param", param);
		
		
	
		//判斷
		int renthouse_id=0;
		//ID
		if(temp1 !=null&&temp1.trim().length()!=0){
			try {
				renthouse_id = Integer.parseInt(temp1);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				error.put("renthouse_id", "id必須是數字");
			}
		}
		//帳號
		if(user_account ==null||user_account.trim().length()==0){
			System.out.println("無使用者帳號");
			error.put("user_account", "請輸入使用者帳號");
		}
		//標題
		if(renthouse_name==null||renthouse_name.trim().length()==0){
			error.put("renthouse_name", "");
			param.put("renthouse_name", "");
			style.put("renthouse_name", "background-color:pink");
		}
		else if(renthouse_name!=null){
			param.put("renthouse_name", renthouse_name);
			style.put("renthouse_name", "");
		}
		//價格
		float renthouse_price = 0;
		if (temp3 != null || temp3.trim().length() != 0) {
			try {
				renthouse_price = (float) Double.parseDouble(temp3);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				error.put("renthouse_price", "");
				param.put("renthouse_price", "");
				style.put("renthouse_price", "background-color:pink");
			}
		}	
		if(renthouse_price!=0.0){
			param.put("renthouse_price",""+renthouse_price);
			style.put("renthouse_price", "");
		}else if(renthouse_price==0.0){
			error.put("renthouse_price", "");
			param.put("renthouse_price", "");
			style.put("renthouse_price", "background-color:pink");
		}
		
//		else if(temp3==null){
//			error.put("renthouse_price","必須為數字且不可為0元");
//			style.put("renthouse_price", "background-color:pink");
//		}
//		else {
//			error.put("renthouse_name",temp3);
//			style.put("renthouse_name", "");
//		}
		//格局
		if(renthouse_patterns==null||renthouse_patterns.trim().length()==0){
			error.put("renthouse_patterns", "");
			param.put("renthouse_patterns", "");
			style.put("renthouse_patterns", "background-color:pink");
		}
		else if(renthouse_patterns!=null){
			param.put("renthouse_patterns",renthouse_patterns);
			style.put("renthouse_patterns","");
		}
		//地址
		if(renthouse_address==null||renthouse_address.trim().length()==0){
			error.put("renthouse_address", "");
			param.put("renthouse_address", "");
			style.put("renthouse_address", "background-color:pink");
		}
		else if(renthouse_address!=null){
			param.put("renthouse_address", renthouse_address);
			style.put("renthouse_address","");
		}
		//額外描述  可以為NULL
		if(renthouse_describe==null||renthouse_describe.trim().length()==0){
			error.put("renthouse_describe", "");
			param.put("renthouse_describe", "");
			style.put("renthouse_describe", "background-color:pink");
		}
		else if(renthouse_describe !=null){
			param.put("renthouse_describe", renthouse_describe);
			style.put("renthouse_describe","");
		}
		//坪數
		float renthouse_size = 0;
		System.out.println(temp7);
		if (temp7 != null || temp7.trim().length() != 0) {
			try {
				renthouse_size = (float) Double.parseDouble(temp7);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				error.put("renthouse_size", "");
				param.put("renthouse_size", "");
				style.put("renthouse_size", "background-color:pink");
			}
		}
		
		
		if(renthouse_size!=0.0){
			param.put("renthouse_size",""+renthouse_size);
			style.put("renthouse_size", "");
		}else if(renthouse_size==0.0){
			error.put("renthouse_size", "");
			param.put("renthouse_size", "");
			style.put("renthouse_size", "background-color:pink");
		}
//		else if(temp7==null||temp7.trim().length() ==0){
//			error.put("renthouse_size", "跑到這");
//			style.put("renthouse_size", "background-color:pink");
//		}else{
//			error.put("renthouse_size", temp7);
//			style.put("renthouse_size", "");
//		}
		//樓層
		if(renthouse_floor==null||renthouse_floor.trim().length()==0){
			error.put("renthouse_floor", "");
			param.put("renthouse_floor", "");
			style.put("renthouse_floor", "background-color:pink");
		}
		else if(renthouse_floor!=null){
			param.put("renthouse_floor", renthouse_floor);
			style.put("renthouse_floor", "");
		}
		
		
		if(renthouse_deposit==null||renthouse_deposit.trim().length()==0){
			error.put("renthouse_deposit", "");
			param.put("renthouse_deposit", "");
			style.put("renthouse_deposit", "background-color:pink");
		}else if(renthouse_deposit!=null){
			param.put("renthouse_deposit", renthouse_deposit);
			style.put("renthouse_deposit", "");
		}
		
		
		
		
		
		if(renthouse_rentdate==null||renthouse_rentdate.trim().length()==0){
			error.put("renthouse_rentdate", "");
			param.put("renthouse_rentdate", "");
			style.put("renthouse_rentdate", "background-color:pink");
		}else if(renthouse_rentdate!=null){
			param.put("renthouse_rentdate",renthouse_rentdate);
			style.put("renthouse_rentdate", "");
		}
		//屋齡 不需要?
//		int renthouse_age = 0;
//		if (temp9 != null || temp9.trim().length() != 0) {
//			try {
//				renthouse_age = Integer.parseInt(temp9);
//			} catch (NumberFormatException e) {
//				e.printStackTrace();
//				error.put("renthouse_age","");
//				right.put("renthouse_age","");
//				style.put("renthouse_age", "background-color:pink");
//			}
//		}

		
		
//		if(renthouse_age!=0.0){
//			right.put("renthouse_age",""+renthouse_age);
//			style.put("renthouse_age", "");
//		}else if(renthouse_age==0.0){
//			error.put("renthouse_age", "");
//			right.put("renthouse_age", "");
//			style.put("renthouse_age", "background-color:pink");
//		}
//		else if(temp9==null||temp9.trim().length() ==0){
//			error.put("renthouse_age", "");
//			style.put("renthouse_age", "background-color:pink");
//		}else{
//			error.put("renthouse_age", ""+renthouse_age);
//			style.put("renthouse_age", "background-color:pink");
//		}
		//車位
		if(renthouse_car==null||renthouse_car.trim().length()==0){
			error.put("renthouse_car", "");
			param.put("renthouse_car", "");
			style.put("renthouse_car", "background-color:pink");
		}
		else if(renthouse_car!=null){
			param.put("renthouse_car", renthouse_car);
			style.put("renthouse_car", "");
		}
		//電話
		if(renthouse_phone==null||renthouse_phone.trim().length()==0){
			error.put("renthouse_phone", "");
			param.put("renthouse_phone", "");
			style.put("renthouse_phone", "background-color:pink");
		}
		else if(renthouse_phone!=null){
			param.put("renthouse_phone", renthouse_phone);
			style.put("renthouse_phone", "");
		}
		//電話
		if(renthouse_email==null||renthouse_email.trim().length()==0){
		error.put("renthouse_email", "");
		param.put("renthouse_email", "");
		style.put("renthouse_email", "background-color:pink");
		}
		else if(renthouse_email !=null){
			param.put("renthouse_email", renthouse_email);
			style.put("renthouse_email", "");
		}
		//驗證HTML Form資料
//		if(error.getOrDefault(error,renthouse_name)==""||error.getOrDefault(error,renthouse_address)==""||
//				error.getOrDefault(error,renthouse_price)==""){
//			
//		}
		
		
		if(error!=null&&! error.isEmpty()){
			System.out.println("errior");
			request.getRequestDispatcher(
					"/_03_renthouse/UpdateRentHouse.jsp").forward(request, response);
			return;
		}
		//判斷
		
		
		RentHouseBean bean=new RentHouseBean();
//		if("搜尋".equals(prodaction)&&"address".equals(select)){
//			bean.setUser_account(user_account);
//			bean.setrenthouse_address(keyword);
//			bean.setrenthouse_price(renthouse_price);
//			bean.setrenthouse_name(renthouse_name);
//			bean.setrenthouse_id(renthouse_id);
//			System.out.println(bean.getrenthouse_address());
//			List<rentHouseBean> result=rentHouseService.select(bean);
//			request.setAttribute("select", result);
//			request.getRequestDispatcher("/_03_renthouse/rentHouseSearch.jsp").forward(request, response);
//		}
//		else if("搜尋".equals(prodaction)&&"name".equals(select)){
//			bean.setUser_account(user_account);
//			bean.setrenthouse_address(renthouse_address);
//			bean.setrenthouse_price(renthouse_price);
//			bean.setrenthouse_name(keyword);
//			bean.setrenthouse_id(renthouse_id);
//			System.out.println(bean.getrenthouse_address());
//			List<rentHouseBean> result=rentHouseService.select(bean);
//			request.setAttribute("select", result);
//			request.getRequestDispatcher("/_03_renthouse/rentHouseSearch.jsp").forward(request, response);	
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
//				bean.setrenthouse_address(renthouse_address);
//				bean.setrenthouse_name(renthouse_name);
//				bean.setrenthouse_id(renthouse_id);
//				bean.setrenthouse_price(renthouse_price);
//				List<rentHouseBean> result=rentHouseService.select(bean);
//				request.setAttribute("select", result);
//				request.getRequestDispatcher("/_03_renthouse/rentHouseSearch.jsp").forward(request, response);
//			}
//			else{
//				bean.setUser_account(user_account);
//				bean.setrenthouse_address(renthouse_address);
//				bean.setrenthouse_name(renthouse_name);
//				bean.setrenthouse_id(renthouse_id);
//				bean.setrenthouse_price(price);
//				List<rentHouseBean> result=rentHouseService.select(bean);
//				request.setAttribute("select", result);
//				request.getRequestDispatcher("/_03_renthouse/rentHouseSearch.jsp").forward(request, response);
//			}
//	
//		}	
		 if(prodaction!=null&&"修改".equals(prodaction)){
			 //parts = request.getParts();
			System.out.println("新增");
			bean.setRenthouse_id(renthouse_id);
			bean.setUser_account(user_account);
			bean.setRenthouse_name(renthouse_name);
			bean.setRenthouse_price(renthouse_price);
			bean.setRenthouse_deposit(renthouse_deposit);
			bean.setRenthouse_patterns(renthouse_patterns);
			bean.setRenthouse_address(renthouse_address);
			bean.setRenthouse_describe(renthouse_describe);
			bean.setRenthouse_size(renthouse_size);
			bean.setRenthouse_floor(renthouse_floor);
			bean.setRenthouse_rentdate(renthouse_rentdate);
			bean.setRenthouse_message(renthouse_message);
			bean.setRenthouse_car(renthouse_car);
			bean.setRenthouse_phone(renthouse_phone);
			bean.setRenthouse_email(renthouse_email);
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
							fileName1 = rentHouseService.getFileName(p); // 此為圖片檔的檔名
							fileName1 = rentHouseService.adjustFileName(fileName1,
									rentHouseService.IMAGE_FILENAME_LENGTH);
						} else if (is2 == null && is1 != null) {
							is2 = p.getInputStream();
							sizeInBytes2 = p.getSize();
							fileName2 = rentHouseService.getFileName(p); // 此為圖片檔的檔名
							fileName2 = rentHouseService.adjustFileName(fileName2,
									rentHouseService.IMAGE_FILENAME_LENGTH);
						} else if (is3 == null && is1 != null && is2 != null) {
							is3 = p.getInputStream();
							sizeInBytes3 = p.getSize();
							fileName3 = rentHouseService.getFileName(p); // 此為圖片檔的檔名
							fileName3 = rentHouseService.adjustFileName(fileName3,
									rentHouseService.IMAGE_FILENAME_LENGTH);
						}
						if (fileName1 !=null && fileName1.trim().length() > 0) {
							bean.setRenthouse_photo1_name(fileName1);
							bean.setRenthouse_photo2_name(fileName2);
							bean.setRenthouse_photo3_name(fileName3);
							System.out.println("fileName1=" + fileName1
									+ "sizeInBytes1=" + sizeInBytes1);
							System.out.println("fileName2=" + fileName2
									+ "sizeInBytes2=" + sizeInBytes2);
							//dao.insert(bean,is1,sizeInBytes1,is2,sizeInBytes2,is3,sizeInBytes3);
						}
						
					}
					
				}
			
			}
			RentHouseBean result=rentHouseService.update(bean, is1, sizeInBytes1, is2, sizeInBytes2, is3,
					sizeInBytes3);
			System.out.println("在這");
			response.sendRedirect("/Happyhouse/_03_renthouse/RentHouseUser.jsp");
//			request.getRequestDispatcher("/_03_renthouse/rentHouseSearch.jsp").forward(request, response);
		}
//		 else if(prodaction!=null&&"修改".equals(prodaction)){
//			bean.setrenthouse_id(renthouse_id);
//			bean.setrenthouse_name(renthouse_name);
//			bean.setrenthouse_price(renthouse_price);
//			bean.setrenthouse_patterns(renthouse_patterns);
//			bean.setrenthouse_address(renthouse_address);
//			bean.setrenthouse_describe(renthouse_describe);
//			bean.setrenthouse_floor(renthouse_floor);
//			bean.setrenthouse_age(renthouse_age);
//			bean.setrenthouse_type(renthouse_type);
//			bean.setrenthouse_message(renthouse_message);
//			bean.setrenthouse_car(renthouse_car);
//			bean.setrenthouse_phone(renthouse_phone);
//			bean.setrenthouse_email(renthouse_email);
//			rentHouseBean result=rentHouseService.update(bean);	
//		}
		else{
			
			response.sendRedirect("/Happyhouse/_03_renthouse/RentHouseSearch.jsp");
		}
//		  if(delete!=null&&"刪除".equals(delete)){
//			bean.setrenthouse_id(delete_renthouse_id);
//			boolean result=rentHouseService.delete(bean);
//		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}
	
}