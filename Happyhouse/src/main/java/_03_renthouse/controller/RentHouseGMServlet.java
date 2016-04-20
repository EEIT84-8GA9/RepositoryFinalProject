package _03_renthouse.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import _03_renthouse.model.RentHouseBean;
import _03_renthouse.model.RentHouseDAO;
import _03_renthouse.model.dao.RentHouseDAOJdbc;


@WebServlet(urlPatterns = { "/renthouse.GM.controller" })
public class RentHouseGMServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

  


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String renthouse_type=request.getParameter("type");
		String temp=request.getParameter("id");
		int renthouse_id=Integer.parseInt(temp);
		System.out.println(renthouse_id);
		System.out.println(renthouse_type);
		RentHouseBean bean=new RentHouseBean();
		bean.setRenthouse_id(renthouse_id);
		bean.setRenthouse_type(renthouse_type);
		RentHouseDAO dao=new RentHouseDAOJdbc();
		dao.GMupdate(bean);
		response.sendRedirect("/Happyhouse/_03_renthouse/RentHouseGM.jsp");
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
