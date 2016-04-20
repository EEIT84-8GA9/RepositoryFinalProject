package _03_renthouse.controller;

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
import javax.servlet.http.HttpSession;

import _01_users.model.UsersBean;
import _02_sellhouse.model.SellHouseBean;
import _02_sellhouse.model.SellHouseDAO;
import _02_sellhouse.model.SellHouseService;
import _02_sellhouse.model.dao.SellHouseDAOJdbc;
import _03_renthouse.model.RentHouseBean;
import _03_renthouse.model.RentHouseDAO;
import _03_renthouse.model.dao.RentHouseDAOJdbc;
@WebFilter(
		urlPatterns = { "/_03_renthouse/RentHouseGM.jsp" }, 
		initParams = { 
	@WebInitParam(name ="sellhouse", value ="/_03_renthouse/RentHouseGM.jsp"), 			
		}
		)
public class SellHouseGMFilter implements Filter {
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
		HttpSession session=req.getSession();
		UsersBean userbean= (UsersBean) session.getAttribute("LoginOK");
		String user=userbean.getUser_account();
		servletPath = req.getServletPath();  
		contextPath = req.getContextPath();
		requestURI  = req.getRequestURI();
		RentHouseDAO dao=new RentHouseDAOJdbc();
		List<RentHouseBean> result =dao.SELECT_ALL();
		System.out.println("ddddd"+result);
		req.setAttribute("RentGMselect", result);
		request.getRequestDispatcher("/_03_renthouse/RentHouseGM.jsp").forward(req, resp);
		
	}


	
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

}
