package _07_carts.model.dao;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.Date;
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

import _07_carts.model.cartsBean;
import _07_carts.model.cartsrentBean;
import _07_carts.model.cartssellBean;
import _08_news.model.newsBean;


public class cartsDAO {

	private DataSource dataSource;
	
//	private static final String URL = "jdbc:sqlserver://localhost:1433;database=HappyHouse";
//	private static final String USERNAME = "sa";
//	private static final String PASSWORD = "sa123456";
	
	public  cartsDAO() {
	
	try {
		Context ctx = new InitialContext();
		dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/HappyHouse");
	} catch (NamingException e) {
		e.printStackTrace();
	}
	}


	public static void main(String[] args) {

		cartsDAO dao = new cartsDAO();
		
		cartsBean bean = dao.select("Alex123");
		
		System.out.println(bean);

//		cartsBean bean = dao.select(400);
//
//		System.out.println(bean);

		// 新增

		// cartsBean bean1 = new cartsBean();

		// bean1.setUser_account("Alex123");
		// bean1.setHouse_id(109);

		// dao.insert(bean1);
		// System.out.println(bean1);
		
		//使用特殊的SQL語法全體搜尋
		
	    
//		List<cartssellBean> bean = dao.selectcartssell("Alex123");
//		
//		 for(cartssellBean set : bean){
//			
//			 
//		 set.getCart_id();
//		 set.getUser_account();
//		 set.getSellhouse_name();
//		 set.getSellhouse_price();
//		 set.getSellhouse_patterns();
//		 set.getSellhouse_address();
//		 set.getSellhouse_describe();
//		 set.getSellhouse_size();
//		 set.getSellhouse_floor();
//		 set.getSellhouse_age();
//		 set.getSellhouse_photo1();
//		 set.getSellhouse_photo2();
//		 set.getSellhouse_photo3();
//		 
//		 System.out.println(set);
		 
//		 List<cartsrentBean> bean1 = dao.selectcartsrent("Tom123");
//		 
//		 for(cartsrentBean setrent : bean1){
//		
//         setrent.getCart_id();
//         setrent.getUser_account();
//         setrent.getRenthouse_name();
//         setrent.getRenthouse_price();
//         setrent.getRenthouse_patterns();
//         setrent.getRenthouse_address();
//         setrent.getRenthouse_describe();
//         setrent.getRenthouse_size();
//         setrent.getRenthouse_floor();
//         setrent.getRenthouse_photo1();
//         setrent.getRenthouse_photo2();
//         setrent.getRenthouse_photo3();
//         
//	     System.out.println(setrent);
			 
		 
	
	
			 

		

		// 刪除

        //		dao.delete(401);

	}
	
	private static final String SELECT_BY_INSERT_SELL_ID = "select * from carts where sellhouse_id = ?";
	
