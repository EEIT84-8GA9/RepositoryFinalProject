package _07_carts.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import _07_carts.model.cartsBean;
import _07_carts.model.dao.cartsDAO;

/**
 * Servlet implementation class cartsInsertServlet
 */
@WebServlet(urlPatterns = { "/rentcartsinsert.controller" })
public class rentcartsInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public rentcartsInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user_account = request.getParameter("user_account3");
		String temp = request.getParameter("renthouse_id3");
		int renthouse_id=	Integer.parseInt(temp);
		cartsDAO dao=new cartsDAO();
		cartsBean bean=new cartsBean();
		bean.setRenthouse_id(renthouse_id);
		bean.setUser_account(user_account);
		dao.insert2(bean);
		String url = request.getHeader("referer");
		response.sendRedirect(url);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}

}
