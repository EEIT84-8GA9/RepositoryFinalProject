package _06_currentprice.model.dao;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Collection;
import java.util.StringTokenizer;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;
import javax.sql.DataSource;

import _02_sellhouse.model.SellHouseBean;
import _02_sellhouse.model.SellHouseService;



public class CurrentPriceUpdateJdbc {
	private static final String url="jdbc:sqlserver://localhost:1433;database=HappyHouse";
	private static final String	username="sa";
	private	static final String password="sa123456";
	public static final int IMAGE_FILENAME_LENGTH = 20;
	private static final String inserttext="insert into currenttable values(?,?,?)";
	private static final String SqlStr="insert into currentprice(currentprice_city,currentprice_address, currentprice_tradedate, currentprice_trades,currentprice_transes,"
	  		+"currentprice_floors,currentprice_bdtype,currentprice_mainway, currentprice_maintype,currentprice_enddate,"
			+"currentprice_housearea,currentprice_rooms,currentprice_livinroom,currentprice_toilet, currentprice_tprice,"
	  		+"currentprice_oneprice,currentprice_caraream) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
//	private static final String select="select "
	private DataSource dataSource;
	public CurrentPriceUpdateJdbc() {
		try {
			Context ctx = new InitialContext();
			dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/HappyHouse");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	public CurrentPriceUpdateJdbc(String DBString) {
		try {
			Context ctx = new InitialContext();
			dataSource = (DataSource) ctx.lookup(DBString);
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	public boolean insert(BufferedReader bf) throws FileNotFoundException{
//			fr=new FileReader("e:/cpfinal.txt");
//			BufferedReader bf=new BufferedReader(fr);
		 	StringTokenizer stk=null;
		  	String FieldStr="";
		  	String ValueStr="";
		  	String line=null;
		  	Connection conn = null;
			PreparedStatement pstmt = null;
			
			
			try {
//				conn=DriverManager.getConnection(url,username,password);
					conn =dataSource.getConnection();
					pstmt=conn.prepareStatement(SqlStr);
				 while((line=bf.readLine())!=null){
					 String[] items= line.split(",");
					 pstmt.setString(1,items[0]);
						pstmt.setString(2,items[2]);
						//此區取日期,為了使資料只有年月~ 所以截掉日期的部份
						if (items[7].length()==7){
							pstmt.setString(3,(String)items[7].subSequence(0,5)); 
						}else if(items[7].length()==6){
							pstmt.setString(3,(String)items[7].subSequence(0,3)); 
						}else{
						pstmt.setString(3,items[7]);
						}								
						pstmt.setString(4,items[8]);
						pstmt.setString(5,items[9]);
						pstmt.setString(6,items[10]);
						pstmt.setString(7,items[11]);
						pstmt.setString(8,items[12]);
						pstmt.setString(9,items[13]);
						pstmt.setString(10,items[14]);
						pstmt.setString(11,items[15]);
						pstmt.setString(12,items[16]);
						pstmt.setString(13,items[17]);
						pstmt.setString(14,items[18]);
						pstmt.setString(15,items[21]);
						pstmt.setString(16,items[22]);
						pstmt.setString(17,items[25]);	
						pstmt.addBatch();		 		 
				 }
				 pstmt.executeBatch();
			} catch (SQLException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if (bf !=null) {
				try {
					bf.close();
				} catch (IOException e) {
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
		return false;
		
	}
	
	public boolean inserttext(String city,String text_name,InputStream is1,long size1){
		Connection conn = null;
		PreparedStatement pstmt = null;
		int i=0;
		try {
			conn=dataSource.getConnection();
			pstmt = conn.prepareStatement(inserttext);
			if(city !=null){
				pstmt.setString(1,city);
				pstmt.setString(2,text_name);
				pstmt.setBinaryStream(3,is1,size1);
				 i=	pstmt.executeUpdate();		
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
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
	
		if(i==1){
			return true;
		}else{
			
			return false;
		}						
		
	}
	
	
//	public static void main(String[] args) throws FileNotFoundException{
//		CurrentPriceUpdateJdbc dao=new CurrentPriceUpdateJdbc();
//		FileReader fr=new FileReader("e:/cpfinal.txt");
//		dao.insert(fr);
//	}
	
	
	//+上去
	public static String adjustFileName(String fileName, int maxLength) {
		  int length = fileName.length();
		  if ( length <= maxLength ) {
			  return fileName ;
		  }
		int n      = fileName.lastIndexOf(".");
      int sub    = fileName.length() - n - 1;
      fileName = fileName.substring(0, maxLength-1-sub) + "." 
                   + fileName.substring(n+1); 
		return fileName;
	}
	
	public static String getFileName(final Part part) {
		for (String content : part.getHeader("content-disposition").split(";")) {
			if (content.trim().startsWith("filename")) {
				return content.substring(content.indexOf('=') + 1).trim()
						.replace("\"", "");
			}
		}
		return null;
	}
	
	public static void exploreParts(Collection<Part> parts, HttpServletRequest req){
		try {
			for (Part part: parts){
				String name = part.getName();
				String contentType = part.getContentType();
				String value = "";
				long size = part.getSize(); // 上傳資料的大小，即上傳資料的位元組數
				InputStream is =part.getInputStream();
				if (contentType != null) { // 表示該part為檔案
				   // 取出上傳檔案的檔名
				   String filename = SellHouseService.getFileName(part);
				   // 將上傳的檔案寫入到location屬性所指定的資料夾
				   if (filename != null && filename.trim().length() > 0) {
					   part.write(filename);	
					   System.out.println(part.getClass().getName());
				   }
				} else {  // 表示該part為一般的欄位
				   // 將上傳的欄位資料寫入到location屬性所指定的資料夾，檔名為"part_"+ name
				   part.write("part_"+ name);	
				   value = req.getParameter(name);    
				}
				System.out.printf("%-15s %-15s %8d  %-20s \n", name, contentType, size, value);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

}

}
