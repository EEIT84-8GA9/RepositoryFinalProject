package _01_users.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import _01_users.model.UserService;
import _01_users.model.UsersBean;



@MultipartConfig(location = "", fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 500, maxRequestSize = 1024 * 1024 * 500 * 5)
@WebServlet("/secure/regist.controller")

public class RegistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RegistServlet() {
		super();

	}

	private UserService userService = new UserService();

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 接收HTML Form資料
		String user_account = request.getParameter("user_account");
		String user_password = request.getParameter("user_password");
		String user_name = request.getParameter("user_name");
		String user_address = request.getParameter("user_address");
		String user_phone = request.getParameter("user_phone");
		String user_email = request.getParameter("user_email");
		String user_gender = request.getParameter("user_gender");
		long sizeInBytes1 = 0;
		String fldName1 = "";
		String fileName1 = "";
		InputStream is1 = null;
		// 驗證HTML Form資料

		Map<String, String> error = new HashMap<String, String>();
		request.setAttribute("error", error);

		if (user_account == null || user_account.trim().length() == 0) {
			error.put("user_account", "請輸入帳號");
		}
		if (user_password == null || user_password.trim().length() == 0) {
			error.put("user_password", "請輸入密碼");
		}
		if (user_name == null || user_name.trim().length() == 0) {
			error.put("user_name", "請輸入名子");
		}
		if (user_address == null || user_address.trim().length() == 0) {
			error.put("user_address", "請輸入地址");
		}
		if (user_phone == null || user_phone.trim().length() == 0) {
			error.put("user_phone", "請輸入聯絡電話");
		}
		if (user_email == null || user_email.trim().length() == 0) {
			error.put("user_email", "請輸入電子信箱");
		}
		if (user_gender == null || user_gender.trim().length() == 0) {
			error.put("user_gender", "請輸入性別");
		}

		if (error != null && !error.isEmpty()) {
			request.getRequestDispatcher("../_01_users/regist.jsp").forward(request,
					response);
			// request.getRequestDispatcher(
			// "/secure/login.jsp").forward(request, response);
			return;
		}

		// 呼叫Model
		UsersBean regbean = new UsersBean();
		regbean.setUser_account(user_account);
		regbean.setUser_password(user_password);
		regbean.setUser_name(user_name);
		regbean.setUser_address(user_address);
		regbean.setUser_phone(user_phone);
		regbean.setUser_email(user_email);
		regbean.setUser_gender(user_gender);

//		UsersBean bean = userService.regist(regbean,is1,sizeInBytes1);
//		System.out.print(bean);
		// 根據Model執行結果顯示View
		if (regbean != null) {
            HttpSession session = request.getSession();
			session.setAttribute("LoginOK", regbean);
			String target = (String) session.getAttribute("target");
			Collection<Part> parts = request.getParts() ;
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
							fileName1 = userService.getFileName(p); // 此為圖片檔的檔名
							fileName1 = userService.adjustFileName(fileName1,
									userService.IMAGE_FILENAME_LENGTH);
						} 
						if (fileName1 !=null && fileName1.trim().length() > 0) {
							regbean.setUser_photo1_name(fileName1);
							
						}
					}
					
				}
			}	
//			System.out.println(is1+"name"+regbean.getUser_photo1_name());
			UsersBean result = userService.regist(regbean, is1, sizeInBytes1);
			System.out.print(result);
			if(result==null) {
				error.put("action", "Insert 失敗");
				request.getRequestDispatcher("../_01_users/login.jsp")
				.forward(request, response);
			} else {
				request.setAttribute("insert", result);
			    String path = request.getContextPath();
				response.sendRedirect(path + "/index.jsp");
			 
			}
//			if (target == null || target.length() == 0) {
//				String path = request.getContextPath();
//				response.sendRedirect(path + "/index.jsp");
//			} else {
//				
//			request.getRequestDispatcher("/_01_users/login.jsp")
//			.forward(request, response);
//			}
		}

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
