package _04_message.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import _04_message.model.MessageService;
import _04_message.model.MessageVO;

@WebServlet("/reportcontroller.controller")
public class reportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MessageService messageService =new MessageService();   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session =request.getSession();
		String urName = request.getParameter("urName");
		String reportreason = request.getParameter("reportreason");
		String title=request.getParameter("title");
		String idNumber=request.getParameter("idNumber");
		int id=Integer.parseInt(idNumber);
		
		MessageVO vo =new MessageVO();
		vo.setMessage_reportfrom(urName);
		vo.setMessage_reportreason(reportreason);
		vo.setMessage_id(id);
		
		MessageVO result=messageService.reportupdate(vo);
		if(result != null){
			response.sendRedirect("/Happyhouse/addarticle.controller");
			return;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
