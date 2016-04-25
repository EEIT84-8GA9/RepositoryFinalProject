package _03_renthouse.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import _02_sellhouse.model.SellHouseBean;
import _02_sellhouse.model.SellHouseDAO;
import _02_sellhouse.model.SellHouseService;
import _02_sellhouse.model.dao.SellHouseDAOJdbc;
import _03_renthouse.model.RentHouseBean;
import _03_renthouse.model.RentHouseDAO;
import _03_renthouse.model.RentHouseService;
import _03_renthouse.model.dao.RentHouseDAOJdbc;
@WebServlet(urlPatterns = {"/reportrenthouse.controller"})
public class RentHouseResportServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RentHouseService service=new RentHouseService();
		RentHouseDAO dao=new RentHouseDAOJdbc();
		RentHouseBean bean=new RentHouseBean();
		HttpSession session = request.getSession();
		
		String reportreason=request.getParameter("reportreason");
		String sellhouse_id=request.getParameter("renthouse_id");
	
		String sellhouse_reportfrom=request.getParameter("renthouse_reportfrom");
		System.out.println("sellhouseid="+sellhouse_id+"reportreason="+reportreason+"reportreason="+sellhouse_reportfrom);
		int id=Integer.parseInt(sellhouse_id);
		bean.setRenthouse_id(id);
		bean.setRenthouse_reportfrom(sellhouse_reportfrom);
		bean.setRenthouse_reportreason(reportreason);
//	SellHouseBean bean2 = dao.select_sellhouse_id(id);
//		System.out.println("地址"+bean2.getSellhouse_address());
		//session.setAttribute("bean2", bean2);
		RentHouseBean result = service.updatereport(bean);
		if(result !=null){
		String url = request.getHeader("referer");//抓取前一頁網址!!
		response.sendRedirect(url);
//		session.removeAttribute("bean2");
		return;
	}

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doGet(request, response);
	}

	
	
	
}
