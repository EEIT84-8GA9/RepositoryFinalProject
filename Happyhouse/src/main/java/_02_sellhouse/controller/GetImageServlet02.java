package _02_sellhouse.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

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
		urlPatterns={"/image2"},
		initParams={
				@WebInitParam(name="defaultFile", value="/img/samplehouse.jpg")
		}
		)
public class GetImageServlet02 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private File defaultPhoto;
  
	public void init() throws ServletException {
		String defaultFile = this.getInitParameter("defaultFile");
		ServletContext application = this.getServletContext();
		String path = application.getRealPath(defaultFile);
		defaultPhoto = new File(path);
	}
//    public GetImageServlet() {
//        super(); 
//    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("sellhouse_id");
		Connection conn=null;
		OutputStream os2=null;
		InputStream is2=null;
		
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		DataSource dataSource;
		//SELECT sellhouse_photo1_name,sellhouse_photo1 from sellhouse where sellhouse_id='109'
		String SELECT_IMAGE="SELECT sellhouse_photo2 from sellhouse where sellhouse_id=?";
//		String SELECT_IMAGE="SELECT sellhouse_photo1_name,sellhouse_photo1,,sellhouse_photo2_name,sellhouse_photo2,sellhouse_photo3_name,sellhouse_photo3"
//		+ " from sellhouse where sellhouse_id=?";
		// 接收資料
		
		int sellhouse_id=0;
		if(id !=null&&id.trim().length()!=0){
				sellhouse_id = Integer.parseInt(id);
			System.out.println("55555"+sellhouse_id);
		}
		try {
			Context ctx = new InitialContext();
			dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/HappyHouse");
			conn=dataSource.getConnection();
			is2=new FileInputStream(defaultPhoto);
			pstmt=conn.prepareStatement(SELECT_IMAGE);
			pstmt.setInt(1,sellhouse_id);
			rset=pstmt.executeQuery();
			System.out.println(rset);
			if (rset.next()){
				is2=rset.getBinaryStream("sellhouse_photo2");
				if(is2==null){
				is2=new FileInputStream(defaultPhoto);
				}
				System.out.println("kkkkk");
				response.setContentType("image/png");
				os2 = response.getOutputStream();
				byte[] buffer = new byte[4096];
				int count1=0;
				while((count1 =is2.read(buffer))!=-1) {
					System.out.println("22");
					os2.write(buffer,0,count1);
					System.out.println("23");
				}
	
				
			}
			
		
			
			
			
		} 
		catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	finally{
			
			if (os2 !=null) {
				try {
					os2.close();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (is2 !=null) {
				try {
					is2.close();
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
	
		this.doGet(request, response);
	}

}
