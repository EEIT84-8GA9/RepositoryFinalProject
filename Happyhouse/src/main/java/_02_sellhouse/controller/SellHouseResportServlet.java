package _02_sellhouse.controller;

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
@WebServlet(urlPatterns = {"/reportsellhouse.controller"})
public class SellHouseResportServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		SellHouseService service=new SellHouseService();
		SellHouseDAO dao=new SellHouseDAOJdbc();
		SellHouseBean bean=new SellHouseBean();
		HttpSession session = request.getSession();
		
		String reportreason=request.getParameter("reportreason");
		String sellhouse_id=request.getParameter("sellhouse_id");
		String sellhouse_reportfrom=request.getParameter("sellhouse_reportfrom");
		System.out.println(sellhouse_id);
		int id=Integer.parseInt(sellhouse_id);
		bean.setSellhouse_id(id);
		bean.setSellhouse_reportfrom(sellhouse_reportfrom);
		bean.setSellhouse_reportreason(reportreason);
	SellHouseBean bean2 = dao.select_sellhouse_id(id);
		System.out.println("地址"+bean2.getSellhouse_address());
		session.setAttribute("bean2", bean2);
		SellHouseBean result = service.updatereport(bean);
		if(result !=null){
		response.sendRedirect("/Happyhouse/_02_sellhouse/SellHouseSingleView.jsp");
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
