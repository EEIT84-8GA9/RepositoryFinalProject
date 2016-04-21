package _08_news.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

@WebServlet(
		urlPatterns={"/newimage3"},
		initParams={
				@WebInitParam(name="defaultFile", value="/img/samplehouse.jpg")
		}
		)

public class GetNewImgServlet03 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private File defaultPhoto;
	public void init() throws ServletException {
		String defaultFile = this.getInitParameter("defaultFile");
		ServletContext application = this.getServletContext();
		String path = application.getRealPath(defaultFile);
		defaultPhoto = new File(path);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String id = request.getParameter("new_id");
		Connection conn=null;
		OutputStream os1=null;
		OutputStream os2=null;
		InputStream is1=null;
		InputStream is2=null;
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		DataSource dataSource;
	
		
		String SELECT_IMAGE="  SELECT new_photo3_name, new_photo3 from news where new_id= ?";
		
		String name=null;
		int new_id=0;
		if(id !=null&&id.trim().length()!=0){
				new_id = Integer.parseInt(id);
		}
		
		try {
			Context ctx = new InitialContext();
			dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/HappyHouse");
			conn=dataSource.getConnection();
			is1=new FileInputStream(defaultPhoto);
			pstmt=conn.prepareStatement(SELECT_IMAGE);
			pstmt.setInt(1,new_id);
			rset=pstmt.executeQuery();
			
			if (rset.next()){
				name=rset.getString("new_photo3_name");
				is1=rset.getBinaryStream("new_photo3");

				if(name==null||name.equals("")){
				is1=new FileInputStream(defaultPhoto);
				}
				response.setContentType("image/png");
				os1 = response.getOutputStream();
				byte[] buffer = new byte[4096];
				int count1=0;
				while((count1 =is1.read(buffer))!=-1) {
					os1.write(buffer,0,count1);
				}				
			}
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{

			if (os1 !=null) {
				try {
					os1.close();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (is1 !=null) {
				try {
					is1.close();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (rset !=null) {
				try {
					rset.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			if (pstmt !=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (conn !=null) {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}		
		
		}		
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
