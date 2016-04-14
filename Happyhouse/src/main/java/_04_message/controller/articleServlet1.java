package _04_message.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import _01_users.model.UsersBean;
import _04_message.model.MessageService;
import _04_message.model.MessageVO;




@WebServlet(
		urlPatterns={"/addarticle.controller"}
)
public class articleServlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MessageService messageService = new MessageService();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//接收HTML Form資料
		
				request.setCharacterEncoding("UTF-8");
				HttpSession session = request.getSession();
				
				// 準備存放錯誤訊息的 Map<String, String> 物件 : errorMsgMap
				Map<String, String> error = new HashMap<String, String>();
				// 將 errorMsgMap 放入 request 置物櫃內，識別字串為 "ErrorMsgKey"
				request.setAttribute("error", error);
				
				String title = request.getParameter("title");
				String content = request.getParameter("content");
				String type = request.getParameter("type");
				
				System.out.println("主題:"+title);
				session.removeAttribute("resp");
//				System.out.println("41行刪session-resp");
				session.removeAttribute("add");
//				System.out.println("41行刪session-add");
				session.removeAttribute("list");
//				System.out.println("41行刪session-list");
				
//				System.out.println("新增session-list");
				List<MessageVO> list =messageService.getall();
				session.setAttribute("list", list);
				
		//呼叫Model
				MessageVO vo =new MessageVO();
				if(content!=null){
				vo.setMessage_title(title);
				vo.setMessage_describe(content);
				UsersBean bean=(UsersBean) session.getAttribute("LoginOK");
				vo.setUser_account(bean.getUser_account());
				vo.setUser_name(bean.getUser_name());
				}
				if("送出文章".equals(type)){
					//檢查使用者輸入資料
					if (title == null || title.trim().length() == 0) {
						error.put("titleEmpty", "主題不允許空白");
					}
					if (content == null || content.trim().length() == 0) {
						error.put("contentEmpty", "內容不允許空白");
					}
					if (title.length()>25) {
						error.put("titleToolong", "主題字數過長超過25個字");
					}
					//驗證HTML Form資料
					if(error!=null && !error.isEmpty()) {
						System.out.println("新增有誤");
						request.getRequestDispatcher(
								"/_04_message/addarticle.jsp").forward(request, response);
						return;
					}
				}else if("回覆".equals(type)){
					//檢查使用者輸入資料
					if (content == null || content.trim().length() == 0) {
						error.put("contentEmpty", "內容不允許空白");
					}
					
					//驗證HTML Form資料
					if(error!=null && !error.isEmpty()) {
//						System.out.println("回應內容不允許空白");
//						System.out.println("84行刪session-add");
						session.removeAttribute("add");
						MessageVO DBVO=messageService.select(title);
//						System.out.println("呼叫dao-select(title),request.setAttribute('resperror', DBVO)");
						request.setAttribute("resperror", DBVO);
						request.getRequestDispatcher(
								"/_04_message/pagecontent.jsp").forward(request, response);
						return;
					}
				}
				
		
				
				
		//根據Model執行結果顯示View
				if("送出文章".equals(type)){
					MessageVO DBVO = messageService.select(vo.getMessage_title());
					if(DBVO==null){
						MessageVO result = messageService.add(vo);
						
//						System.out.println("100行刪session-add");
//						System.out.println("100行刪session-resp");
						session.removeAttribute("resp");
						session.removeAttribute("add");
//						System.out.println("新增session-add");
						session.setAttribute("add", result);
//						System.out.println("已新增主題待轉頁");
						response.sendRedirect("_04_message/pagecontent.jsp");
					}else{
						error.put("titleSame", "主題已重複");
//						System.out.println("新增主題已重複");
						request.getRequestDispatcher("/_04_message/addarticle.jsp").forward(request, response);
					}
					return;
				}
				else if("回覆".equals(type)){
					MessageVO result = messageService.resp(vo);
//					System.out.println("117行刪session-add");
//					System.out.println("118行刪session-resp");
					session.removeAttribute("add");
					session.removeAttribute("resp");
//					System.out.println("新增session-resp");
					session.setAttribute("resp", result);
//					System.out.println("已新增回應待轉頁");
					response.sendRedirect("_04_message/pagecontent.jsp");
//					request.setAttribute("resp", result);
//					request.getRequestDispatcher("pagecontent.jsp").forward(request, response);
					return;
					
				}
				
				session.removeAttribute("resp");
//				System.out.println("123行刪session-add");
//				System.out.println("123行刪session-resp");
				session.removeAttribute("add");
//				System.out.println("回討論區");
//				System.out.println("------------------------------------");
				response.sendRedirect("_04_message/mainpage.jsp");
				return;
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
