package _02_sellhouse.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import _02_sellhouse.model.SellHouseBean;
import _02_sellhouse.model.SellHouseService;
import _07_carts.model.cartsBean;
import _07_carts.model.dao.cartsDAO;
@WebServlet(urlPatterns = { "/house/sellhouseuser.controller" })
public class SellHouseUserServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		SellHouseService sellHouseService=new SellHouseService();
		cartsDAO dao=new cartsDAO();
		cartsBean cartbean=new cartsBean();
		SellHouseBean bean =new SellHouseBean();
		String delete=request.getParameter("delete");
		String temp_delete=request.getParameter("delete_sellhouse_id");
		int delete_sellhouse_id=Integer.parseInt(temp_delete);
		if(delete!=null&&"刪除".equals(delete)){
			//刪除購物車
			cartbean.setSellhouse_id(delete_sellhouse_id);
			cartsBean cartresult=dao.selectbysellhouseid(cartbean);
			if(cartresult.getCart_id()!=null){
				int cartid = cartresult.getCart_id();
				boolean a=	dao.delete(cartid);
				System.out.println(a);
			}
			//刪除購物車
		bean.setSellhouse_id(delete_sellhouse_id);
		boolean result=sellHouseService.delete(bean);
		}
		
		
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		this.doGet(request, response);
	}

	
	
	
}
