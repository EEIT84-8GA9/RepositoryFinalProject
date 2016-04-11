package _04_message.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Enumeration;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import _04_message.model.LoginVO;

/**
 * Servlet Filter implementation class LoginFilter
 */
@WebFilter(urlPatterns = { "/*" }, initParams = {
		@WebInitParam(name = "url_1", value = "/_04_message/mainpage.jsp"),
		@WebInitParam(name = "url_2", value = "/sms.controller"),
//		@WebInitParam(name = "url_3", value = "/ch05_09/*"),
//		@WebInitParam(name = "url_4", value = "/ch07_02/*") 
		})
public class LoginFilter implements Filter {
	Collection<String> url = new ArrayList<String>();

	public void destroy() {

	}
	//SECOND
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		if (request instanceof HttpServletRequest
				&& response instanceof HttpServletResponse) {
			HttpServletRequest req = (HttpServletRequest) request;
			HttpServletResponse resp = (HttpServletResponse) response;
			String servletPath = req.getServletPath();
			// CLICK 顯示會員資料(Lab07_02) http://localhost:8080/jspExercise/ch07_02/ShowMember.jsp
//			System.out.println("111--->" + servletPath);
			if (mustLogin(servletPath)) {
				if (checkLogin(req)) {
//					System.out.println("222-->需要Login, 已經Login");
					chain.doFilter(request, response);
				} else {
					HttpSession session = req.getSession();
					session.setAttribute("target", req.getServletPath());
//					System.out.println("333-->需要Login, 尚未Login , ServletPath="
//							+ req.getServletPath());
					RequestDispatcher rd = request
							.getRequestDispatcher("/_04_message/login.jsp");
					rd.forward(req, resp);
				}
			} else {
//				System.out.println("444-->不需要Login ");
				chain.doFilter(request, response);
			}
		} else {
			throw new ServletException("Request/Response Type Error");
		}
	}
//THIRD
	private boolean mustLogin(String servletPath) {
		boolean login = false;
		for (String sURL : url) {
			
				if (servletPath.startsWith(sURL)) {
					login = true;
					break;
				
			} else {
				if (servletPath.equals(sURL)) {
					login = true;
					break;
				}
			}
		}
		return login;
	}

	private boolean checkLogin(HttpServletRequest request) {
		HttpSession session = request.getSession();
		LoginVO loginToken = (LoginVO) session.getAttribute("LoginOK");
//		System.out.println("checkLogin");
		if (loginToken == null) {
//			System.out.println("return false;");
			return false;
		} else {
//			System.out.println("return true;");
			return true;
		}
	}
	//FIRST
	public void init(FilterConfig fConfig) throws ServletException {
		Enumeration<String> e = fConfig.getInitParameterNames();
		while (e.hasMoreElements()) {
			String name = e.nextElement();
			url.add(fConfig.getInitParameter(name));
		}
		// 讀入
		// ADD IN URL
		// /ch07_02/*
		// /ch05_08/*
		// /ch05_09/*
		// /ch05_05/*
//		for (String sURL : url) {
//			System.out.println(sURL);
//		}
	}
}