	public cartsBean selectsell(int sellhouse_id){
		
		cartsBean result = null;
		Connection con = null;
		PreparedStatement stm = null;
		ResultSet rse = null;
		
		try {
			con = dataSource.getConnection();
			//con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			stm = con.prepareStatement(SELECT_BY_INSERT_SELL_ID);
			stm.setInt(1, sellhouse_id);
			rse = stm.executeQuery();
			
			if (rse.next()) {

				result = new cartsBean();

				result.setCart_id(rse.getInt("cart_id"));
				result.setUser_account(rse.getString("user_account"));
				result.setSellhouse_id(rse.getInt("sellhouse_id"));
				result.setRenthouse_id(rse.getInt("renthouse_id"));
				result.setCart_date(rse.getDate("cart_date"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}if(rse != null){
			try {
				rse.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}if(stm != null){
			try {
				stm.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}if(con != null){
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		
		
		return result;
	}
	
private static final String SELECT_BY_INSERT_RENT_ID = "select * from carts where sellhouse_id = ?";
	
	public cartsBean selectrent(int renthouse_id){
		
		cartsBean result = null;
		Connection con = null;
		PreparedStatement stm = null;
		ResultSet rse = null;
		
		try {
			con = dataSource.getConnection();
			//con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			stm = con.prepareStatement(SELECT_BY_INSERT_RENT_ID);
			stm.setInt(1, renthouse_id);
			rse = stm.executeQuery();
			
			if (rse.next()) {

				result = new cartsBean();

				result.setCart_id(rse.getInt("cart_id"));
				result.setUser_account(rse.getString("user_account"));
				result.setSellhouse_id(rse.getInt("sellhouse_id"));
				result.setRenthouse_id(rse.getInt("renthouse_id"));
				result.setCart_date(rse.getDate("cart_date"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}if(rse != null){
			try {
				rse.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}if(stm != null){
			try {
				stm.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}if(con != null){
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		
		
		return result;
	}
	

	private static final String SELECT_BY_CARTSID = "select * from carts where cart_id = ?";

	public cartsBean select(int cart_id) {

		cartsBean result = null;
		Connection con = null;
		PreparedStatement stm = null;
		ResultSet rse = null;
		
		

		try {
			con = dataSource.getConnection();
			//con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			stm = con.prepareStatement(SELECT_BY_CARTSID);
			stm.setInt(1, cart_id);
			rse = stm.executeQuery();

			if (rse.next()) {

				result = new cartsBean();

				result.setCart_id(rse.getInt("cart_id"));
				result.setUser_account(rse.getString("user_account"));
				result.setSellhouse_id(rse.getInt("sellhouse_id"));
				result.setRenthouse_id(rse.getInt("renthouse_id"));
				result.setCart_date(rse.getDate("cart_date"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rse != null) {
				try {
					rse.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				if (stm != null) {
					try {
						stm.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
					if (con != null) {
						try {
							con.close();
						} catch (SQLException e) {
							e.printStackTrace();
						}
					}
				}
			}
		}

		return result;
	}

	private static final String SELECT_BY_USERSID = "select * from carts where user_account = ?";
	
	public cartsBean select(String user_account){
		
		cartsBean result = null;
		Connection con = null;
		PreparedStatement stm = null;
		ResultSet rse = null;
		
		try {
			con = dataSource.getConnection();
			//con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			stm = con.prepareStatement(SELECT_BY_USERSID);
			stm.setString(1, user_account);
			rse = stm.executeQuery();
			
			if (rse.next()) {

				result = new cartsBean();

				result.setCart_id(rse.getInt("cart_id"));
				result.setUser_account(rse.getString("user_account"));
				result.setSellhouse_id(rse.getInt("sellhouse_id"));
				result.setRenthouse_id(rse.getInt("renthouse_id"));
				result.setCart_date(rse.getDate("cart_date"));
				

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			if( rse != null){
				try {
					rse.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if( stm != null){
				try {
					rse.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}if( con != null){
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		
		
		return result;
	}
	
	
	
	private static final String SELECT_BY_SELECTSELLALL = "select c.cart_id , u.user_account, s.sellhouse_id	 , sellhouse_name  ,s.sellhouse_price	, sellhouse_patterns ,s.sellhouse_address	 , s.sellhouse_describe , s.sellhouse_size ,sellhouse_floor,  sellhouse_age , s.sellhouse_car , s.sellhouse_photo1_name ,s.sellhouse_photo1 , s.sellhouse_photo2_name ,s. sellhouse_photo2 , s.sellhouse_photo3_name , s.sellhouse_photo3 , u.user_name , s.sellhouse_message , s.sellhouse_date ,  s.sellhouse_car , s.sellhouse_phone , s.sellhouse_email ,  s.sellhouse_type  from sellhouse s left join carts c on s.sellhouse_id = c.sellhouse_id left join users u on c.user_account = u.user_account where  u.user_account = ?";

	public List<cartssellBean> selectcartssell(String user_account){
		
		cartssellBean result = null;
		Connection con = null;
		PreparedStatement stm = null;
		ResultSet rse = null;
		
		List<cartssellBean> startset = new ArrayList<cartssellBean>();
		
		try {
			con = dataSource.getConnection();
			//con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			stm = con.prepareStatement(SELECT_BY_SELECTSELLALL);
			stm.setString(1, user_account);
			rse = stm.executeQuery();
			
			
		
			while(rse.next()) {

				result = new cartssellBean();

				result.setCart_id(rse.getInt("cart_id"));				
				result.setUser_account(rse.getString("user_account"));
				result.setSellhouse_id(rse.getInt("sellhouse_id"));
				result.setSellhouse_name(rse.getString("sellhouse_name"));
				result.setSellhouse_price(rse.getFloat("sellhouse_price"));
			    result.setSellhouse_patterns(rse.getString("sellhouse_patterns"));
			    result.setSellhouse_address(rse.getString("sellhouse_address"));
			    result.setSellhouse_describe(rse.getString("sellhouse_describe"));
			    result.setSellhouse_size(rse.getFloat("sellhouse_size"));
			    result.setSellhouse_floor(rse.getString("sellhouse_floor"));
			    result.setSellhouse_age(rse.getFloat("sellhouse_age"));
			    result.setSellhouse_photo1_name(rse.getString("sellhouse_photo1_name"));
			    result.setSellhouse_photo1(rse.getBlob("sellhouse_photo1"));
			    result.setSellhouse_photo2_name(rse.getString("sellhouse_photo2_name"));
			    result.setSellhouse_photo2(rse.getBlob("sellhouse_photo2"));
			    result.setSellhouse_photo3_name(rse.getString("sellhouse_photo3_name"));
			    result.setSellhouse_photo3(rse.getBlob("sellhouse_photo3"));
			    result.setUser_name(rse.getString("user_name"));
			    result.setSellhouse_message(rse.getString("sellhouse_message"));
			    result.setSellhouse_date(rse.getDate("sellhouse_date"));
			    result.setSellhouse_car(rse.getString("sellhouse_car"));
			    result.setSellhouse_phone(rse.getString("sellhouse_phone"));
			    result.setSellhouse_email(rse.getString("sellhouse_email"));
			    result.setSellhouse_type(rse.getString("sellhouse_type"));
			    
			    
			    			    
			    startset.add(result);
			
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			if(rse != null){
				try {
					rse.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}if( stm != null){
				try {
					stm.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}if(con !=null){
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		
		
		
		return startset;
				
	} 
	
	
	private static final String SELECT_BY_SELECTRENTALL ="select c.cart_id , u.user_account	 , r.renthouse_id , r.renthouse_name  ,r.renthouse_price	, renthouse_patterns ,r.renthouse_address	 , r.renthouse_describe , r.renthouse_size ,renthouse_floor , r.renthouse_car , r.renthouse_photo1_name, r.renthouse_photo1 ,r.renthouse_photo2_name, r. renthouse_photo2 , r.renthouse_photo3_name , r. renthouse_photo3  from renthouse r left join carts c on r.renthouse_id=c.renthouse_id left join users u on c.user_account=u.user_account where  u.user_account = ? ";
	
	public List<cartsrentBean> selectcartsrent(String user_account){
		
		cartsrentBean result = null;
		Connection con = null;
		PreparedStatement stm = null;
		ResultSet rse = null;
		
		List<cartsrentBean> startset = new ArrayList<cartsrentBean>();
		
		
		try {
			con = dataSource.getConnection();
			//con = DriverManager.getConnection(URL,USERNAME,PASSWORD);
			stm = con.prepareStatement(SELECT_BY_SELECTRENTALL);
			stm.setString(1, user_account);
			rse = stm.executeQuery();
			
			while (rse.next()) {

				result = new cartsrentBean();

				result.setCart_id(rse.getInt("cart_id"));
				result.setUser_account(rse.getString("user_account"));
				result.setRenthouse_id(rse.getInt("renthouse_id"));
				result.setRenthouse_name(rse.getString("renthouse_name"));
				result.setRenthouse_price(rse.getFloat("renthouse_price"));
			    result.setRenthouse_patterns(rse.getString("renthouse_patterns"));
			    result.setRenthouse_address(rse.getString("renthouse_address"));
			    result.setRenthouse_describe(rse.getString("renthouse_describe"));
			    result.setRenthouse_size(rse.getFloat("renthouse_size"));
			    result.setRenthouse_floor(rse.getString("renthouse_floor"));
			    result.setRenthouse_photo1_name(rse.getString("renthouse_photo1_name"));
			    result.setRenthouse_photo1(rse.getBlob("renthouse_photo1"));
			    result.setRenthouse_photo1_name(rse.getString("renthouse_photo2_name"));
			    result.setRenthouse_photo2(rse.getBlob("renthouse_photo2"));
			    result.setRenthouse_photo1_name(rse.getString("renthouse_photo3_name"));
			    result.setRenthouse_photo3(rse.getBlob("renthouse_photo3"));

			    
				
				startset.add(result);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			if(rse != null){
				try {
					rse.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}if(stm != null){
				try {
					stm.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}if(con != null){
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		
		
		
		
		
		
		return startset;
	}
	
	
	private static final String INSERT = "insert into carts (user_account,sellhouse_id,cart_date) values (?,?,getdate())";

	public cartsBean insert(cartsBean bean) {

		Connection con = null;
		PreparedStatement stm = null;

		try {
			con = dataSource.getConnection();
			//con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			stm = con.prepareStatement(INSERT);

			
			
			
			// int con1 = bean.getCart_id();
			String con2 = bean.getUser_account();
			int con3 = bean.getSellhouse_id();
			//int con4 = bean.getRenthouse_id();   //賣租屋要分開寫，因為一個有的畫另一個就要是NULL，分開寫比較簡單不然要寫判斷
			// stm.setInt(1, con1);
			
			cartsDAO dao = new cartsDAO();
			
			List<cartssellBean> sellbean = dao.selectcartssell(con2);
			
			
			
			
			stm.setString(1, con2);
			stm.setInt(2, con3);
			//stm.setInt(3, con4);
			

			
			
			
									
			stm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (stm != null) {
				try {
					stm.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		if (con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return bean;

	}
	
	private static final String INSERT2 = "insert into carts (user_account,renthouse_id,cart_date) values (?,?,getdate())";

	public cartsBean insert2(cartsBean bean) {

		Connection con = null;
		PreparedStatement stm = null;

		try {
			con = dataSource.getConnection();
			//con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			stm = con.prepareStatement(INSERT2);

			// int con1 = bean.getCart_id();
			String con2 = bean.getUser_account();
			int con3 = bean.getRenthouse_id();
			//int con4 = bean.getRenthouse_id();   //賣租屋要分開寫，因為一個有的畫另一個就要是NULL，分開寫比較簡單不然要寫判斷
			// stm.setInt(1, con1);
			stm.setString(1, con2);
			stm.setInt(2, con3);
			//stm.setInt(3, con4);

			stm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (stm != null) {
				try {
					stm.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		if (con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return bean;

	}
	
	
	private static final String UPDATE = "update news set user_account=? ,sellhouse_id=? ,renthouse_id=?, cart_date=getdate() where cart_id=? ";
	

	public cartsBean update(String user_account, int sellhouse_id,int renthouse_id, int cart_id) {
				
	Connection con = null;
	PreparedStatement stm = null;	
		
	
	
	cartsBean result = new cartsBean();
		
	try {
		con = dataSource.getConnection();
		// con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
		stm = con.prepareStatement(UPDATE);
		
		stm.setString(1, user_account);
		stm.setInt(2, sellhouse_id);
		stm.setInt(3, renthouse_id);
		stm.setInt(4, cart_id);
		
		int i = stm.executeUpdate();
		if(i==1){
			result = this.select(cart_id);
		}
		
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		if (stm != null) {
			try {
				stm.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
		
		
		return result;		
	}
	
	private static final String DELETE = "delete from carts where cart_id=?";

	public boolean delete(int id) {
		
		Connection con = null;
		PreparedStatement stm = null;
		
		try {
			con = dataSource.getConnection();
			//con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			stm = con.prepareStatement(DELETE);
			stm.setInt(1, id);
			int i = stm.executeUpdate();

			if (i == 1) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (stm != null) {
				try {
					stm.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return false;
	}
	private static final String SELECT_BY_SELL_HOUSE_ID="SELECT * FROM carts where sellhouse_id=?";
	public cartsBean selectbysellhouseid(cartsBean bean){
		cartsBean result = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		try {
			conn=dataSource.getConnection();
			pstmt=conn.prepareStatement(SELECT_BY_SELL_HOUSE_ID);
			pstmt.setInt(1,bean.getSellhouse_id());
			rset=pstmt.executeQuery();
			if(rset.next()){
				result = new cartsBean();
				result.setCart_id(rset.getInt("cart_id"));
				result.setUser_account(rset.getString("user_account"));
				result.setSellhouse_id(rset.getInt("sellhouse_id"));
				result.setRenthouse_id(rset.getInt("renthouse_id"));
				result.setCart_date(rset.getDate("cart_date"));
			}
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}finally{
		
		if (rset!=null) {
			try {
				rset.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if (pstmt!=null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if (conn!=null) {
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
	
}
