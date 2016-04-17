package _02_sellhouse.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import _02_sellhouse.model.SellHouseBean;
import _02_sellhouse.model.SellHouseService;
@WebServlet("/reportsellhouse.controller")
public class SellHouseResportServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		SellHouseService service=new SellHouseService();
		SellHouseBean bean=new SellHouseBean();
	String reportreason=	request.getParameter("reportreason");
	String sellhouse_id=request.getParameter("sellhouse_id");
	String sellhouse_reportfrom=request.getParameter("sellhouse_reportfrom");
	int id=Integer.parseInt(sellhouse_id);
	bean.setSellhouse_id(id);
	bean.setSellhouse_reportfrom(sellhouse_reportfrom);
	bean.setSellhouse_reportreason(reportreason);
	SellHouseBean result = service.updatereport(bean);
	String path= request.getServletContext().getRealPath("/");
	System.out.println(path);
	if(result !=null){
		response.sendRedirect("/Happyhouse/_02_sellhouse/SellHouseSearch.jsp");
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
