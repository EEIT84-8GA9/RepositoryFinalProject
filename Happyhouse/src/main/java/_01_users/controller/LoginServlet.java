package _01_users.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import _01_users.model.UserService;
import _01_users.model.UsersBean;




@WebServlet(
		urlPatterns={"/secure/login.controller"}
)
public class LoginServlet extends HttpServlet {
	private UserService userService = new UserService();
	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

//接收HTML Form資料
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
//驗證HTML Form資料
		Map<String, String> error = new HashMap<String, String>();
		request.setAttribute("error", error);

		if(username==null || username.length()==0) {
			error.put("username", "請輸入ID");
		}
		if(password==null || password.length()==0) {
			error.put("password", "請輸入PWD");
		}
		
		if(error!=null && !error.isEmpty()) {
			request.getRequestDispatcher(
					"/secure/login.jsp").forward(request, response);
			return;
		}
		
//呼叫Model
		UsersBean bean = userService.login(username, password);
		
//根據Model執行結果顯示View
      if(bean==null) {
			error.put("password", "登入失敗，請再次輸入ID/PWD");
			request.getRequestDispatcher(
					"/secure/login.jsp").forward(request, response);
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("user", bean);
			
			String dest = (String) session.getAttribute("dest");
			if(dest==null || dest.length()==0) {
				String path = request.getContextPath();
				response.sendRedirect(path+"/index.jsp");
			} else {
				session.removeAttribute("dest");
				response.sendRedirect(dest);
			}
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		this.doGet(req, resp);
	}
}
