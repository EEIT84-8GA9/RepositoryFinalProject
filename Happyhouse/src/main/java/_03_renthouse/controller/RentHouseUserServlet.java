package _03_renthouse.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import _02_sellhouse.model.SellHouseBean;
import _02_sellhouse.model.SellHouseService;
import _03_renthouse.model.RentHouseBean;
import _03_renthouse.model.RentHouseService;
import _07_carts.model.cartsBean;
import _07_carts.model.dao.cartsDAO;
@WebServlet(urlPatterns = { "/house/renthouseuser.controller" })
public class RentHouseUserServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RentHouseService rentHouseService=new RentHouseService();
		cartsDAO dao=new cartsDAO();
		cartsBean cartbean=new cartsBean();
		RentHouseBean bean =new RentHouseBean();
		String delete=request.getParameter("delete");
	
//		String temp=request.getParameter("sellhouse_id");
//		int sellhouse_id=Integer.parseInt(temp);
		String []temp_delete=request.getParameterValues("delete_renthouse_id");
//		int delete_sellhouse_id=Integer.parseInt(temp_delete);
		if(delete!=null&&"刪除".equals(delete)){
			System.out.println("中!!");
			for (String id : temp_delete) {
				int delete_renthouse_id=Integer.parseInt(id);
				cartbean.setSellhouse_id(delete_renthouse_id);
				cartsBean cartresult=dao.selectbysellhouseid(cartbean);
				int cartid=0;
				try {
					cartid = cartresult.getCart_id();
				} catch (Exception e) {
				
				}	
				if(cartid!=0){
					boolean a=	dao.delete(cartid);
					System.out.println(a);
					bean.setRenthouse_id(delete_renthouse_id);
					boolean result=rentHouseService.delete(bean);
				}else if(cartid==0)	
			bean.setRenthouse_id(delete_renthouse_id);
			boolean result=rentHouseService.delete(bean);
			}response.sendRedirect("/Happyhouse/_03_renthouse/RentHouseUser.jsp");												
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
