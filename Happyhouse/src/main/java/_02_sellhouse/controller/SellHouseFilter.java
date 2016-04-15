package _02_sellhouse.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Enumeration;
import java.util.List;

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

import _02_sellhouse.model.SellHouseBean;
import _02_sellhouse.model.SellHouseDAO;
import _02_sellhouse.model.SellHouseService;
import _02_sellhouse.model.dao.SellHouseDAOJdbc;
@WebFilter(
		urlPatterns = { "/_02_sellhouse/SellHouseSearch.jsp" }, 
		initParams = { 
	@WebInitParam(name ="sellhouse", value ="/_02_sellhouse/SellHouseSearch.jsp"), 			
		}
		)
public class SellHouseFilter implements Filter {
	Collection<String> url = new ArrayList<String>();
	String servletPath;
	String contextPath;
	String requestURI;
	
	@Override
	public void init(FilterConfig fConfig) throws ServletException {
		Enumeration<String> e = fConfig.getInitParameterNames();
		while (e.hasMoreElements()) {
			String path = e.nextElement();
			url.add(fConfig.getInitParameter(path));
		}
		System.out.println("AAAA"+url);			
	}
	private boolean mustLogin(){
		boolean login=false;
		for(String sURL:url){
			if(sURL.endsWith("*")){
				sURL = sURL.substring(0, sURL.length() - 2);
				if (servletPath.startsWith(sURL)) {
					login = true;
					break;
				}
			}else {
				if (servletPath.equals(sURL)) {
					login = true;
					break;
				}
			}
		}
		return login;
	}	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8");

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		servletPath = req.getServletPath();  
		contextPath = req.getContextPath();
		requestURI  = req.getRequestURI();
		
			
			SellHouseDAO dao=new SellHouseDAOJdbc();
			//SellHouseBean bean=new SellHouseBean();
			 List<SellHouseBean> result =dao.SELECT_ALL();
			System.out.println("ddddd"+result);
			req.setAttribute("select", result);
			request.getRequestDispatcher("/_02_sellhouse/SellHouseSearch.jsp").forward(req, resp);
		
	}


	
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

}
