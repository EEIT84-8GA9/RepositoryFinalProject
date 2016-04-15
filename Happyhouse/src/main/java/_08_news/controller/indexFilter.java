package _08_news.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.DispatcherType;
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

import _08_news.model.newsBean;
import _08_news.model.dao.newDAO;



@WebFilter(
		urlPatterns = { "/*" }, 
		initParams = { 
				@WebInitParam(name = "mustLogin1", value = "/index/*"), 
				@WebInitParam(name = "mustLogin2", value = "/_04_ShoppingCart/*"), 
				@WebInitParam(name = "mustLogin3", value = "/_05_orderProcess/*"),
				@WebInitParam(name = "mustLogin4", value = "/_20_productMaintain/*")				
		})
public class indexFilter implements Filter {

	Collection<String> url = new ArrayList<String>();
	String servletPath;
	String contextPath;
	String requestURI;
	

	

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

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8");
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		servletPath = req.getServletPath();  
		contextPath = req.getContextPath();
		requestURI  = req.getRequestURI();
	if(mustLogin()){
					newDAO dao = new newDAO();
//					// 寫死資料(不從HTML來)
					//
//					
					//
							int temp1 = 400;
							int temp2 = 401;
							int temp3 = 402;
							int temp4 = 403;
							int temp5 = 404;
							int temp6 = 405;
					//
//							System.out.println(temp1);
//							// 直接Select四個
					//
							newsBean bean1 = new newsBean();
							newsBean bean2 = new newsBean();
							newsBean bean3 = new newsBean();
							newsBean bean4 = new newsBean();
							newsBean bean5 = new newsBean();
							newsBean bean6 = new newsBean();
					//
							bean1 = dao.select(temp1);
							bean2 = dao.select(temp2);
							bean3 = dao.select(temp3);
						    bean4 = dao.select(temp4);
		                    bean5 = dao.select(temp5);
                            bean6 = dao.select(temp6);
		                    
					
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
            map.put("one", bean1);
            map.put("two", bean2);
            map.put("three", bean3);
            map.put("four", bean4);
            map.put("five",bean5);
            map.put("six", bean6);

		
            // 將資料傳送回去

		req.setAttribute("select", map);
		System.out.println(map);
		request.getRequestDispatcher("index.jsp").forward(req, resp);
//	    resp.sendRedirect("index.jsp");
	}else{   //不需要登入
				chain.doFilter(request, response);
				return;
			}
		
	}
	

	public void destroy() {

	}

}
