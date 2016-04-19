package _09_furniture.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import _09_furniture.model.FurnitureBean;
import _09_furniture.model.FurnitureService;



@WebServlet(
		urlPatterns={"/pages/product.controller"}
)
public class ProductServlet extends HttpServlet {
	private SimpleDateFormat sFormat = new SimpleDateFormat("yyyy-MM-dd");
	private FurnitureService productService = new FurnitureService();
	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
//接收HTML Form資料
		String temp1 = request.getParameter("furniture_id");
		
//		String temp2 = request.getParameter("price");
//		String time = request.getParameter("time");
//		String message = request.getParameter("message");
		String prodaction = request.getParameter("prodaction");
		
		String user_account =request.getParameter("user_account");
		String insname = request.getParameter("insname");
		String dubleprice = request.getParameter("insprice");
		String insstatus = request.getParameter("insstatus");
		String instime = request.getParameter("instime");
		String insaddress = request.getParameter("insaddress");
		String insmessage = request.getParameter("insmessage");
		String instype = request.getParameter("instype");
		

	
		
		
	
		
//轉換HTML Form資料
		Map<String, String> error = new HashMap<String, String>();
		request.setAttribute("error", error);
	
		int id = 0;
		if(temp1!=null && temp1.trim().length()!=0) {
			try {
				id = Integer.parseInt(temp1.trim());
			} catch (NumberFormatException e) {
				e.printStackTrace();
				error.put("id", "Id必須是整數");
			}
		}

		double price = 0;
		if(dubleprice!=null && dubleprice.trim().length()!=0) {
			try {
				price = Double.parseDouble(dubleprice.trim());
			} catch (NumberFormatException e) {
				e.printStackTrace();
				error.put("price", "Price必須是數字");
			}
		}

		
//驗證HTML Form資料
//		if("Insert".equals(prodaction) || "Update".equals(prodaction) || "Delete".equals(prodaction)) {
//			if(temp1==null || temp1.trim().length()==0) {
//				error.put("id", "請輸入Id以便於執行"+prodaction);
//			}
//		}
		
		if(error!=null && !error.isEmpty()) {
			System.out.println("5555");
			request.getRequestDispatcher(
					"/_09_furniture/product.jsp").forward(request, response);
			return;
		}
		
//呼叫Model
		FurnitureBean bean = new FurnitureBean();
//		bean.setFurniture_id(id);
//		bean.setFurniture_neme(name);
//		bean.setFurniture_price(price);
//	    bean.setFurniture_time(time);
//		bean.setFurnitur_message(message);
		bean.setUser_account(user_account);
		bean.setFurniture_neme(insname);
		bean.setFurniture_status(insstatus);
		bean.setFurniture_time(instime);
		bean.setFurniture_address(insaddress);
		bean.setFurniture_price(price);
		bean.setFurniture_message(insmessage);
		bean.setFurniture_type(instype);
		bean.setFurniture_id(id);
	
//根據Model執行結果顯示View
	
		if("查詢所有刊登家具".equals(prodaction)) { 
//			System.out.println(bean);
			List<FurnitureBean> result = productService.select(bean);
		
			request.setAttribute("select", result);
			request.getRequestDispatcher(
					"/_09_furniture/display.jsp").forward(request, response);
		} 
		else if("查詢您的刊登家具".equals(prodaction)){
			List<FurnitureBean> result = productService.selectSelf(user_account);
			request.setAttribute("select1", result);
			request.getRequestDispatcher(
					"/_09_furniture/display1.jsp").forward(request, response);
		}
		else if(prodaction!=null && prodaction.equals("新增刊登")) {
			FurnitureBean result = productService.insert(bean);
			System.out.print(result);
			if(result==null) {
				error.put("action", "Insert 失敗");
			} else {
				request.setAttribute("insert", result);
			}
			request.getRequestDispatcher(
					"/_09_furniture/product.jsp").forward(request, response);
		} 
		else if(prodaction!=null && prodaction.equals("更新商品資訊")) {
			FurnitureBean result = productService.update(bean);
			System.out.println("5555"+id);
			if(result==null) {
				error.put("action", "Update fail");
			} else {
				System.out.println("resultd="+result);
				request.setAttribute("update", result);
			}
			request.getRequestDispatcher(
					"/_09_furniture/product.jsp").forward(request, response);
		} else if(prodaction!=null && prodaction.equals("Delete")) {
			boolean result = productService.delete(bean);
			if(!result) {
				System.out.println("0"+bean);
				request.setAttribute("delete", 0);
			} else {
				System.out.println("1"+bean);
				request.setAttribute("delete", 1);
			}
			request.getRequestDispatcher(
					"/_09_furniture/product.jsp").forward(request, response);
		} else  {
			error.put("action", "Unknown Action:"+prodaction);
			System.out.println("5555");
			request.getRequestDispatcher(
					"/_09_furniture/product.jsp").forward(request, response);
		}
	}
	@Override
	protected void doPost(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		this.doGet(req, resp);
	}
}
