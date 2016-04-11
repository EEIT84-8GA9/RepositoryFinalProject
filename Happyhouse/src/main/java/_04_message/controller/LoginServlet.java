package _04_message.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import _04_message.model.LoginVO;
import _04_message.model.MessageService;



@WebServlet(urlPatterns = { "/login.controller" })
public class LoginServlet extends HttpServlet {
	private MessageService messageService = new MessageService();

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		// 接收HTML Form資料
		String username = request.getParameter("username");
		String password = request.getParameter("password");

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
			request.getRequestDispatcher("/secure/login.jsp").forward(request,
					response);
			return;
		}

		// 呼叫Model
		LoginVO bean = messageService.login(username, password);

		// 根據Model執行結果顯示View
		if (bean == null) {
			error.put("password", "登入失敗，請再次輸入ID/PWD");
			request.getRequestDispatcher("login.jsp")
					.forward(request, response);
		} else {
			String contextPath = getServletContext().getContextPath();
			String target = (String) session.getAttribute("target");
			session.setAttribute("LoginOK", bean);
			if (target != null) {
				// 先由session中移除此項屬性，否則下一次User直接執行login功能後，
				// 會再度被導向到 target
				session.removeAttribute("target");
				// 導向 contextPath + target
				// response.sendRedirect(contextPath + target);
				System.out.println("contextPath:" + contextPath);
				System.out.println("target:" + target);
				response.sendRedirect(response.encodeRedirectURL(contextPath
						+ target));
			}else {
				// 導向 contextPath + "/index.jsp"
				//response.sendRedirect(contextPath + "/index.jsp");
                response.sendRedirect(
			      response.encodeRedirectURL(contextPath + "/index.jsp" ));

			}
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		this.doGet(req, resp);
	}
}
