package _02_sellhouse.controller;

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
import _02_sellhouse.model.SellHouseBean;
import _02_sellhouse.model.SellHouseDAO;
import _02_sellhouse.model.dao.SellHouseDAOJdbc;
import _04_message.model.MessageService;
import _04_message.model.MessageVO;
import _05_sms.model.SmsVO;
import _05_sms.model.sms_service;

@WebServlet(urlPatterns = { "/sellhouse.sms.controller" })
public class sellhouse_sms_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	sms_service service = new sms_service();
	private MessageService messageService = new MessageService();
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		String temp4=request.getParameter("sellhouse_id2");
		System.out.println(temp4);
		int sellhouse_id=Integer.parseInt(temp4);
//		System.out.println("5555"+temp4);
		String title=request.getParameter("title");
		String sms_title = request.getParameter("sms_title");
		String user_account = request.getParameter("user_account2");
		System.out.println("user_account"+user_account);
		String sms_describe = request.getParameter("sms_describe");
		String type = request.getParameter("type");
		String[] sms_id = request.getParameterValues("sms_id");
		System.out.println(title);
		UsersBean bean = (UsersBean) session.getAttribute("LoginOK");
	
		if (bean != null) {
			List<SmsVO> result = service.select(bean.getUser_account());
			session.setAttribute("list", result);
		}
		
		if ("送出".equals(type)){
			System.out.println("登入帳號"+bean.getUser_account());
			SellHouseDAO dao=new SellHouseDAOJdbc();
			SellHouseBean bean2 = dao.select_sellhouse_id(sellhouse_id);
			
			SmsVO vo = new SmsVO();
			vo.setSms_describe(sms_describe);
			vo.setSms_mailers(bean.getUser_account());
			vo.setUser_account(user_account);
			vo.setSms_title(sms_title);
			System.out.println("帳號"+vo.getUser_account());
			System.out.println("title"+vo.getSms_title());
			System.out.println("密碼"+vo.getSms_mailers());
			SmsVO bean_write = service.write(vo);
		//	session.setAttribute("bean2", bean2);
			List<SmsVO> result = service.select(bean.getUser_account());
			session.setAttribute("list", result);
	
		String url = request.getHeader("referer");//抓取前一頁網址!!
			response.sendRedirect(url);
			return;
		}

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
