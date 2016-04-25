package _09_furniture.controller;

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
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

@WebServlet(
		urlPatterns={"/pages/photo.view"},
		initParams={
				@WebInitParam(name="defaultFile", value="/img/gs.png")
		}
)
public class PhotoServlet extends HttpServlet {
	private File defaultPhoto;
	@Override
	public void init() throws ServletException {
		String defaultFile = this.getInitParameter("defaultFile");
		ServletContext application = this.getServletContext();
		String path = application.getRealPath(defaultFile);
		defaultPhoto = new File(path);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		this.doGet(req, resp);
	}
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String photoid = request.getParameter("photoid");
		String name=null;
		InputStream photoInputStream = null;
		OutputStream os1=null;
		InputStream is1=null;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rset = null;
		int Furniture_id=0;
		if(photoid !=null&&photoid.trim().length()!=0){
			Furniture_id = Integer.parseInt(photoid);
		}
		
		
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/HappyHouse");
			conn = ds.getConnection();
			stmt = conn.prepareStatement(
				"select Furnitur_photo1_name,Furnitur_photo1 from Furniture where Furniture_id = ?");
			stmt.setInt(1,Furniture_id);
			rset = stmt.executeQuery();
			
			if(rset.next()) {
				name=rset.getString("Furnitur_photo1_name");
				is1=rset.getBinaryStream("Furnitur_photo1");
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
				photoInputStream = rset.getBinaryStream("Furnitur_photo1");
				
			} else {
				photoInputStream = new FileInputStream(defaultPhoto);
			}
			
		/*	response.setContentType("image/png");
			OutputStream out = response.getOutputStream();
			byte[] buffer = new byte[4*1024];
			int len = photoInputStream.read(buffer);
			while(len!=-1) {
				out.write(buffer, 0, len);
				len = photoInputStream.read(buffer);
			}*/
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
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
			if (rset!=null) {
				try {
					rset.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (stmt!=null) {
				try {
					stmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (conn!=null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}
}
