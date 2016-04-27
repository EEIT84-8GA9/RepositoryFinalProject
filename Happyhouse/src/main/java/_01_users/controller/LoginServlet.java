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

@WebServlet(urlPatterns = { "/secure/login.controller" })
public class LoginServlet extends HttpServlet {
	private UserService userService = new UserService();

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		// 接收HTML Form資料
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String password1 = request.getParameter("password1");
		String password2 = request.getParameter("password2");
		String log = request.getParameter("log");

		// 驗證HTML Form資料

		Map<String, String> error = new HashMap<String, String>();
		request.setAttribute("error", error);

		if (username == null || username.length() == 0) {
			error.put("username", "請輸入ID");
		}
		if (password == null || password.length() == 0) {
			error.put("password", "請輸入PWD");
		}

		if (error != null && !error.isEmpty()) {
			request.getRequestDispatcher("/_01_users/login.jsp").forward(
					request, response);
			return;
		}

		// 呼叫Model
		UsersBean bean;

		// 根據Model執行結果顯示View
		if (log != null && "登入".equals(log)) {
			bean = userService.login(username, password);
			
			if (bean == null) {
         
                 error.put("password", "登入失敗，請再次輸入ID/PWD");
				request.getRequestDispatcher("/_01_users/login.jsp").forward(
						request, response);
			}
			if("D".equals(bean.getUser_type())){
				error.put("type", "此帳號已被封鎖");
				HttpSession session = request.getSession();
				session.removeAttribute("LoginOK");
			    request.getRequestDispatcher("/_01_users/login.jsp").forward(
						request, response);
			}
			else {
			
				HttpSession session = request.getSession();
				session.setAttribute("LoginOK", bean);
				String target = (String) session.getAttribute("target");
				if (target == null || target.length() == 0) {
					String path = request.getContextPath();
					response.sendRedirect(path + "/index.jsp");
				} else {
					session.removeAttribute("target");
					String path = request.getContextPath();
					response.sendRedirect(path+target);
				}
			}
		}
		if (log != null && "登出".equals(log)) {
			HttpSession session = request.getSession();
			session.removeAttribute("LoginOK");
			request.getRequestDispatcher("/_01_users/login.jsp").forward(
					request, response);
		}
		if (log != null && "確認更改".equals(log)) {
			System.out.println("5555");
			if (password1.equals(password2)) {
				bean = userService.login(username, password);
				// username=bean.getUser_account();
				userService.changePassword(username, password, password2);
				HttpSession session = request.getSession();
				session.setAttribute("ChangeOK", bean);
				String path = request.getContextPath();
				response.sendRedirect("/_01_users/changeOK.jsp");

			} else {
				request.getRequestDispatcher("/_01_users/chasgePw.jsp")
						.forward(request, response);

			}

		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		this.doGet(req, resp);
	}
}
