package _02_sellhouse.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import _02_sellhouse.model.SellHouseBean;
import _02_sellhouse.model.SellHouseService;




@WebServlet(
		urlPatterns={"/house/house.controller"}
)
public class SellHouseServlet extends HttpServlet {
	private SellHouseService sellHouseService=new SellHouseService();

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 接收資料
		String temp1 = request.getParameter("sellhouse_id");
		String user_account = request.getParameter("user_account");
		String sellhouse_name = request.getParameter("sellhouse_name");
		String temp3 = request.getParameter("sellhouse_price");
		String sellhouse_patterns = request.getParameter("sellhouse_patterns");
		String sellhouse_address = request.getParameter("sellhouse_address");
		String sellhouse_describe = request.getParameter("sellhouse_describe");
		String temp7 = request.getParameter("sellhouse_size");
		String sellhouse_floor = request.getParameter("sellhouse_floor");
		String temp9 = request.getParameter("sellhouse_age");
		String sellhouse_type = request.getParameter("sellhouse_type");
		String sellhouse_message = request.getParameter("sellhouse_message");
		String sellhouse_date = request.getParameter("sellhouse_date");
		String sellhouse_car = request.getParameter("sellhouse_car");
		String sellhouse_phone = request.getParameter("sellhouse_phone");
		String sellhouse_email = request.getParameter("sellhouse_email");
		String prodaction = request.getParameter("prodaction");
		// 轉換資料
		Map<String, String> error = new HashMap<String, String>();
		request.setAttribute("error", error);
		int sellhouse_id=0;
		if(temp1 !=null&&temp1.trim().length()!=0){
			try {
				sellhouse_id = Integer.parseInt(temp1);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				error.put("sellhouse_id", "id必須是數字");
			}
		}
		
		
		int sellhouse_price = 0;
		if (temp3 != null && temp3.trim().length() != 0) {
			try {
				sellhouse_price = Integer.parseInt(temp3);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				error.put("sellhouse_price", "價錢必須是數字");
			}
		}
		int sellhouse_size = 0;
		if (temp7 != null && temp7.trim().length() != 0) {
			try {
				sellhouse_size = Integer.parseInt(temp7);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				error.put("sellhouse_size", "坪數必須是數字");
			}
		}
		int sellhouse_age = 0;
		if (temp9 != null && temp9.trim().length() != 0) {
			try {
				sellhouse_age = Integer.parseInt(temp9);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				error.put("sellhouse_age", "屋齡必須是數字");
			}
		}
		//驗證HTML Form資料
		SellHouseBean bean=new SellHouseBean();
		if("搜尋".equals(prodaction)){
			bean.setUser_account(user_account);
			bean.setSellhouse_address(sellhouse_address);
			bean.setSellhouse_price(sellhouse_price);
			bean.setSellhouse_name(sellhouse_name);
			bean.setSellhouse_id(sellhouse_id);
			List<SellHouseBean> result=sellHouseService.select(bean);
			request.setAttribute("select", result);
			request.getRequestDispatcher("/house/SellHouseView.jsp").forward(request, response);
		}else if(prodaction!=null&&"新增".equals(prodaction)){
			bean.setUser_account(user_account);
			bean.setSellhouse_name(sellhouse_name);
			bean.setSellhouse_price(sellhouse_price);
			bean.setSellhouse_patterns(sellhouse_patterns);
			bean.setSellhouse_address(sellhouse_address);
			bean.setSellhouse_describe(sellhouse_describe);
			bean.setSellhouse_floor(sellhouse_floor);
			bean.setSellhouse_age(sellhouse_age);
			bean.setSellhouse_type(sellhouse_type);
			bean.setSellhouse_message(sellhouse_message);
			bean.setSellhouse_car(sellhouse_car);
			bean.setSellhouse_phone(sellhouse_phone);
			bean.setSellhouse_email(sellhouse_email);
			SellHouseBean result=sellHouseService.insert(bean);
			request.getRequestDispatcher("/house/SellHouse.jsp").forward(request, response);
		}else if(prodaction!=null&&"修改".equals(prodaction)){
			bean.setSellhouse_id(sellhouse_id);
			bean.setSellhouse_name(sellhouse_name);
			bean.setSellhouse_price(sellhouse_price);
			bean.setSellhouse_patterns(sellhouse_patterns);
			bean.setSellhouse_address(sellhouse_address);
			bean.setSellhouse_describe(sellhouse_describe);
			bean.setSellhouse_floor(sellhouse_floor);
			bean.setSellhouse_age(sellhouse_age);
			bean.setSellhouse_type(sellhouse_type);
			bean.setSellhouse_message(sellhouse_message);
			bean.setSellhouse_car(sellhouse_car);
			bean.setSellhouse_phone(sellhouse_phone);
			bean.setSellhouse_email(sellhouse_email);
			SellHouseBean result=sellHouseService.update(bean);	
		}else if(prodaction!=null&&"刪除".equals(prodaction)){
			bean.setSellhouse_id(sellhouse_id);
			boolean result=sellHouseService.delete(bean);
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

	
	
}
