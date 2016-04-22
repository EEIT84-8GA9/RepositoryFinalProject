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
import _10_chart.model.ChartService;







@WebServlet(
		urlPatterns={"/_06_currentprice.controller/cpweb.controller"}
		)

public class CurrentPriceServlet extends HttpServlet {

	private SimpleDateFormat sFormat = new SimpleDateFormat("yyyy-MM-dd");
	private CurrentPriceService currentpriceService = new CurrentPriceService();
	private ChartService chartService = new ChartService();
	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	
	
//接收HTML Form資料
		String currentprice_city = request.getParameter("currentprice_city");
		String currentprice_bdtype = request.getParameter("currentprice_bdtype");
		String currentprice_transes = request.getParameter("currentprice_transes");
		
		System.out.println("i am currentpriceServlet");
		if (request.getParameter("price_city") != null){
		 currentprice_city = request.getParameter("price_city");
		}else 
		 currentprice_city = request.getParameter("currentprice_city");
			
		System.out.println("剛GET的currentprice_city"+currentprice_city);
		
		if (request.getParameter("price_bdtype") != null){
			 currentprice_bdtype = request.getParameter("price_bdtype");
			}else 
			 currentprice_bdtype = request.getParameter("currentprice_bdtype");
		System.out.println("剛GET的currentprice_bdtype"+currentprice_bdtype);
		
		if (request.getParameter("price_transes") != null){
			currentprice_transes = request.getParameter("price_transes");
			}else 
			 currentprice_transes = request.getParameter("currentprice_transes");
				
