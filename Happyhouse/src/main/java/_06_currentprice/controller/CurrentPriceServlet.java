package _06_currentprice.controller;

import java.io.IOException;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import _06_currentprice.model.CurrentPriceBean;
import _06_currentprice.model.CurrentPriceService;







@WebServlet(
		urlPatterns={"/_06_currentprice.controller/cpweb.controller"}
		)

public class CurrentPriceServlet extends HttpServlet {

	private SimpleDateFormat sFormat = new SimpleDateFormat("yyyy-MM-dd");
	private CurrentPriceService currentpriceService = new CurrentPriceService();
	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	
	
//接收HTML Form資料
		String currentprice_city = request.getParameter("currentprice_city");
		String currentprice_bdtype = request.getParameter("currentprice_bdtype");
		String currentprice_transes = request.getParameter("currentprice_transes");
		String temp1 = request.getParameter("currentprice_housearea");
		String temp2 = request.getParameter("currentprice_tprice");
		String prodaction = request.getParameter("prodaction");
		String currentprice_address = request.getParameter("currentprice_address");
		//從jsp得到PRODACTION 4種!~用以比對  value 為新刪修選 哪一種
		
		
		System.out.println(currentprice_address);
	
//轉換HTML Form資料
//轉型為需要的資料..如果insert則轉成資料庫的型式
//Map封裝錯誤訊息~ error.put("currentprice_tprice", "必須是數字");  
		// request.setAttribute("error", error);
		// 在顯示頁面 用<span class="error">${error.currentprice_address}</span> 即可顯示 必須是數字
		Map<String, String> error = new HashMap<String, String>();
		request.setAttribute("error", error);
	
		float currentprice_housearea = 0;
		if(temp1!=null && temp1.trim().length()!=0) {
			try {
				currentprice_housearea = Float.parseFloat(temp1.trim());
			} catch (NumberFormatException e) {
				e.printStackTrace();
				error.put("currentprice_housearea", "必須為數字");
			}
		}

		float currentprice_tprice =  0;
		if(temp2!=null && temp2.trim().length()!=0) {
			try {
				currentprice_tprice =  Float.parseFloat(temp2.trim());
			} catch (NumberFormatException e) {
				e.printStackTrace();
				error.put("currentprice_tprice", "必須是數字");
				}
		}
		
		
//驗證HTML Form資料
//第一個驗證!!!  如果click的按鈕為 新刪修 則City格不可為空..若為空則導回 前頁面..但回傳剛剛輸入的值 回填~~!
		if("Insert".equals(prodaction) || "Update".equals(prodaction) || "Delete".equals(prodaction)) {
			if(currentprice_city==null || currentprice_city.trim().length()==0) {
				error.put("currentprice_city", "請輸入city以便於執行"+prodaction);
			}
		}
		if("Pick".equals(prodaction)) {
			if(currentprice_address==null || currentprice_address.trim().length()==0) {
				error.put("currentprice_address", "請輸入address以便於執行"+prodaction);
			}
		}
		
		
		if(error!=null && !error.isEmpty()) {
			request.getRequestDispatcher(
					"/pages/cpweb.jsp").forward(request, response);
			return;
		}
//		<!-- 以各區分別     currentprice_city -->
//		<!-- 以類別區分     currentprice_bdtype  -->
//		<!-- 賣的樓層       currentprice_transes   -->
//		<!-- 總坪數         currentprice_housearea -->
//		<!-- 總價元         currentprice_tprice -->		
//呼叫Model
		CurrentPriceBean bean = new CurrentPriceBean();
		bean.setCurrentprice_city(currentprice_city);
		bean.setCurrentprice_bdtype(currentprice_bdtype);
		bean.setCurrentprice_transes(currentprice_transes);
		bean.setCurrentprice_housearea(currentprice_housearea);
		bean.setCurrentprice_tprice(currentprice_tprice);
        bean.setCurrentprice_address(currentprice_address);
		
//第二個驗證!!!  如果click的按鈕-prodaction為SELECT的話 使用productService.select 方法..
//在Service中判斷其為選擇全部 或是 條件選擇
//若為空則導回 前頁面..但回傳剛剛輸入的值 回填~~!		
//根據Model執行結果顯示View
		
		if("Select".equals(prodaction)) {
			List<CurrentPriceBean> result = currentpriceService.select(bean);
			request.setAttribute("select", result);
			request.getRequestDispatcher(
					"/pages/display.jsp").forward(request, response);
		}else if("Pick".equals(prodaction)) {
			System.out.println("s");
			List<CurrentPriceBean> result = currentpriceService.pick(bean);
			System.out.println("ss");
			System.out.println("fff"+result);
			request.setAttribute("Pick", result);
			request.getRequestDispatcher(
					"/_06_currentprice/cpindex.jsp").forward(request, response);}
		   
		else  {
			error.put("action", "Unknown Action:"+prodaction);
			request.getRequestDispatcher(
					"/_06_currentprice/cpweb.jsp").forward(request, response);
		}
	}
	
	
	

	
	@Override
	protected void doPost(HttpServletRequest req,
			HttpServletResponse resp) throws ServletException, IOException {
		this.doGet(req, resp);
	}
}
