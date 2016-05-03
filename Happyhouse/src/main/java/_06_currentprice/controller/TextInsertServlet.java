package _06_currentprice.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.util.Collection;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import _06_currentprice.model.dao.CurrentPriceUpdateJdbc;


@MultipartConfig(location = "", fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 500, maxRequestSize = 1024 * 1024 * 500 * 5)
@WebServlet(
		urlPatterns={"/house/text.controller"}
)
public class TextInsertServlet extends HttpServlet {
		 CurrentPriceUpdateJdbc dao=new CurrentPriceUpdateJdbc();
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		CurrentPriceUpdateJdbc dao=new CurrentPriceUpdateJdbc();
		InputStream is1 = null;
		ServletContext application;
		Collection<Part> parts = request.getParts() ;
		for(Part p : parts){
				String s=dao.getFileName(p);
				if(s !=null){
				is1=p.getInputStream();
				}		
		}
		Reader r=new InputStreamReader(is1);
		 BufferedReader bf=new BufferedReader(r);
		 dao.insert(bf);		
		 
		 System.out.println("導!!!!!!!!!!");
//		 request.getRequestDispatcher("/Happyhouse/index.jsp");
//		 response.sendRedirect("/Happyhouse/index.jsp");
		
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		this.doGet(request, response);
	}

	
	
}
