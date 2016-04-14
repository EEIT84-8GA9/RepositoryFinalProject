package _01_users.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import _01_users.model.UsersBean;


@WebFilter("/_01_users/*, /_09_furniture/*,/_04_message/mainpage.jsp,/sms.controller")
public class LoginFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest resq, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {

		HttpServletRequest request = (HttpServletRequest) resq;
		HttpServletResponse response = (HttpServletResponse) resp;
		HttpSession Session = request.getSession();
		UsersBean bean = (UsersBean) Session.getAttribute("LoginOK");
		if (bean != null) {
			chain.doFilter(request, response);
		} else {
			String uri=request.getRequestURI();
			Session.setAttribute("dest", uri);
			
			String path = request.getContextPath();
			response.sendRedirect(path + "/_01_users/login.jsp");
		}

	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
