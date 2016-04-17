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
	
//		String temp=request.getParameter("sellhouse_id");
//		int sellhouse_id=Integer.parseInt(temp);
		String []temp_delete=request.getParameterValues("delete_sellhouse_id");
//		int delete_sellhouse_id=Integer.parseInt(temp_delete);
		if(delete!=null&&"刪除".equals(delete)){
			System.out.println("中!!");
			for (String id : temp_delete) {
				int delete_sellhouse_id=Integer.parseInt(id);
				cartbean.setSellhouse_id(delete_sellhouse_id);
				cartsBean cartresult=dao.selectbysellhouseid(cartbean);
				int cartid=0;
				try {
					cartid = cartresult.getCart_id();
				} catch (Exception e) {
				
				}	
				if(cartid!=0){
					boolean a=	dao.delete(cartid);
					System.out.println(a);
					bean.setSellhouse_id(delete_sellhouse_id);
					boolean result=sellHouseService.delete(bean);
				}else if(cartid==0)	
			bean.setSellhouse_id(delete_sellhouse_id);
			boolean result=sellHouseService.delete(bean);
			}response.sendRedirect("/Happyhouse/_02_sellhouse/SellHouseUser.jsp");												
			}
	
			
			
			
			
			
			
			
			
			
			//刪除購物車
//			cartbean.setSellhouse_id(delete_sellhouse_id);
//			cartsBean cartresult=dao.selectbysellhouseid(cartbean);
//			int cartid=0;
//			try {
//				cartid = cartresult.getCart_id();
//			} catch (Exception e) {
//			
//			}	
//			if(cartid!=0){
//				boolean a=	dao.delete(cartid);
//				System.out.println(a);
//				bean.setSellhouse_id(delete_sellhouse_id);
//				boolean result=sellHouseService.delete(bean);
//			}else if(cartid==0)	
//		bean.setSellhouse_id(delete_sellhouse_id);
//		boolean result=sellHouseService.delete(bean);
//		}
		
		
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		this.doGet(request, response);
	}

	
	
	
}
