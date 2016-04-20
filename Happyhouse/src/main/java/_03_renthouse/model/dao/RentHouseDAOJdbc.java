package _03_renthouse.model.dao;


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
import javax.sql.DataSource;

import _02_sellhouse.model.SellHouseBean;
import _03_renthouse.model.RentHouseBean;
import _03_renthouse.model.RentHouseDAO;







public class RentHouseDAOJdbc implements RentHouseDAO {
	private static final String url="jdbc:sqlserver://localhost:1433;database=HappyHouse";
	private static final String	username="sa";
	private	static final String password="sa123456";
	private static final String UPDATE_REPORT="UPDATE renthouse SET renthouse_reportfrom=?,renthouse_reportreason=?,renthouse_type='B' WHERE renthouse_id=?";
	private static final String SELECT_ALL="SELECT * FROM renthouse as r join users as u on r.user_account=u.user_account";
	private static final String SELECT_BY_USER_ACCOUNT="Select * FROM renthouse Where user_account LIKE ?";
	private static final String SELECT_BY_RENTHOUSE_NAME="Select * FROM renthouse Where renthouse_name LIKE ?";
	private static final String SELECT_BY_RENTHOUSE_PRICE="Select * FROM renthouse Where renthouse_price LIKE ?";
	private static final String SELECT_BY_RENTHOUSE_ADDRESS="Select * FROM renthouse Where renthouse_address LIKE ?";
	private static final String INSERT = "INSERT INTO renthouse  values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,getdate(),?,?,?,NULL,NULL)";
	private static final String SELECT_BY_RENTHOUSE_ID="Select * FROM renthouse Where renthouse_id=?";
	private static final String UPDATE
	="update renthouse set renthouse_name=?, renthouse_price=?,renthouse_deposit=?,renthouse_patterns=?,renthouse_address=?,renthouse_describe=?,renthouse_size=?,renthouse_floor=?,renthouse_rentdate=?,renthouse_photo1=?,renthouse_photo2=?,renthouse_photo3=?,renthouse_type=?,renthouse_message=?,renthouse_date=getdate(),renthouse_car=?,renthouse_phone=?,renthouse_email=? where renthouse_id=?";
	private static final String DELETE = "delete from renthouse where renthouse_id=?";
	private DataSource dataSource;

