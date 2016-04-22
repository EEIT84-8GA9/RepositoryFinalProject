package _10_chart.controller;

import java.io.IOException;



import java.util.ArrayList;
import java.util.Collections;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import _06_currentprice.model.CurrentPriceBean;
import _06_currentprice.model.CurrentPriceDAO;
import _06_currentprice.model.dao.CurrentPriceDAOJdbc;




@WebFilter(
	
//		urlPatterns = {"/*"},
		initParams = {
//		      @WebInitParam(name = "sendValueForChart",value = "/_11_test/*"),
//		      @WebInitParam(name = "sendValueForChart",value = ""),
//
//		      @WebInitParam(name = "mustLoginCP",value = "/chart/*")
		      
//		@WebInitParam(name = "",value = ""),
//		@WebInitParam(name = "",value = "")
		
		})

public class chartFilter implements Filter {
	
	
    ArrayList<String> url = new ArrayList<String>();
	private String servletPath;
	private String contextPath;
	private String requestURI;

   
	public chartFilter() {
    }


    
        public void init(FilterConfig fConfig) throws ServletException {
        	Enumeration<String> e = fConfig.getInitParameterNames();
			while (e.hasMoreElements()) {
				String path = e.nextElement();
				url.add(fConfig.getInitParameter(path));
			}
			System.out.println(url);
		}
	
		private boolean mustLogin() {
			boolean login = false;
			for (String sURL : url) {
				if (sURL.endsWith("*")) {
					sURL = sURL.substring(0, sURL.length() - 2);
					if (servletPath.startsWith(sURL)) {
						login = true;
						break;
					}
				} else {
					if (servletPath.equals(sURL)) {
						login = true;
						break;
					}
				}
			}
			return login;
		}
    
    

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

		request.setCharacterEncoding("UTF-8");
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		servletPath = req.getServletPath();  
		contextPath = req.getContextPath();
		requestURI  = req.getRequestURI();
	if(mustLogin()){
					CurrentPriceDAO dao = new CurrentPriceDAOJdbc();
//					// 寫死資料(不從HTML來)
					//
//					
//				    先bean?
//				   CurrentPriceBean bean = new CurrentPriceBean();
//						   result.add(bean);
//				    result = new ArrayList<CurrentPriceBean>();
					//
//					CurrentPriceBean bean3 =  new CurrentPriceBean();
//					CurrentPriceBean bean4 =  new CurrentPriceBean();
//					CurrentPriceBean bean5 =  new CurrentPriceBean();
//					CurrentPriceBean bean61 =  new CurrentPriceBean();
//					CurrentPriceBean bean62 =  new CurrentPriceBean();
//					CurrentPriceBean bean63 =  new CurrentPriceBean();
//					CurrentPriceBean bean7 =  new CurrentPriceBean();            
				
				String temp1 = "大安區";	
				String temp2 = "套房";
				String temp3 = "三樓";
				String temp4 = "大安區安和路一段";
						
					//
//							System.out.println(temp1);
//							// 直接Select四個
					//
				List<CurrentPriceBean> result3 = new ArrayList<CurrentPriceBean>();
				List<CurrentPriceBean> result4 = new ArrayList<CurrentPriceBean>();
				List<CurrentPriceBean> result5 = new ArrayList<CurrentPriceBean>();
				List<CurrentPriceBean> result61 = new ArrayList<CurrentPriceBean>();
				List<CurrentPriceBean> result62 = new ArrayList<CurrentPriceBean>();
				List<CurrentPriceBean> result63 = new ArrayList<CurrentPriceBean>();
				List<CurrentPriceBean> result7 = new ArrayList<CurrentPriceBean>();
				
		result3 = dao.select_avgoneprice_by_city_type(temp1);
		result4 = dao.select_avgoneprice_by_city_type_tradedate(temp1,temp2);
		result5 = dao.select_all_by_city_type_transes(temp1,temp2,temp3);
		result61 = dao.select_count_by_city_type(temp1);
		result62 = dao.select_count_by_city_housearea(temp1);
		result63 = dao.select_count_by_city_transes(temp1);
		result7 = dao.select_all_by_address(temp4);
            
		 
					
//					List<newsBean> bean = dao.select();
//					
//					for(newsBean set : bean){
//						
//						 set.getNew_id();
//						 set.getNew_title();
//						 set.getNew_describe();
//						 set.getNew_date();
//						 set.getNew_photo1();
//						 set.getNew_photo2();
//						 set.getNew_photo3();
//						 
//						 
//					}
	
            Map<String,Object> map = new HashMap<String, Object>();
            
            map.put("data_result3", result3);
            map.put("data_result4", result4);
            map.put("data_result5", result5);
            map.put("data_result61", result61);
            map.put("data_result62",result62);
            map.put("data_result63", result63);
            map.put("data_result64", result7);

		
            // 將資料傳送回去

////		req.setAttribute("get_chart_data", map);
		System.out.println("map"+map);
////		request.getRequestDispatcher("column.jsp").forward(req, resp);
//		 HttpSession session = req.getSession();
//         session.setAttribute("get_chart_data", map);
//         System.out.println("this is Session");
//        
//
//         session.getAttribute("get_chart_data");
//         	    resp.sendRedirect("tabletry2.jsp");
//		;
		

	  
      req.setAttribute("get_chart_data", map);
      System.out.println("this is request");
     		request.getRequestDispatcher("/_11_test/tabletry2.jsp").forward(req,resp);
      	    
      	    ;
		
		
		
		
		
		
	}else{   //不需要登入
				chain.doFilter(request, response);
				return;
			}
		
	}

	
	
public void destroy() {
		
	}
}
