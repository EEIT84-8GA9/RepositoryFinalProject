package _02_sellhouse.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import _01_users.model.UsersBean;
import _04_message.model.MessageService;
import _05_sms.model.SmsVO;
import _05_sms.model.sms_service;


@WebServlet("/SellHouseSMS")
public class SellHouseSMS extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SmsVO vo = new SmsVO();
		sms_service service=new sms_service();
		String user_account = request.getParameter("user_account");
		String sms_mailers = request.getParameter("sms_mailers");
		String sms_title = request.getParameter("sms_title");
		String sms_describe = request.getParameter("sms_describe");
		vo.setUser_account(user_account);
		vo.setSms_mailers(sms_mailers);
		vo.setSms_title(sms_title);
		vo.setSms_describe(sms_describe);
		SmsVO result =service.write(vo);
		if(result !=null){
			response.sendRedirect("/Happyhouse/_02_sellhouse/SellHouseSearch.jsp");
			return;
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}

}
