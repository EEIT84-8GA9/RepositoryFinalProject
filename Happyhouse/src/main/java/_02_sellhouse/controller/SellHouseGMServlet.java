package _02_sellhouse.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import _02_sellhouse.model.SellHouseBean;
import _02_sellhouse.model.SellHouseDAO;
import _02_sellhouse.model.SellHouseService;
import _02_sellhouse.model.dao.SellHouseDAOJdbc;


@WebServlet(urlPatterns = { "/sellhouse.GM.controller" })
public class SellHouseGMServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

  


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sellhouse_type=request.getParameter("type");
		String temp=request.getParameter("id1");
		int sellhouse_id=Integer.parseInt(temp);
		System.out.println(sellhouse_id);
		System.out.println(sellhouse_type);
		SellHouseBean bean=new SellHouseBean();
		bean.setSellhouse_id(sellhouse_id);
		bean.setSellhouse_type(sellhouse_type);
		SellHouseDAO dao=new SellHouseDAOJdbc();
		dao.GMupdate(bean);
		response.sendRedirect("/Happyhouse/_02_sellhouse/SellHouseGM.jsp");
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
