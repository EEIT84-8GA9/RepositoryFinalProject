//package _07_carts.controller;
//
//import java.io.IOException;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import _01_users.model.UsersBean;
//import _07_carts.model.cartsService;
//import _07_carts.model.cartsrentBean;
//import _07_carts.model.cartssellBean;
//import _07_carts.model.dao.cartsDAO;
//
//
//
//
//@WebServlet("spselltest.controller")
//
//
//public class cartsSellServlet extends HttpServlet {
//	private cartsService service = new cartsService();
//	private static final long serialVersionUID = 1L;
//	
//	
//	
//    
//
//
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
//	   doPost(request,response);	
//	
//	}
//
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//	
//		//版面設定UTF-8格式
//		
//				request.setCharacterEncoding("UTF-8");
//				
//				//裝錯誤訊息用
//				
//				HttpSession session = request.getSession();
//				
//
//				
//				Map<String, String> error = new HashMap<String, String>();
//				request.setAttribute("error", error);
//				
//				// 接收HTML的資料
//				//String user_account = request.getParameter("user_account");
//				// 改接收session的使用者資料
//				
//				UsersBean bean1 = (UsersBean) session.getAttribute("LoginOK");
//				if (bean1 != null) {
//				    String user_account = bean1.getUser_account();
//				    
//				String selldelete = request.getParameter("deletecart");
//				
//				// 轉換HTML的資料(只要刪除所以不用轉換資料)
//				
//				//驗證HTML的資料(同上)
//				
//				
//				//連Model都懶的呼叫了
//		
//
//				
//	}
//}
//
//}
