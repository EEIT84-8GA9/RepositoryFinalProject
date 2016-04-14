package _09_furniture.model.dao;

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
import javax.sql.DataSource;

import _01_users.model.UsersBean;
import _09_furniture.model.FurnitureBean;





public class FurnitureDAOJdbc implements FurnitureDAO  {
	private static final String URL = "jdbc:sqlserver://localhost:1433;database=HappyHouse";
	private static final String USERNAME = "sa";
	private static final String PASSWORD = "sa123456";
	UsersBean result = null;
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	FurnitureBean fb = new FurnitureBean();

	
//	private DataSource dataSource;
//	
//	public FurnitureDAOJdbc() {
//		try {
//			Context ctx = new InitialContext();
//			dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/HappyHouse");
//		} catch (NamingException e) {
//			e.printStackTrace();
//		}
//	}

	public static void main(String[] args) {
		FurnitureDAO fc = new FurnitureDAOJdbc();
		FurnitureBean bean=new FurnitureBean();
		
		bean.setFurniture_id(1000);;
		bean.setFurniture_neme("www");
		bean.setFurniture_status("fff");
		bean.setFurniture_time("20151515");
		bean.setFurnitur_address("tai");
		bean.setFurniture_price(120);
		bean.setFurnitur_message("wowowo");
		System.out.println(fc.insert(bean));
		//fc.selectAllFurniture();
	//	 System.out.println(fc.selectAllFurniture());
	//	System.out.println(fc.selectKeyWord("l"));
		
		 
	}

	private static final String SELECT_ALL_FURNITURE = "SELECT * FROM furniture";

	/* (non-Javadoc)
	 * @see model.dao.FurnitureDAO#selectAllFurniture()
	 */
	@Override
	public List<FurnitureBean> selectAllFurniture() {
		
		List<FurnitureBean> fibs = new ArrayList<FurnitureBean>();
		try {
		Connection conn = DriverManager.getConnection(URL, USERNAME,PASSWORD);
		//	conn = dataSource.getConnection();
			PreparedStatement pstmt = conn
					.prepareStatement(SELECT_ALL_FURNITURE);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				FurnitureBean fib = new FurnitureBean();
				fib.setFurniture_id(rs.getInt("Furniture_id"));
				fib.setUser_account(rs.getString("user_account") + ",");
				fib.setFurniture_neme(rs.getString("Furniture_neme") + ",");
				fib.setFurniture_price(rs.getDouble("Furniture_price"));
				fib.setFurniture_status(rs.getString("Furniture_status") + ",");
				fib.setFurniture_time(rs.getString("Furniture_time") + ",");
				fib.setFurnitur_address(rs.getString("Furnitur_address") + ",");
				fib.setFurnitur_photo1(rs.getBytes("Furnitur_photo1"));
				fib.setFurnitur_photo2(rs.getBytes("Furnitur_photo2"));
				fib.setFurnitur_message(rs.getString("Furnitur_message") + ",");
				fib.setFurniture_type(rs.getString("Furniture_type") + "\n");
				fibs.add(fib);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return fibs;
	}

	private static final String SELECT_BY_KEYWORD = "SELECT * FROM furniture where user_account like ?";

	/* (non-Javadoc)
	 * @see model.dao.FurnitureDAO#selectKeyWord(java.lang.String)
	 */
	@Override
	public List<FurnitureBean> selectKeyWord(String user_account) {
		List<FurnitureBean> fbs = new ArrayList<FurnitureBean>();
		try {
			Connection conn = DriverManager.getConnection(URL, USERNAME,PASSWORD);
			//	conn = dataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SELECT_BY_KEYWORD);
			pstmt.setString(1, "%" + user_account + "%");
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {

				fb.setFurniture_id(rs.getInt("Furniture_id"));
				fb.setUser_account(rs.getString("user_account") + "\n");
				fbs.add(fb);

			}
		} catch (SQLException e) {

			e.printStackTrace();
		}

		return fbs;
	}

	private static final String SELECT_BY_ID="select * FROM furniture where Furniture_id=?";
	/* (non-Javadoc)
	 * @see model.dao.FurnitureDAO#select(int)
	 */
	@Override
	public FurnitureBean select(int id) {
		FurnitureBean result = null;
		ResultSet rset = null;
		try(
		   Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
				// 	Connection conn = dataSource.getConnection();
			PreparedStatement stmt = conn.prepareStatement(SELECT_BY_ID);) {
			
			stmt.setInt(1, id);
			rset = stmt.executeQuery();
			if(rset.next()) {
				result = new FurnitureBean();
				result.setFurniture_id(rset.getInt("Furniture_id"));
				result.setFurniture_neme(rset.getString("Furniture_neme"));
			    result.setFurniture_price(rset.getDouble("Furniture_price"));
				result.setFurniture_time(rset.getString("Furniture_time"));
				result.setFurnitur_message(rset.getString("Furnitur_message"));;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rset!=null) {
				try {
					rset.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return result;
	}
	
//	private static final String INSERT = "insert into Furniture (Furniture_neme, Furniture_price"
//			+ ",Furnitur_message,Furniture_type) values (?, ?,?,'A')";
	private static final String INSERT = "insert into  Furniture (user_account,Furniture_neme,"
			+ "Furniture_price,Furniture_status"
			+",Furniture_time,Furnitur_address,Furnitur_message,Furniture_type)"
			+"values ((SELECT f.user_account FROM Furniture f, users u"
				+"	WHERE  f.user_account=u.user_account"
				+"	and f.Furniture_id=?),?,?,?,?,?,?,'A')";
//	private static final String INSERT = "insert into  Furniture (user_account,Furniture_neme,"
//	+ "Furniture_price,Furniture_status"
//	+",Furniture_time,Furnitur_address,Furnitur_message,Furniture_type)"
//	+"values (?,?,?,?,?,?,?,'A')";
	@Override
	public FurnitureBean insert(FurnitureBean bean) {
		FurnitureBean result = null;
		try(Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
//			Connection conn = dataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(INSERT);) {
			if(bean!=null) {
				pstmt.setInt(1, bean.getFurniture_id());;
				pstmt.setString(2, bean.getFurniture_neme());
				pstmt.setDouble(3, bean.getFurniture_price());
				pstmt.setString(4, bean.getFurniture_status());
				pstmt.setString(5, bean.getFurniture_time());
				pstmt.setString(6, bean.getFurnitur_address());
				pstmt.setString(7, bean.getFurnitur_message());
				
				int i = pstmt.executeUpdate();
				if(i==1) {
					result = bean;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	private static final String UPDATE = "update Furniture set Furniture_neme=?, Furniture_price=?, Furniture_status=?"
			+ ", Furnitur_message=? where Furniture_id=?";
	@Override
	public FurnitureBean update(String name, double price, String status,String message,
			int id) {
		FurnitureBean result = null;
		try(Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
//			Connection conn = dataSource.getConnection();
			PreparedStatement stmt = conn.prepareStatement(UPDATE);) {
			stmt.setString(1, name);
			stmt.setDouble(2, price);
			stmt.setString(3, status);
			stmt.setString(4, message);
			stmt.setInt(5, id);
			int i = stmt.executeUpdate();
			if(i==1) {
				result = this.select(id);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	private static final String DELETE = "delete from Furniture where Furniture_id=?";
	@Override
	public boolean delete(int id) {
		try(Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
				//	Connection conn = dataSource.getConnection();
			PreparedStatement stmt = conn.prepareStatement(DELETE);) {			
			stmt.setInt(1, id);
			int i = stmt.executeUpdate();
			if(i==1) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}	


}


