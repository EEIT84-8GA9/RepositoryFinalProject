package _02_sellhouse.model.dao;


import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.naming.spi.DirStateFactory.Result;
import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

import _02_sellhouse.model.SellHouseBean;
import _02_sellhouse.model.SellHouseDAO;




public class SellHouseDAOJdbc implements SellHouseDAO {

//	private static final String url="jdbc:sqlserver://localhost:1433;database=HappyHouse";
//	private static final String	username="sa";
//	private	static final String password="sa123456";
	private static final String UPDATE_REPORT="UPDATE sellhouse SET sellhouse_reportfrom=?,sellhouse_reportreason=?,sellhouse_type='B' WHERE sellhouse_id=?";
	private static final String SELECT_ALL="select*from sellhouse";
	private static final String SELECT_BY_USER_ACCOUNT="Select * FROM sellhouse Where user_account LIKE ?";
	private static final String SELECT_BY_SELLHOUSE_NAME="Select * FROM sellhouse Where sellhouse_name LIKE ?";
	private static final String SELECT_BY_SELLHOUSE_PRICE="Select * FROM sellhouse Where sellhouse_price LIKE ?";
	private static final String SELECT_BY_SELLHOUSE_ADDRESS="Select * FROM sellhouse Where sellhouse_address LIKE ?";
	private static final String INSERT = "insert into sellhouse values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,getdate(),?,?,?,NULL,NULL)";
	private static final String SELECT_BY_SELLHOUSE_ID="Select * FROM sellhouse Where sellhouse_id=?";
	private static final String UPDATE
	="update sellhouse set sellhouse_name=?, sellhouse_price=?, sellhouse_patterns=?,sellhouse_address=?,sellhouse_describe=?,sellhouse_size=?,sellhouse_floor=?,sellhouse_age=?,sellhouse_photo1_name=?,sellhouse_photo1=?,sellhouse_photo2_name=?,sellhouse_photo2=?,sellhouse_photo3_name=?,sellhouse_photo3=?,sellhouse_type=?,sellhouse_message=?,sellhouse_date=getdate(),sellhouse_car=?,sellhouse_phone=?,sellhouse_email=? where sellhouse_id=?";
	private static final String DELETE = "delete from sellhouse where sellhouse_id=?";

	private DataSource dataSource;

