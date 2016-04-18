package _04_message.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import _04_message.model.MessageService;
import _04_message.model.MessageVO;

@WebServlet("/GMmessage.controller")
public class GMmessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MessageService messageService = new  MessageService();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String id=request.getParameter("id");
	String message_type=request.getParameter("message_type");
	System.out.println(id);
	System.out.println(message_type);
	
	HttpSession session =request.getSession();
	session.removeAttribute("list");
	
	
	if(id !=null){
		System.out.println("ID!=NULL");
		int message_id =Integer.parseInt(id);
		MessageVO vo =new MessageVO();
		vo.setMessage_id(message_id);
		vo.setMessage_type(message_type);
		MessageVO result=messageService.message_typeUpdate(vo);
	}
	List<MessageVO> list=messageService.getall();
	session.setAttribute("list", list);
	response.sendRedirect("/Happyhouse/_04_message/GMmessage.jsp");
	return;
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