	public RentHouseDAOJdbc() {
		try {
			Context ctx = new InitialContext();
			dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/HappyHouse");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	
	
	/* (non-Javadoc)
	 * @see model.dao.RentHouseDAO#SELECT_ALL()
	 */
	@Override
	public	List<RentHouseBean> SELECT_ALL(){
	List<RentHouseBean> result=null;
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rset = null;
		 try {
			//conn=DriverManager.getConnection(url,username,password);
			conn=dataSource.getConnection();
			 pstmt=conn.prepareStatement(SELECT_ALL);
			 rset=pstmt.executeQuery();
			result=new ArrayList<RentHouseBean>();
			while(rset.next()){	
				RentHouseBean bean=new RentHouseBean();
				bean.setRenthouse_id(rset.getInt("renthouse_id"));
				bean.setUser_name(rset.getString("user_name"));
				bean.setUser_account(rset.getString("user_account"));
				bean.setRenthouse_name(rset.getString("renthouse_name"));
				bean.setRenthouse_price(rset.getFloat("renthouse_price"));
				bean.setRenthouse_deposit(rset.getString("renthouse_deposit"));
				bean.setRenthouse_patterns(rset.getString("renthouse_patterns"));
				bean.setRenthouse_address(rset.getString("renthouse_address"));
				bean.setRenthouse_describe(rset.getString("renthouse_describe"));
				bean.setRenthouse_size(rset.getFloat("renthouse_size"));
				bean.setRenthouse_floor(rset.getString("renthouse_floor"));
				bean.setRenthouse_rentdate(rset.getString("renthouse_rentdate"));
				bean.setRenthouse_photo1(rset.getBlob("renthouse_photo1"));
				bean.setRenthouse_photo2(rset.getBlob("renthouse_photo2"));
				bean.setRenthouse_photo3(rset.getBlob("renthouse_photo3"));
				bean.setRenthouse_type(rset.getString("renthouse_type"));
				bean.setRenthouse_message(rset.getString("renthouse_message"));
				bean.setRenthouse_date(rset.getDate("renthouse_date"));
				bean.setRenthouse_car(rset.getString("renthouse_car"));
				bean.setRenthouse_phone(rset.getString("renthouse_phone"));
				bean.setRenthouse_email(rset.getString("renthouse_email"));	
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



//標題搜尋
/* (non-Javadoc)
 * @see model.dao.RentHouseDAO#select_renthouse_name(java.lang.String)
 */
@Override
public List<RentHouseBean> select_renthouse_name(String renthouse_name){
	RentHouseBean bean=null;
	List<RentHouseBean> result=null;
	Connection conn =null;
	ResultSet rset=null;
	PreparedStatement pstmt=null;
	//String se="%"+sellhouse_name+"%";
	try {
		 //conn=DriverManager.getConnection(url,username,password);
		 conn=dataSource.getConnection();
		 pstmt=conn.prepareStatement(SELECT_BY_RENTHOUSE_NAME);
		 pstmt.setString(1,"%"+renthouse_name+"%");
		 rset=pstmt.executeQuery();
			result=new ArrayList<RentHouseBean>();
		while(rset.next()){
			bean=new RentHouseBean();
			bean.setRenthouse_id(rset.getInt("renthouse_id"));
			bean.setUser_account(rset.getString("user_account"));
			bean.setRenthouse_name(rset.getString("renthouse_name"));
			bean.setRenthouse_price(rset.getFloat("renthouse_price"));
			bean.setRenthouse_deposit(rset.getString("renthouse_deposit"));
			bean.setRenthouse_patterns(rset.getString("renthouse_patterns"));
			bean.setRenthouse_address(rset.getString("renthouse_address"));
			bean.setRenthouse_describe(rset.getString("renthouse_describe"));
			bean.setRenthouse_size(rset.getFloat("renthouse_size"));
			bean.setRenthouse_floor(rset.getString("renthouse_floor"));
			bean.setRenthouse_rentdate(rset.getString("renthouse_rentdate"));
			bean.setRenthouse_photo1(rset.getBlob("renthouse_photo1"));
			bean.setRenthouse_photo2(rset.getBlob("renthouse_photo2"));
			bean.setRenthouse_photo3(rset.getBlob("renthouse_photo3"));
			bean.setRenthouse_type(rset.getString("renthouse_type"));
			bean.setRenthouse_message(rset.getString("renthouse_message"));
			bean.setRenthouse_date(rset.getDate("renthouse_date"));
			bean.setRenthouse_car(rset.getString("renthouse_car"));
			bean.setRenthouse_phone(rset.getString("renthouse_phone"));
			bean.setRenthouse_email(rset.getString("renthouse_email"));	
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

//使用者搜尋
/* (non-Javadoc)
 * @see model.dao.RentHouseDAO#select_user_account(java.lang.String)
 */
@Override
public List<RentHouseBean> select_user_account(String user_account){
	RentHouseBean bean=null;
	List<RentHouseBean> result=null;
	Connection conn =null;
	ResultSet rset=null;
	PreparedStatement pstmt=null;
	//String se="%"+sellhouse_name+"%";
	try {
		 //conn=DriverManager.getConnection(url,username,password);
		conn=dataSource.getConnection();
		 pstmt=conn.prepareStatement(SELECT_BY_USER_ACCOUNT);
		 pstmt.setString(1,"%"+user_account+"%");
		 rset=pstmt.executeQuery();
			result=new ArrayList<RentHouseBean>();
		while(rset.next()){
			bean=new RentHouseBean();
			bean.setRenthouse_id(rset.getInt("renthouse_id"));
			bean.setUser_account(rset.getString("user_account"));
			bean.setRenthouse_name(rset.getString("renthouse_name"));
			bean.setRenthouse_price(rset.getFloat("renthouse_price"));
			bean.setRenthouse_deposit(rset.getString("renthouse_deposit"));
			bean.setRenthouse_patterns(rset.getString("renthouse_patterns"));
			bean.setRenthouse_address(rset.getString("renthouse_address"));
			bean.setRenthouse_describe(rset.getString("renthouse_describe"));
			bean.setRenthouse_size(rset.getFloat("renthouse_size"));
			bean.setRenthouse_floor(rset.getString("renthouse_floor"));
			bean.setRenthouse_rentdate(rset.getString("renthouse_rentdate"));
			bean.setRenthouse_photo1(rset.getBlob("renthouse_photo1"));
			bean.setRenthouse_photo2(rset.getBlob("renthouse_photo2"));
			bean.setRenthouse_photo3(rset.getBlob("renthouse_photo3"));
			bean.setRenthouse_type(rset.getString("renthouse_type"));
			bean.setRenthouse_message(rset.getString("renthouse_message"));
			bean.setRenthouse_date(rset.getDate("renthouse_date"));
			bean.setRenthouse_car(rset.getString("renthouse_car"));
			bean.setRenthouse_phone(rset.getString("renthouse_phone"));
			bean.setRenthouse_email(rset.getString("renthouse_email"));	
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

//價格搜尋
/* (non-Javadoc)
 * @see model.dao.RentHouseDAO#select_sellhouse_price(float)
 */
@Override
public List<RentHouseBean> select_renthouse_price(float renthouse_price){
	RentHouseBean bean=null;
	List<RentHouseBean> result=null;
	Connection conn =null;
	ResultSet rset=null;
	PreparedStatement pstmt=null;
	Float d=renthouse_price;
	
	String da= d.toString();
	   if(da.indexOf(".") > 0){  
           da =da.replaceAll("0+?$", "");//去掉多余的0  
           da= da.replaceAll("[.]$", "");//如最后一位是.则去掉  
       }  
	String se="%"+da+"%";
	try {
		 //conn=DriverManager.getConnection(url,username,password);
		conn=dataSource.getConnection();
		 pstmt=conn.prepareStatement(SELECT_BY_RENTHOUSE_PRICE);
		
		 pstmt.setString(1,"%"+da+"%");
		 
		 rset=pstmt.executeQuery();
			result=new ArrayList<RentHouseBean>();
		while(rset.next()){
			bean=new RentHouseBean();
			bean.setRenthouse_id(rset.getInt("renthouse_id"));
			bean.setUser_account(rset.getString("user_account"));
			bean.setRenthouse_name(rset.getString("renthouse_name"));
			bean.setRenthouse_price(rset.getFloat("renthouse_price"));
			bean.setRenthouse_deposit(rset.getString("renthouse_deposit"));
			bean.setRenthouse_patterns(rset.getString("renthouse_patterns"));
			bean.setRenthouse_address(rset.getString("renthouse_address"));
			bean.setRenthouse_describe(rset.getString("renthouse_describe"));
			bean.setRenthouse_size(rset.getFloat("renthouse_size"));
			bean.setRenthouse_floor(rset.getString("renthouse_floor"));
			bean.setRenthouse_rentdate(rset.getString("renthouse_rentdate"));
			bean.setRenthouse_photo1(rset.getBlob("renthouse_photo1"));
			bean.setRenthouse_photo2(rset.getBlob("renthouse_photo2"));
			bean.setRenthouse_photo3(rset.getBlob("renthouse_photo3"));
			bean.setRenthouse_type(rset.getString("renthouse_type"));
			bean.setRenthouse_message(rset.getString("renthouse_message"));
			bean.setRenthouse_date(rset.getDate("renthouse_date"));
			bean.setRenthouse_car(rset.getString("renthouse_car"));
			bean.setRenthouse_phone(rset.getString("renthouse_phone"));
			bean.setRenthouse_email(rset.getString("renthouse_email"));
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

//地址搜尋
/* (non-Javadoc)
 * @see model.dao.RentHouseDAO#select_renthouse_address(java.lang.String)
 */
@Override
public List<RentHouseBean> select_renthouse_address(String renthouse_address){
	RentHouseBean bean=null;
	List<RentHouseBean> result=null;
	Connection conn =null;
	ResultSet rset=null;
	PreparedStatement pstmt=null;
	String se="%"+renthouse_address+"%";
	try {
		 //conn=DriverManager.getConnection(url,username,password);
		conn=dataSource.getConnection();
		 pstmt=conn.prepareStatement(SELECT_BY_RENTHOUSE_ADDRESS);	
		 pstmt.setString(1,se);
		 rset=pstmt.executeQuery();
		result=new ArrayList<RentHouseBean>();
		while(rset.next()){
			bean=new RentHouseBean();
			bean.setRenthouse_id(rset.getInt("renthouse_id"));
			bean.setUser_account(rset.getString("user_account"));
			bean.setRenthouse_name(rset.getString("renthouse_name"));
			bean.setRenthouse_price(rset.getFloat("renthouse_price"));
			bean.setRenthouse_deposit(rset.getString("renthouse_deposit"));
			bean.setRenthouse_patterns(rset.getString("renthouse_patterns"));
			bean.setRenthouse_address(rset.getString("renthouse_address"));
			bean.setRenthouse_describe(rset.getString("renthouse_describe"));
			bean.setRenthouse_size(rset.getFloat("renthouse_size"));
			bean.setRenthouse_floor(rset.getString("renthouse_floor"));
			bean.setRenthouse_rentdate(rset.getString("renthouse_rentdate"));
			bean.setRenthouse_photo1(rset.getBlob("renthouse_photo1"));
			bean.setRenthouse_photo2(rset.getBlob("renthouse_photo2"));
			bean.setRenthouse_photo3(rset.getBlob("renthouse_photo3"));
			bean.setRenthouse_type(rset.getString("renthouse_type"));
			bean.setRenthouse_message(rset.getString("renthouse_message"));
			bean.setRenthouse_date(rset.getDate("renthouse_date"));
			bean.setRenthouse_car(rset.getString("renthouse_car"));
			bean.setRenthouse_phone(rset.getString("renthouse_phone"));
			bean.setRenthouse_email(rset.getString("renthouse_email"));
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
//id搜尋
/* (non-Javadoc)
 * @see model.dao.RentHouseDAO#select_renthouse_id(int)
 */
@Override
public RentHouseBean select_renthouse_id(int id){
	RentHouseBean	bean=null;
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rset = null;
	try {
		//conn = DriverManager.getConnection(url,username,password);
		conn=dataSource.getConnection();
		pstmt = conn.prepareStatement(SELECT_BY_RENTHOUSE_ID);
		pstmt.setInt(1,id);
		rset = pstmt.executeQuery();	
		if(rset.next()){
			bean=new RentHouseBean();
			
			bean.setRenthouse_id(rset.getInt("renthouse_id"));
			bean.setUser_account(rset.getString("user_account"));
			bean.setRenthouse_name(rset.getString("renthouse_name"));
			bean.setRenthouse_price(rset.getFloat("renthouse_price"));
			bean.setRenthouse_deposit(rset.getString("renthouse_deposit"));
			bean.setRenthouse_patterns(rset.getString("renthouse_patterns"));
			bean.setRenthouse_address(rset.getString("renthouse_address"));
			bean.setRenthouse_describe(rset.getString("renthouse_describe"));
			bean.setRenthouse_size(rset.getFloat("renthouse_size"));
			bean.setRenthouse_floor(rset.getString("renthouse_floor"));
			bean.setRenthouse_rentdate(rset.getString("renthouse_rentdate"));
			bean.setRenthouse_photo1(rset.getBlob("renthouse_photo1"));
			bean.setRenthouse_photo2(rset.getBlob("renthouse_photo2"));
			bean.setRenthouse_photo3(rset.getBlob("renthouse_photo3"));
			bean.setRenthouse_type(rset.getString("renthouse_type"));
			bean.setRenthouse_message(rset.getString("renthouse_message"));
			bean.setRenthouse_date(rset.getDate("renthouse_date"));
			bean.setRenthouse_car(rset.getString("renthouse_car"));
			bean.setRenthouse_phone(rset.getString("renthouse_phone"));
			bean.setRenthouse_email(rset.getString("renthouse_email"));
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
 * @see model.dao.RentHouseDAO#insert(model.RentHouseBean)
 */
@Override
public RentHouseBean insert(RentHouseBean bean,InputStream is1,long size1,InputStream is2,long size2,InputStream is3,long size3){
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	try {
		//conn = DriverManager.getConnection(url,username,password);
		conn=dataSource.getConnection();
		pstmt = conn.prepareStatement(INSERT);
		if(bean!=null){
			pstmt.setString(1,bean.getUser_account());
			pstmt.setString(2,bean.getRenthouse_name());
			pstmt.setFloat(3,bean.getRenthouse_price());
			pstmt.setString(4,bean.getRenthouse_deposit());
			pstmt.setString(5,bean.getRenthouse_patterns());
			pstmt.setString(6,bean.getRenthouse_address());
			pstmt.setString(7,bean.getRenthouse_describe());
			pstmt.setFloat(8,bean.getRenthouse_size());
			pstmt.setString(9,bean.getRenthouse_floor());
			pstmt.setString(10,bean.getRenthouse_rentdate());
			//File image1=new File(bean.getSellhouse_photo1());
//			File image1=new File("C:/_JSP/image/1.jpg");
//			long size=image1.length();
//			InputStream is1=new FileInputStream(image1);
			pstmt.setString(11,bean.getRenthouse_photo1_name());
			pstmt.setBinaryStream(12,is1,size1);
			//File image2=new File(bean.getSellhouse_photo1());
//			File image2=new File("C:/_JSP/image/2.jpg");
//			long size2=image1.length();
//			InputStream is2=new FileInputStream(image2);
			pstmt.setString(13,bean.getRenthouse_photo2_name());
			pstmt.setBinaryStream(14,is2,size2);
			//File image2=new File(bean.getSellhouse_photo1());
//			File image3=new File("C:/_JSP/image/2.jpg");
//			long size3=image1.length();
//			InputStream is3=new FileInputStream(image3);
			pstmt.setString(15,bean.getRenthouse_photo3_name());
			pstmt.setBinaryStream(16,is3,size3);
			pstmt.setString(17,"A");
			pstmt.setString(18,bean.getRenthouse_message());
			pstmt.setString(19,bean.getRenthouse_car());
			pstmt.setString(20,bean.getRenthouse_phone());
			pstmt.setString(21,bean.getRenthouse_email());
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
 * @see model.dao.RentHouseDAO#update(model.RentHouseBean)
 */
@Override
public RentHouseBean update(RentHouseBean bean){
	Connection conn = null;
	PreparedStatement pstmt = null;
	try {
		//conn = DriverManager.getConnection(url,username,password);
		conn=dataSource.getConnection();
		pstmt = conn.prepareStatement(UPDATE);
		pstmt.setInt(18,bean.getRenthouse_id());
		pstmt.setString(1,bean.getRenthouse_name());
		pstmt.setFloat(2,bean.getRenthouse_price());
		pstmt.setString(3,bean.getRenthouse_deposit());
		pstmt.setString(4,bean.getRenthouse_patterns());
		pstmt.setString(5,bean.getRenthouse_address());
		pstmt.setString(6,bean.getRenthouse_describe());
		pstmt.setFloat(7,bean.getRenthouse_size());
		pstmt.setString(8,bean.getRenthouse_floor());
		pstmt.setString(9,bean.getRenthouse_rentdate());
		//File image1=new File(bean.getSellhouse_photo1());
		File image1=new File("C:/_JSP/image/1.jpg");
		long size=image1.length();
		InputStream is1=new FileInputStream(image1);
		pstmt.setBlob(10,is1);
		//File image2=new File(bean.getSellhouse_photo1());
		File image2=new File("C:/_JSP/image/2.jpg");
		long size2=image1.length();
		InputStream is2=new FileInputStream(image2);
		pstmt.setBlob(11,is2);
		//File image2=new File(bean.getSellhouse_photo1());
		File image3=new File("C:/_JSP/image/2.jpg");
		long size3=image1.length();
		InputStream is3=new FileInputStream(image3);
		pstmt.setBlob(12,is3);
		pstmt.setString(13,bean.getRenthouse_type());
		pstmt.setString(14,bean.getRenthouse_message());
		pstmt.setString(15,bean.getRenthouse_car());
		pstmt.setString(16,bean.getRenthouse_phone());
		pstmt.setString(17,bean.getRenthouse_email());
		int i=	pstmt.executeUpdate();	
		System.out.println(i);
	} catch (FileNotFoundException e) {
		e.printStackTrace();
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
 * @see model.dao.RentHouseDAO#delete(int)
 */
@Override
public boolean delete(int id){
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	int i = 0;
	try {
		//conn = DriverManager.getConnection(url,username,password);
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
@Override
public  RentHouseBean updatereport(RentHouseBean bean){
	Connection conn = null;
	PreparedStatement pstmt = null;
	RentHouseBean result=null;
	try {
		conn=dataSource.getConnection();
		pstmt=conn.prepareStatement(UPDATE_REPORT);
		pstmt.setString(1,bean.getRenthouse_reportfrom());
		pstmt.setString(2,bean.getRenthouse_reportreason());
		pstmt.setInt(3,bean.getRenthouse_id());
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

	
	
	
};



public static void main(String[] args){
	RentHouseDAO dao=new RentHouseDAOJdbc();
	List<RentHouseBean>beans=dao.select_renthouse_address("中山");
	List<RentHouseBean>beanss=dao.select_user_account("Cat777");
	//RentHouseBean bean=dao.select_renthouse_id(100);
	RentHouseBean bean=dao.select_renthouse_id(110);
	//bean.setUser_account("make7775");
	//bean.setRenthouse_name("A雅房出租");
	//bean.setRenthouse_price(5000);
	//bean.setRenthouse_deposit("A半年");
	//bean.setRenthouse_patterns("A套房");
	//bean.setRenthouse_address("AA台北市士林區天母東路48巷");
	//bean.setRenthouse_describe("A不可養寵物");
	//bean.setRenthouse_size(30);
	//bean.setRenthouse_floor("A3樓");
	//bean.setRenthouse_rentdate("半年");
	//bean.setRenthouse_type("A");
	//bean.setRenthouse_message("AAAA");
	//bean.setRenthouse_car("A無車位");
	bean.setRenthouse_phone("65");
	bean.setRenthouse_email("Axxx@ddd.ddd");
	dao.update(bean);
	dao.delete(110);
	System.out.println(bean);
	
}
	

}