	public SellHouseDAOJdbc() {
		try {
			Context ctx = new InitialContext();
			dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/HappyHouse");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	public SellHouseDAOJdbc(String DBString) {
		try {
			Context ctx = new InitialContext();
			dataSource = (DataSource) ctx.lookup(DBString);
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	
	/* (non-Javadoc)
	 * @see _02_sellhouse.model.dao.SellHouseDAO#SELECT_ALL()
	 */
	@Override
	public	List<SellHouseBean> SELECT_ALL(){
	List<SellHouseBean> result=null;
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rset = null;
		 try {
			//conn=DriverManager.getConnection(url,username,password);
				conn=dataSource.getConnection();
			 pstmt=conn.prepareStatement(SELECT_ALL);
			 rset=pstmt.executeQuery();
			result=new ArrayList<SellHouseBean>();
			while(rset.next()){	
				SellHouseBean bean=new SellHouseBean();
				bean.setSellhouse_id(rset.getInt("sellhouse_id"));
				bean.setUser_account(rset.getString("user_account"));
				bean.setSellhouse_name(rset.getString("sellhouse_name"));
				bean.setSellhouse_price(rset.getFloat("sellhouse_price"));
				bean.setSellhouse_patterns(rset.getString("sellhouse_patterns"));
				bean.setSellhouse_address(rset.getString("sellhouse_address"));
				bean.setSellhouse_describe(rset.getString("sellhouse_describe"));
				bean.setSellhouse_size(rset.getFloat("sellhouse_size"));
				bean.setSellhouse_floor(rset.getString("sellhouse_floor"));
				bean.setSellhouse_age(rset.getFloat("sellhouse_age"));
				bean.setSellhouse_photo1(rset.getBlob("sellhouse_photo1"));
				bean.setSellhouse_photo2(rset.getBlob("sellhouse_photo2"));
				bean.setSellhouse_photo3(rset.getBlob("sellhouse_photo3"));
				bean.setSellhouse_type(rset.getString("sellhouse_type"));
				bean.setSellhouse_message(rset.getString("sellhouse_message"));
				bean.setSellhouse_date(rset.getDate("sellhouse_date"));
				bean.setSellhouse_car(rset.getString("sellhouse_car"));
				bean.setSellhouse_phone(rset.getString("sellhouse_phone"));
				bean.setSellhouse_email(rset.getString("sellhouse_email"));
				result.add(bean);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
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
	return result;	
}






	/* (non-Javadoc)
	 * @see _02_sellhouse.model.dao.SellHouseDAO#select_sellhouse_name(java.lang.String)
	 */
	@Override
	public List<SellHouseBean> select_sellhouse_name(String sellhouse_name){
		SellHouseBean bean=null;
		List<SellHouseBean> result=null;
		Connection conn =null;
		ResultSet rset=null;
		InputStream photoInputStream = null;
		PreparedStatement pstmt=null;
		//String se="%"+sellhouse_name+"%";
		try {
			//conn=DriverManager.getConnection(url,username,password);
			conn=dataSource.getConnection();
			 pstmt=conn.prepareStatement(SELECT_BY_SELLHOUSE_NAME);
			 pstmt.setString(1,"%"+sellhouse_name+"%");
			 rset=pstmt.executeQuery();
			 result=new ArrayList<SellHouseBean>();
			while(rset.next()){
				bean=new SellHouseBean();
				bean.setSellhouse_id(rset.getInt("sellhouse_id"));
				bean.setUser_account(rset.getString("user_account"));
				bean.setSellhouse_name(rset.getString("sellhouse_name"));
				bean.setSellhouse_price(rset.getFloat("sellhouse_price"));
				bean.setSellhouse_patterns(rset.getString("sellhouse_patterns"));
				bean.setSellhouse_address(rset.getString("sellhouse_address"));
				bean.setSellhouse_describe(rset.getString("sellhouse_describe"));
				bean.setSellhouse_size(rset.getFloat("sellhouse_size"));
				bean.setSellhouse_floor(rset.getString("sellhouse_floor"));
				bean.setSellhouse_age(rset.getFloat("sellhouse_age"));
				//讀取圖片
				
				photoInputStream=rset.getBinaryStream("sellhouse_photo1");
				
				bean.setSellhouse_photo1(rset.getBlob("sellhouse_photo1"));
				bean.setSellhouse_photo2(rset.getBlob("sellhouse_photo2"));
				bean.setSellhouse_photo3(rset.getBlob("sellhouse_photo3"));
				bean.setSellhouse_type(rset.getString("sellhouse_type"));
				bean.setSellhouse_message(rset.getString("sellhouse_message"));
				bean.setSellhouse_date(rset.getDate("sellhouse_date"));
				bean.setSellhouse_car(rset.getString("sellhouse_car"));
				bean.setSellhouse_phone(rset.getString("sellhouse_phone"));
				bean.setSellhouse_email(rset.getString("sellhouse_email"));
				result.add(bean);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			
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
		return result;
	}




/* (non-Javadoc)
 * @see _02_sellhouse.model.dao.SellHouseDAO#select_sellhouse_price(float)
 */
@Override
public List<SellHouseBean> select_sellhouse_price(float sellhouse_price){
	SellHouseBean bean=null;
	List<SellHouseBean> result=null;
	Connection conn =null;
	ResultSet rset=null;
	PreparedStatement pstmt=null;
	Float d=sellhouse_price;
	
	String da= d.toString();
	   if(da.indexOf(".") > 0){  
           da =da.replaceAll("0+?$", "");//去掉多余的0  
           da= da.replaceAll("[.]$", "");//如最后一位是.则去掉  
       }  
	String se="%"+da+"%";
	try {
		//conn=DriverManager.getConnection(url,username,password);
		conn=dataSource.getConnection();
		 pstmt=conn.prepareStatement(SELECT_BY_SELLHOUSE_PRICE);
		
		 pstmt.setString(1,"%"+da+"%");
		 
		 rset=pstmt.executeQuery();
			result=new ArrayList<SellHouseBean>();
		while(rset.next()){
			bean=new SellHouseBean();
			bean.setSellhouse_id(rset.getInt("sellhouse_id"));
			bean.setUser_account(rset.getString("user_account"));
			bean.setSellhouse_name(rset.getString("sellhouse_name"));
			bean.setSellhouse_price(rset.getFloat("sellhouse_price"));
			bean.setSellhouse_patterns(rset.getString("sellhouse_patterns"));
			bean.setSellhouse_address(rset.getString("sellhouse_address"));
			bean.setSellhouse_describe(rset.getString("sellhouse_describe"));
			bean.setSellhouse_size(rset.getFloat("sellhouse_size"));
			bean.setSellhouse_floor(rset.getString("sellhouse_floor"));
			bean.setSellhouse_age(rset.getFloat("sellhouse_age"));
			bean.setSellhouse_photo1(rset.getBlob("sellhouse_photo1"));
			bean.setSellhouse_photo2(rset.getBlob("sellhouse_photo2"));
			bean.setSellhouse_photo3(rset.getBlob("sellhouse_photo3"));
			bean.setSellhouse_type(rset.getString("sellhouse_type"));
			bean.setSellhouse_message(rset.getString("sellhouse_message"));
			bean.setSellhouse_date(rset.getDate("sellhouse_date"));
			bean.setSellhouse_car(rset.getString("sellhouse_car"));
			bean.setSellhouse_phone(rset.getString("sellhouse_phone"));
			bean.setSellhouse_email(rset.getString("sellhouse_email"));
			result.add(bean);
			
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}finally{
		
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
	return result;
}



/* (non-Javadoc)
 * @see _02_sellhouse.model.dao.SellHouseDAO#select_sellhouse_address(java.lang.String)
 */
@Override
public List<SellHouseBean> select_sellhouse_address(String sellhouse_address){
	SellHouseBean bean=null;
	List<SellHouseBean> result=null;
	Connection conn =null;
	ResultSet rset=null;
	PreparedStatement pstmt=null;
	String se="%"+sellhouse_address+"%";
	try {
		//conn=DriverManager.getConnection(url,username,password);
		conn=dataSource.getConnection();
		 pstmt=conn.prepareStatement(SELECT_BY_SELLHOUSE_ADDRESS);	
		 pstmt.setString(1,se);
		
		 rset=pstmt.executeQuery();
		result=new ArrayList<SellHouseBean>();
		while(rset.next()){
			bean=new SellHouseBean();
			bean.setSellhouse_id(rset.getInt("sellhouse_id"));
			bean.setUser_account(rset.getString("user_account"));
			bean.setSellhouse_name(rset.getString("sellhouse_name"));
			bean.setSellhouse_price(rset.getFloat("sellhouse_price"));
			bean.setSellhouse_patterns(rset.getString("sellhouse_patterns"));
			bean.setSellhouse_address(rset.getString("sellhouse_address"));
			bean.setSellhouse_describe(rset.getString("sellhouse_describe"));
			bean.setSellhouse_size(rset.getFloat("sellhouse_size"));
			bean.setSellhouse_floor(rset.getString("sellhouse_floor"));
			bean.setSellhouse_age(rset.getFloat("sellhouse_age"));
			bean.setSellhouse_photo1(rset.getBlob("sellhouse_photo1"));
			bean.setSellhouse_photo2(rset.getBlob("sellhouse_photo2"));
			bean.setSellhouse_photo3(rset.getBlob("sellhouse_photo3"));
			bean.setSellhouse_type(rset.getString("sellhouse_type"));
			bean.setSellhouse_message(rset.getString("sellhouse_message"));
			bean.setSellhouse_date(rset.getDate("sellhouse_date"));
			bean.setSellhouse_car(rset.getString("sellhouse_car"));
			bean.setSellhouse_phone(rset.getString("sellhouse_phone"));
			bean.setSellhouse_email(rset.getString("sellhouse_email"));
			result.add(bean);
			
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}finally{
		
		if (rset !=null) {
			try {
				rset.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		if (pstmt !=null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		if (conn !=null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}
	return result;
}


/* (non-Javadoc)
 * @see _02_sellhouse.model.dao.SellHouseDAO#select_user_account(java.lang.String)
 */
@Override
public List<SellHouseBean> select_user_account(String user_account){
	SellHouseBean bean=null;
	List<SellHouseBean> result=null;
	Connection conn =null;
	ResultSet rset=null;
	PreparedStatement pstmt=null;
	String se="%"+user_account+"%";
	try {
		//conn=DriverManager.getConnection(url,username,password);
		conn=dataSource.getConnection();
		 pstmt=conn.prepareStatement(SELECT_BY_USER_ACCOUNT);	
		 pstmt.setString(1,se);
		
		 rset=pstmt.executeQuery();
		result=new ArrayList<SellHouseBean>();
		while(rset.next()){
			bean=new SellHouseBean();
			bean.setSellhouse_id(rset.getInt("sellhouse_id"));
			bean.setUser_account(rset.getString("user_account"));
			bean.setSellhouse_name(rset.getString("sellhouse_name"));
			bean.setSellhouse_price(rset.getFloat("sellhouse_price"));
			bean.setSellhouse_patterns(rset.getString("sellhouse_patterns"));
			bean.setSellhouse_address(rset.getString("sellhouse_address"));
			bean.setSellhouse_describe(rset.getString("sellhouse_describe"));
			bean.setSellhouse_size(rset.getFloat("sellhouse_size"));
			bean.setSellhouse_floor(rset.getString("sellhouse_floor"));
			bean.setSellhouse_age(rset.getFloat("sellhouse_age"));
			bean.setSellhouse_photo1(rset.getBlob("sellhouse_photo1"));
			bean.setSellhouse_photo2(rset.getBlob("sellhouse_photo2"));
			bean.setSellhouse_photo3(rset.getBlob("sellhouse_photo3"));
			bean.setSellhouse_type(rset.getString("sellhouse_type"));
			bean.setSellhouse_message(rset.getString("sellhouse_message"));
			bean.setSellhouse_date(rset.getDate("sellhouse_date"));
			bean.setSellhouse_car(rset.getString("sellhouse_car"));
			bean.setSellhouse_phone(rset.getString("sellhouse_phone"));
			bean.setSellhouse_email(rset.getString("sellhouse_email"));
			result.add(bean);
			
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}finally{
		
		if (rset !=null) {
			try {
				rset.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		if (pstmt !=null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		if (conn !=null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}
	return result;
}


/* (non-Javadoc)
 * @see _02_sellhouse.model.dao.SellHouseDAO#select_sellhouse_id(int)
 */
@Override
public SellHouseBean select_sellhouse_id(int id){
	SellHouseBean	bean=null;
	List<SellHouseBean> result=null;
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rset = null;
	try {
		//conn=DriverManager.getConnection(url,username,password);
		conn=dataSource.getConnection();
		pstmt = conn.prepareStatement(SELECT_BY_SELLHOUSE_ID);
		pstmt.setInt(1,id);
		rset = pstmt.executeQuery();	
		if(rset.next()){
			bean=new SellHouseBean();
			bean.setSellhouse_id(rset.getInt("sellhouse_id"));
			bean.setUser_account(rset.getString("user_account"));
			bean.setSellhouse_name(rset.getString("sellhouse_name"));
			bean.setSellhouse_price(rset.getFloat("sellhouse_price"));
			bean.setSellhouse_patterns(rset.getString("sellhouse_patterns"));
			bean.setSellhouse_address(rset.getString("sellhouse_address"));
			bean.setSellhouse_describe(rset.getString("sellhouse_describe"));
			bean.setSellhouse_size(rset.getFloat("sellhouse_size"));
			bean.setSellhouse_floor(rset.getString("sellhouse_floor"));
			bean.setSellhouse_age(rset.getFloat("sellhouse_age"));
			bean.setSellhouse_photo1(rset.getBlob("sellhouse_photo1"));
			bean.setSellhouse_photo2(rset.getBlob("sellhouse_photo2"));
			bean.setSellhouse_photo3(rset.getBlob("sellhouse_photo3"));
			bean.setSellhouse_type(rset.getString("sellhouse_type"));
			bean.setSellhouse_message(rset.getString("sellhouse_message"));
			bean.setSellhouse_date(rset.getDate("sellhouse_date"));
			bean.setSellhouse_car(rset.getString("sellhouse_car"));
			bean.setSellhouse_phone(rset.getString("sellhouse_phone"));
			bean.setSellhouse_email(rset.getString("sellhouse_email"));
			
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally{
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
	

	
	return bean;
}





/* (non-Javadoc)
 * @see _02_sellhouse.model.dao.SellHouseDAO#insert(_02_sellhouse.model.SellHouseBean, java.io.InputStream, long, java.io.InputStream, long, java.io.InputStream, long)
 */
@Override
public SellHouseBean insert(SellHouseBean bean,InputStream is1,long size1,InputStream is2,long size2,InputStream is3,long size3){
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	try {
		//conn=DriverManager.getConnection(url,username,password);
		conn=dataSource.getConnection();
		pstmt = conn.prepareStatement(INSERT);
		if(bean!=null){
			pstmt.setString(1,bean.getUser_account());
			pstmt.setString(2,bean.getSellhouse_name());
			pstmt.setFloat(3,bean.getSellhouse_price());
			pstmt.setString(4,bean.getSellhouse_patterns());
			pstmt.setString(5,bean.getSellhouse_address());
			pstmt.setString(6,bean.getSellhouse_describe());
			pstmt.setFloat(7,bean.getSellhouse_size());
			pstmt.setString(8,bean.getSellhouse_floor());
			pstmt.setFloat(9,bean.getSellhouse_age());
			pstmt.setString(10,bean.getSellhouse_photo1_name());
			//File image1=new File(bean.getSellhouse_photo1());
			//File image1=new File("C:/_JSP/image/1.jpg");
			//long size=image1.length();
			//InputStream is1=new FileInputStream(image1);
			pstmt.setBinaryStream(11,is1,size1);
			//File image2=new File(bean.getSellhouse_photo1());
			pstmt.setString(12,bean.getSellhouse_photo2_name());
			//File image2=new File("C:/_JSP/image/2.jpg");
			//long size2=image1.length();
			//InputStream is2=new FileInputStream(image2);
			pstmt.setBinaryStream(13,is2,size2);
			//File image2=new File(bean.getSellhouse_photo1());
			pstmt.setString(14,bean.getSellhouse_photo3_name());
			//File image3=new File("C:/_JSP/image/2.jpg");
			//long size3=image1.length();
			//InputStream is3=new FileInputStream(image3);
			pstmt.setBinaryStream(15,is3,size3);
			//預設值為A
			pstmt.setString(16,"A");
			pstmt.setString(17,bean.getSellhouse_message());
			pstmt.setString(18,bean.getSellhouse_car());
			pstmt.setString(19,bean.getSellhouse_phone());
			pstmt.setString(20,bean.getSellhouse_email());
			int i=	pstmt.executeUpdate();		
		System.out.println(i);
		}
	}  catch (SQLException e) {
		e.printStackTrace();
	}finally{
		
		if (pstmt !=null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		if (conn !=null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}
	return bean;
}


/* (non-Javadoc)
 * @see _02_sellhouse.model.dao.SellHouseDAO#update(_02_sellhouse.model.SellHouseBean)
 */
@Override
public SellHouseBean update(SellHouseBean bean,InputStream is1,long size1,InputStream is2,long size2,InputStream is3,long size3){
	Connection conn = null;
	PreparedStatement pstmt = null;
	try {
		//conn=DriverManager.getConnection(url,username,password);
		conn=dataSource.getConnection();
		pstmt = conn.prepareStatement(UPDATE);
		pstmt.setInt(20,bean.getSellhouse_id());
		pstmt.setString(1,bean.getSellhouse_name());
		pstmt.setFloat(2,bean.getSellhouse_price());
		pstmt.setString(3,bean.getSellhouse_patterns());
		pstmt.setString(4,bean.getSellhouse_address());
		pstmt.setString(5,bean.getSellhouse_describe());
		pstmt.setFloat(6,bean.getSellhouse_size());
		pstmt.setString(7,bean.getSellhouse_floor());
		pstmt.setFloat(8,bean.getSellhouse_age());
		//File image1=new File(bean.getSellhouse_photo1());
//		File image1=new File("C:/_JSP/image/1.jpg");
//		long size=image1.length();
		pstmt.setString(9,bean.getSellhouse_photo1_name());
//		InputStream is1=new FileInputStream(image1);
		pstmt.setBinaryStream(10,is1,size1);
		//File image2=new File(bean.getSellhouse_photo1());
//		File image2=new File("C:/_JSP/image/2.jpg");
//		long size2=image1.length();
//		InputStream is2=new FileInputStream(image2);
		pstmt.setString(11,bean.getSellhouse_photo2_name());
		pstmt.setBinaryStream(12,is2,size2);
		//File image2=new File(bean.getSellhouse_photo1());
//		File image3=new File("C:/_JSP/image/2.jpg");
//		long size3=image1.length();
//		InputStream is3=new FileInputStream(image3);
		pstmt.setString(13,bean.getSellhouse_photo2_name());
		pstmt.setBinaryStream(14,is3,size3);
		pstmt.setString(15,"A");
		pstmt.setString(16,bean.getSellhouse_message());
		pstmt.setString(17,bean.getSellhouse_car());
		pstmt.setString(18,bean.getSellhouse_phone());
		pstmt.setString(19,bean.getSellhouse_email());
		int i=	pstmt.executeUpdate();	
	} catch (SQLException e) {
		e.printStackTrace();
	}
	finally{
		
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
	
	return null;
}



/* (non-Javadoc)
 * @see _02_sellhouse.model.dao.SellHouseDAO#delete(int)
 */
@Override
public boolean delete(int id){
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	int i = 0;
	try {
		//conn=DriverManager.getConnection(url,username,password);
		conn=dataSource.getConnection();
		pstmt = conn.prepareStatement(DELETE);
		pstmt.setInt(1,id);
		i = pstmt.executeUpdate();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally{
		if (conn !=null) {
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
	}
	return false;
	
}

/* (non-Javadoc)
 * @see _02_sellhouse.model.dao.SellHouseDAO#updatereport(_02_sellhouse.model.SellHouseBean)
 */
@Override
public SellHouseBean updatereport(SellHouseBean bean){
	Connection conn = null;
	PreparedStatement pstmt = null;
	SellHouseBean result=null;
	try {
		conn=dataSource.getConnection();
		pstmt=conn.prepareStatement(UPDATE_REPORT);
		pstmt.setString(1,bean.getSellhouse_reportfrom());
		pstmt.setString(2,bean.getSellhouse_reportreason());
		pstmt.setInt(3,bean.getSellhouse_id());
		int i=pstmt.executeUpdate();
		if(i==1){
			result=bean;
		}
	
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	if (pstmt!=null) {
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
	return result;

	
}


public static void main(String[] args){
//	SellHouseDAOJdbc dao=new SellHouseDAOJdbc();
//	List<SellHouseBean> bean =dao.select_sellhouse_address("大安區");
	//List<SellHouseBean> bean =dao.select_sellhouse_name("房");
	//System.out.println(bean);
//	for(SellHouseBean beans:bean){
//	System.out.println("會員帳號:"+beans.getUser_account()+",標題:"+beans.getSellhouse_name()
//			+",價格:"+beans.getSellhouse_price()+",格局:"+beans.getSellhouse_patterns()+",地址:"+beans.getSellhouse_address()+",坪數:"+beans.getSellhouse_size()
//		+",樓層:"+beans.getSellhouse_floor()+",屋齡:"+beans.getSellhouse_age()+",訊息"+beans.getSellhouse_message()
//			+"刊登日期"+beans.getSellhouse_date()+",車位:"+beans.getSellhouse_car()+",電話:"+beans.getSellhouse_phone()+",E-mail:"+beans.getSellhouse_email());
//}			
//	List<SellHouseBean> bean=dao.SELECT_ALL();
//	for(SellHouseBean beans:bean){
//		System.out.println("會員帳號:"+beans.getUser_account()+",標題:"+beans.getSellhouse_name()
//				+",價格:"+beans.getSellhouse_price()+",格局:"+beans.getSellhouse_patterns()+",地址:"+beans.getSellhouse_address()+",坪數:"+beans.getSellhouse_size()
//				+",樓層:"+beans.getSellhouse_floor()+",屋齡:"+beans.getSellhouse_age()+",訊息"+beans.getSellhouse_message()
//				+"刊登日期"+beans.getSellhouse_date()+",車位:"+beans.getSellhouse_car()+",電話:"+beans.getSellhouse_phone()+",E-mail:"+beans.getSellhouse_email());
//	}

//	SellHouseDAOJdbc dao=new SellHouseDAOJdbc();
//	SellHouseBean bean=dao.select_sellhouse_id(111);
//	System.out.println(bean);
//	bean.setSellhouse_name("新莊金店面");
//	bean.setSellhouse_price(500);
//	bean.setSellhouse_patterns("住家");
//	bean.setSellhouse_address("新北市新莊區信樹路264之8號六樓");
//	bean.setSellhouse_describe("管理費5000元");
//	bean.setSellhouse_size(50);
//	bean.setSellhouse_floor("3樓");
//	bean.setSellhouse_age(20);
//	bean.setSellhouse_type("A");
//	bean.setSellhouse_message("安安");
//	bean.setSellhouse_car("無車位");
//	bean.setSellhouse_phone("888888");
//	bean.setSellhouse_email("xX");
//	dao.update(bean);
//	System.out.println(bean);
	//SellHouseDAO dao=new SellHouseDAOJdbc();
//	List<SellHouseBean>bean=dao.select_user_account("Tom123");
//	System.out.println(bean);
	
}
	

}
