package _02_sellhouse.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
@WebServlet(
		urlPatterns={"/index.controller"}
)
public class IndexServlet extends HttpServlet {

	@Override
	public void init() throws ServletException {
		
		super.init();
	}

}