			System.out.println("剛GET的currentprice_transes"+currentprice_transes);
		
		
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
		if("Insert".equals(prodaction) || "Update".equals(prodaction) || "Delete".equals(prodaction) ) {
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
		
        
        
        System.out.println("此為塞BEAN"+bean);
		System.out.println("currentprice_city="+currentprice_city);
		System.out.println("currentprice_bdtype="+currentprice_bdtype);
		System.out.println("currentprice_address="+currentprice_address);
		System.out.println("prodaction="+prodaction);
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
					"/_06_currentprice/cpindex.jsp").forward(request, response);
	    }else if (prodaction == null && currentprice_city != null && currentprice_bdtype ==null && currentprice_transes == null) {
			System.out.println("餅一圖!!! 以CITY 導向!類型 樓層 空值");
	    	List<CurrentPriceBean> result1 = chartService.select_pei_by_three_type(bean);
//			List<CurrentPriceBean> result2 = chartService.select_avg_month(bean);
			if (result1 == null) {
				error.put("action", "xxxx fail");
			} else if(result1 != null ){
				request.setAttribute("Choose1",result1);
//				request.setAttribute("Choose2",result2);
			}
			System.out.println("FIRST"+result1);
//			System.out.println("R"+result2);
			
			System.out.println("SOS  result1  ~prodaction null's answer");
//			ServletContext servletContext = getServletContext();
		 
		 
		  //PrintWriter out = res.getWriter();  
		  //out.print("{\"Choose1\":"+new Gson().toJson(result1)+",\"Choose2\":"+new Gson().toJson(result2)+"}");  
//		  String getcurrentprice_tradedate="";
//		  String getavgoneprice_by_tradedate="";
		  String getboth="";
		  int r1 = 0;
		  for(CurrentPriceBean element : result1) {
			  
			  if(r1>0){
				  getboth = getboth +",";
			  
		    }
		  
		  getboth = getboth + "[\""+element.getCurrentprice_bdtype() +"\","+ element.getCount_by_city_type()+"]"; 
		  r1++;
	    }
		  System.out.println("getboth"+getboth);
		  //out.print();
		  //out.print(result1);  
		  response.setContentType("application/json");
		  response.setCharacterEncoding("UTF-8");
		  response.getWriter().write("[[\"type\", \"percentage\"],"+getboth+"]");
		  System.out.println("[[\"type\", \"percentage\"],"+getboth+"]");
		  
		}else if (prodaction == null && currentprice_city != null && currentprice_bdtype !=null && currentprice_transes == null) {
			System.out.println("餅二圖!!! 以CITY 類型 導向! 樓層 空值");
//			List<CurrentPriceBean> result1 = chartService.select_pei_by_three_type(bean);
			List<CurrentPriceBean> result1 = chartService.select_pei_by_three_area(bean);
//			List<CurrentPriceBean> result2 = chartService.select_avg_month(bean);
			
			if (result1 == null) {
				error.put("action", "xxxx fail");
			} else if(result1 != null ){
				request.setAttribute("Choose1",result1);
//				request.setAttribute("Choose2",result2);
			}
			System.out.println("SECOND"+result1);
//			System.out.println("R"+result2);
			
			System.out.println("SOS  result1  ~prodaction null's answer");
//			ServletContext servletContext = getServletContext();
		 
		 
		  //PrintWriter out = res.getWriter();  
		  //out.print("{\"Choose1\":"+new Gson().toJson(result1)+",\"Choose2\":"+new Gson().toJson(result2)+"}");  
//		  String getcurrentprice_tradedate="";
//		  String getavgoneprice_by_tradedate="";
		  String getboth="";
		  int r1 = 0;
		  for(CurrentPriceBean element : result1) {
			  
			  if(r1>0){
				  getboth = getboth +",";
			  
		    }
		  
		  getboth = getboth + "[\""+element.getHousearea_range() +"\","+ element.getHousearea_count()+"]"; 
		  r1++;
	    }
		  System.out.println("getboth"+getboth);
		  //out.print();
		  //out.print(result1);  
		  response.setContentType("application/json");
		  response.setCharacterEncoding("UTF-8");
		  response.getWriter().write("[[\"Area\", \"percentage\"],"+getboth+"]");
		  System.out.println("[[\"Area\", \"percentage\"],"+getboth+"]");
		  
		}else if (prodaction == null && currentprice_city != null && currentprice_bdtype !=null && currentprice_transes != null) {
			System.out.println("餅三圖!!! 以CITY 類型 樓層  導向! ");
//			List<CurrentPriceBean> result1 = chartService.select_pei_by_three_type(bean);
			List<CurrentPriceBean> result1 = chartService.select_pei_by_three_transes(bean);
//			List<CurrentPriceBean> result2 = chartService.select_avg_month(bean);
			if (result1 == null) {
				error.put("action", "xxxx fail");
			} else if(result1 != null ){
				request.setAttribute("Choose1",result1);
//				request.setAttribute("Choose2",result2);
			}
			System.out.println("THIRD"+result1);
//			System.out.println("R"+result2);
			
			System.out.println("SOS  result1  ~prodaction null's answer");
//			ServletContext servletContext = getServletContext();
		 
		 
		  //PrintWriter out = res.getWriter();  
		  //out.print("{\"Choose1\":"+new Gson().toJson(result1)+",\"Choose2\":"+new Gson().toJson(result2)+"}");  
//		  String getcurrentprice_tradedate="";
//		  String getavgoneprice_by_tradedate="";
		  String getboth="";
		  int r1 = 0;
		  for(CurrentPriceBean element : result1) {
			  
			  if(r1>0){
				  getboth = getboth +",";
			  
		    }
		  
		  getboth = getboth + "[\""+element.getCurrentprice_transes() +"\","+ element.getTranses_count()+"]"; 
		  r1++;
	    }
		  System.out.println("getboth"+getboth);
		  //out.print();
		  //out.print(result1);  
		  response.setContentType("application/json");
		  response.setCharacterEncoding("UTF-8");
		  response.getWriter().write("[[\"FLOORS\", \"percentage\"],"+getboth+"]");
		  System.out.println("[[\"FLOORS\", \"percentage\"],"+getboth+"]");
		  
		}else  {
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
