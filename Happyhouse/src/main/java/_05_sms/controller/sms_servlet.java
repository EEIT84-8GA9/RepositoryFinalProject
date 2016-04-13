package _05_sms.controller;

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

import _04_message.model.LoginVO;
import _04_message.model.MessageService;
import _04_message.model.MessageVO;
import _05_sms.model.SmsVO;
import _05_sms.model.sms_service;

@WebServlet(urlPatterns = { "/sms.controller" })
public class sms_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	sms_service service = new sms_service();
	private MessageService messageService = new MessageService();
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		Map<String, String> error = new HashMap<>();
		request.setAttribute("error", error);
		
		String title=request.getParameter("title");
		String sms_title = request.getParameter("sms_title");
		String user_account = request.getParameter("user_account");
		String sms_describe = request.getParameter("sms_describe");
		String type = request.getParameter("type");
		String[] sms_id = request.getParameterValues("sms_id");

		LoginVO bean = (LoginVO) session.getAttribute("LoginOK");
		if (bean != null) {
			List<SmsVO> result = service.select(bean.getUser_account());
			session.setAttribute("list", result);
		}
		// 驗證請求資料
		if("發送訊息".equals(type) || "回覆訊息".equals(type)) {
			if (sms_title == null || sms_title.trim().length() == 0) {
				error.put("sms_titleEmpty", "標題不允許空白");
			}
			if(sms_title.length()>25){
				error.put("sms_titleToolong", "標題不能超過10字");
			}
			if (user_account == null || user_account.trim().length() == 0) {
				error.put("user_accountEmpty", "收信人不允許空白");
			}
//			if(user_account.equals(bean.getUser_account())){
//				error.put("sameUser","無法寄給本人");
//			}
		}
		
		 if ("刪除信件".equals(type)){
			 if (sms_id == null || sms_id.length == 0) {
					error.put("deleteSms_idEmpty", "無信件被刪除");
				}
		 }
		if (error != null && !error.isEmpty()) {
			error.put("errorMessage", "新增有誤");
			if ("發送訊息".equals(type)) {
				request.getRequestDispatcher("_05_sms/sms_addnewpage.jsp")
						.forward(request, response);
				return;
			} else if ("回覆訊息".equals(type)) {
				request.getRequestDispatcher("_05_sms/sms_resppage.jsp")
						.forward(request, response);
				return;
			} else if ("刪除信件".equals(type)) {
				request.getRequestDispatcher("_05_sms/sms_mainpage.jsp")
						.forward(request, response);
				return;
			}
		}
		if ("發送訊息".equals(type) || "回覆訊息".equals(type)) {
			if ("發送訊息".equals(type)) {
				Boolean result = service.getAll_user_account(user_account);

				if (result == false) {
					error.put("errorUser_account", "查無此帳號");
					request.getRequestDispatcher("_05_sms/sms_addnewpage.jsp")
							.forward(request, response);
					return;
				}
			}
			SmsVO vo = new SmsVO();
			vo.setSms_describe(sms_describe);
			vo.setSms_mailers(bean.getUser_account());
			vo.setUser_account(user_account);
			vo.setSms_title(sms_title);
			SmsVO bean_write = service.write(vo);
			if (bean_write != null) {
				session.removeAttribute("list");
				List<SmsVO> result = service.select(bean.getUser_account());
				session.setAttribute("list", result);
				response.sendRedirect("_05_sms/sms_mainpage.jsp");
				return;
			}
			// else{
			// request.getRequestDispatcher("_05_sms/sms_addnewpage.jsp").forward(request,
			// response);
			// return;
			// }
		} else if ("回覆".equals(type)) {
			SmsVO vo = new SmsVO();
			vo.setSms_describe(sms_describe);
			vo.setUser_account(user_account);
			vo.setSms_title(sms_title);
			session.setAttribute("resp", vo);
			response.sendRedirect("_05_sms/sms_resppage.jsp");
			return;
		} else if ("刪除信件".equals(type)) {
			for (String id : sms_id) {
				int smsid = Integer.parseInt(id);
				service.delete(smsid);
			}
			session.removeAttribute("list");
			List<SmsVO> result = service.select(bean.getUser_account());
			session.setAttribute("list", result);
			response.sendRedirect("_05_sms/sms_mainpage.jsp");
			return;

		}else if ("傳送".equals(type)){
			SmsVO vo = new SmsVO();
			vo.setSms_describe(sms_describe);
			vo.setSms_mailers(bean.getUser_account());
			vo.setUser_account(user_account);
			vo.setSms_title(sms_title);
			SmsVO bean_write = service.write(vo);
			List<MessageVO> list =messageService.getall();
			session.setAttribute("list", list);
			//resperror 暫時用此識別字串，因pagecontent已有
			MessageVO resperror=messageService.select(title);
			session.setAttribute("resperror", resperror);
			response.sendRedirect("_04_message/pagecontent.jsp");
			return;
		}
		response.sendRedirect("_05_sms/sms_mainpage.jsp");
		return;
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
