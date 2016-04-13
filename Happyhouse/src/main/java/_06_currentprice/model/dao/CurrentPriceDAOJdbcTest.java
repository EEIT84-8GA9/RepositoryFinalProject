package _06_currentprice.model.dao;

import java.sql.Connection;


import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import _06_currentprice.model.CurrentPriceBean;
import _06_currentprice.model.CurrentPriceDAO;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

public class CurrentPriceDAOJdbcTest implements CurrentPriceDAO {

	private static final String URL = "jdbc:sqlserver://localhost:1433;database=HappyHouse";
	private static final String USERNAME = "sa";
	private static final String PASSWORD = "sa123456";

	// JNDI片段
	// private DataSource dataSource;
	// public CurrentPriceDAOJdbcTest() {
	// try {
	// Context ctx = new InitialContext();
	// dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/HappyHouse");
	// } catch (NamingException e) {
	// e.printStackTrace();
	// }
	// }

	private static final String SELECT_ALL = "select * from currentprice";
	private static final String SELECT_BY_CP_CITY = "select currentprice_housearea,currentprice_tprice from currentprice where currentprice_city =?";

	public static void main(String[] args) {

		CurrentPriceDAO dao = new CurrentPriceDAOJdbcTest();
		// 將beans列出 但不會分行
		// List<CurrentPriceBean>beans = dao.select();
		// System.out.println(beans);

		// 用加強迴FOR 讓每筆beans以GET 列出
		// List<CurrentPriceBean>beans = dao.select();
		// for(CurrentPriceBean beansss:beans){
		// System.out.println("鄉鎮市區=" + beansss.getCurrentprice_city() +" 門牌:"
		// +beansss.getCurrentprice_address()
		// +" 交易年月:" +beansss.getCurrentprice_tradedate()+" 交易筆棟數:"
		// +beansss.getCurrentprice_trades()
		// +" 移轉次數:" +beansss.getCurrentprice_transes() + " 總樓層數:"
		// +beansss.getCurrentprice_floors()
		// +" 建物型態:" +beansss.getCurrentprice_bdtype() + " 主要用途:"
		// +beansss.getCurrentprice_mainway()
		// +" 主要建材:" +beansss.getCurrentprice_maintype()+" 建築完成年月:" +
		// beansss.getCurrentprice_enddate()
		// +" 房屋總坪數:" +beansss.getCurrentprice_housearea()+ " 建物現況格局-房:" +
		// beansss.getCurrentprice_rooms()
		// +" 建物現況格局-廳:" +beansss.getCurrentprice_livinroom()+ " 建物現況格局-衛:"+
		// beansss.getCurrentprice_toilet()
		// +" 總價元:" +beansss.getCurrentprice_tprice()+"
		// 單價每平方公尺:"+beansss.getCurrentprice_oneprice()
		// +" 車位總價元:"+beansss.getCurrentprice_caraream());
		//
		// }

		// List<CurrentPriceBean>beanss = dao.select_by_cp_city("大同區");
		// System.out.println(beanss);

		// for(CurrentPriceBean beanssss:beanss){
		// System.out.println("房屋總坪數:" +beanssss.getCurrentprice_housearea()+ "
		// 總價元:" +beanssss.getCurrentprice_tprice());
		//
		// }

		// 第三方法TEST
		// List<CurrentPriceBean>beansssss =
		// dao.select_avgoneprice_by_city_type("大同區");
		// System.out.println(beansssss);

//		 List<CurrentPriceBean>beanz =
//		 dao.select_avgoneprice_by_city_type_tradedate("中山區", "%套房%");
//		 System.out.println(beanz);

//		List<CurrentPriceBean> beanzz = dao.select_all_by_city_type_transes("中山區", "%套房%", "%三層%");
//		System.out.println(beanzz);

	
//		List<CurrentPriceBean> beanwwww = dao.select_count_by_city_type("松山區");
//		System.out.println(beanwwww);
//		
//		List<CurrentPriceBean> beantt = dao.select_count_by_city_housearea("松山區");
//		System.out.println(beantt);
//		
//		
//		List<CurrentPriceBean> beanttt = dao.select_count_by_city_transes("松山區");
//		System.out.println(beanttt);
//		
		
		List<CurrentPriceBean> beanyy = dao.select_all_by_address("大安區");
		System.out.println(beanyy);
		
		
		
		
		// main方法尾
	}

	
	
	

	
//  第七個方法 select 全部 BY 地址!!  currentprice address
//  private static final String SELECT_BY_CP_CITY = "select currentprice_housearea,currentprice_tprice from currentprice where currentprice_city =?";
// currentprice address,currentprice_bdtype, currentprice_trades , currentprice_transes,currentprice_rooms,currentprice_livinroom,
//	currentprice_toilet,currentprice_enddate,currentprice_tradedate,currentprice_housearea,currentprice_oneprice
	private static final String SELECT_ALL_BY_ADDRESS 
	= "select * from currentprice where currentprice_address like ? order by currentprice_tradedate DESC";
	
	@Override
	public List<CurrentPriceBean> select_all_by_address(String currentprice_address) {
	
	List<CurrentPriceBean> result = null ;
	PreparedStatement stmt= null ;
	ResultSet   rset= null ;
	Connection conn= null;
		try {
//			 JDBC片段
			 conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			 
			 
//			 conn = dataSource.getConnection();
			 stmt = conn.prepareStatement(SELECT_ALL_BY_ADDRESS );
				 
			 stmt.setString(1,"%" + currentprice_address + "%");
			 rset = stmt.executeQuery();
			 result = new ArrayList<CurrentPriceBean>();
			 while(rset.next()){
				 
				CurrentPriceBean bean = new CurrentPriceBean();
			
				bean.setCurrentprice_address(rset.getString("currentprice_address"));
				bean.setCurrentprice_bdtype(rset.getString("currentprice_bdtype"));				
				bean.setCurrentprice_trades(rset.getString("currentprice_trades"));
				bean.setCurrentprice_transes(rset.getString("currentprice_transes"));
				bean.setCurrentprice_rooms(rset.getInt("currentprice_rooms"));
				bean.setCurrentprice_livinroom(rset.getInt("currentprice_livinroom"));
				bean.setCurrentprice_toilet(rset.getInt("currentprice_toilet"));
				bean.setCurrentprice_enddate(rset.getInt("currentprice_enddate"));
				bean.setCurrentprice_tradedate(rset.getInt("currentprice_tradedate"));
				bean.setCurrentprice_housearea(rset.getFloat("currentprice_housearea"));
				bean.setCurrentprice_oneprice(rset.getFloat("currentprice_oneprice"));
												
//				bean.setCurrentprice_floors(rset.getString("currentprice_floors"));
//				bean.setCurrentprice_mainway(rset.getString("currentprice_mainway"));
//				bean.setCurrentprice_maintype(rset.getString("currentprice_maintype"));
//				bean.setCurrentprice_tprice(rset.getFloat("currentprice_tprice"));
//				bean.setCurrentprice_caraream(rset.getFloat("currentprice_caraream"));
				
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
					if (stmt!=null) {
						try {
							stmt.close();
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
	
	
	
	// 第六個方法 ~~~~~~ pei第三張  樓層
//	select currentprice_transes ,count(currentprice_transes)as transes_count from currentprice 
//	 where  currentprice_city ='萬華區' AND currentprice_transes IN ('一層', '二層','三層','四層','五層','六層','七層','八層','九層','十層','十一層','十二層','全')
//	 group by currentprice_transes order by count(currentprice_transes) desc
	
	
		private static final String SELECT_COUNT_BY_CITY_TRANSES 
		= "select currentprice_transes ,count(currentprice_transes)as transes_count from currentprice "
		+ "WHERE  currentprice_city =? AND currentprice_transes IN ('一層', '二層','三層','四層','五層','六層','七層','八層','九層','十層','十一層','十二層','全')"
		+ "group by currentprice_transes order by count(currentprice_transes) desc";

		// 此處為了 as 新增的欄位 transes_count  在BEAN新增
		// transes_countGET SET方法
		// 此為將transes_count DB中AS欄位 匯入上行中新建之 bean~元件 !
		// bean.setTranses_count(rset.getInt("transes_count")); 將 DB中AS出的新欄位值
		// 塞入BEAN 新建的 BEAN元件
		@Override
		public List<CurrentPriceBean> select_count_by_city_transes(String currentprice_city) {
			List<CurrentPriceBean> result = null;
			Connection conn = null;
			PreparedStatement stmt = null;
			ResultSet rset = null;
			try {
				conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
				// conn = dataSource.getConnection();
				stmt = conn.prepareStatement(SELECT_COUNT_BY_CITY_TRANSES);
				stmt.setString(1, currentprice_city);
				rset = stmt.executeQuery();

				result = new ArrayList<CurrentPriceBean>();
				while (rset.next()) {
					CurrentPriceBean bean = new CurrentPriceBean();
					bean.setCurrentprice_transes(rset.getString("currentprice_transes"));
					bean.setTranses_count(rset.getInt("transes_count"));

					result.add(bean);

				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {

				if (rset != null) {
					try {
						rset.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				if (stmt != null) {
					try {
						stmt.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				if (conn != null) {
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
	
	
	
	
	
	
	
	
	
	
	// 第六個方法 ~~~~~~ pei第二張 坪數
	// select ROUND(currentprice_housearea,-1,1)as
	// housearea,count(currentprice_housearea)as housearea_count from
	// currentprice
	// where currentprice_city ='萬華區' AND ROUND(currentprice_housearea,-1,1)<>0
	// AND (ROUND(currentprice_housearea,-1,1)<101)
	// group by ROUND(currentprice_housearea,-1,1)
	// order by ROUND(currentprice_housearea,-1,1)
	private static final String SELECT_COUNT_BY_CITY_HOUSEAREA = "select  ROUND(currentprice_housearea,-1,1)as housearea_range,count(currentprice_housearea)as housearea_count from currentprice"
			+ " where   currentprice_city =? AND ROUND(currentprice_housearea,-1,1)<>0  AND (ROUND(currentprice_housearea,-1,1)<101)"
			+ "group by  ROUND(currentprice_housearea,-1,1)" 
			+ "order by  ROUND(currentprice_housearea,-1,1)";

	// 此處為了 as 新增的欄位 housearea_range housearea_count 在BEAN新增
	// housearea_range housearea_count GET SET方法
	// 此為將housearea_range housearea_count DB中AS欄位 匯入上行中新建之 bean~元件 !
	// bean.setHousearea_range(rset.getInt("housearea_range"));
	// bean.setHousearea_count(rset.getInt("housearea_count")); 將 DB中AS出的新欄位值
	// 塞入BEAN 新建的 BEAN元件
	@Override
	public List<CurrentPriceBean> select_count_by_city_housearea(String currentprice_city) {
		List<CurrentPriceBean> result = null;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rset = null;
		try {
			conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			// conn = dataSource.getConnection();
			stmt = conn.prepareStatement(SELECT_COUNT_BY_CITY_HOUSEAREA);
			stmt.setString(1, currentprice_city);
			rset = stmt.executeQuery();

			result = new ArrayList<CurrentPriceBean>();
			while (rset.next()) {
				CurrentPriceBean bean = new CurrentPriceBean();
				bean.setHousearea_range(rset.getInt("housearea_range"));
				bean.setHousearea_count(rset.getInt("housearea_count"));

				result.add(bean);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			if (rset != null) {
				try {
					rset.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (stmt != null) {
				try {
					stmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (conn != null) {
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

	// 第六個方法 ~~~~~~ pei第一張 類型
	// select currentprice_bdtype ,count(currentprice_bdtype)as bdtype_count
	// from currentprice
	// where currentprice_city ='萬華區' and currentprice_bdtype<>'倉庫' AND
	// currentprice_bdtype<>'農舍' AND currentprice_bdtype<>'工廠' AND
	// currentprice_bdtype<>'廠辦'
	// group by currentprice_bdtype

	private static final String SELECT_COUNT_BY_CITY_TYPE 
	= "select currentprice_bdtype ,count(currentprice_bdtype)as bdtype_count from currentprice"
	+ " WHERE  currentprice_city =? AND currentprice_bdtype<>'倉庫' AND currentprice_bdtype<>'農舍'"
	+ "AND currentprice_bdtype<>'工廠' AND currentprice_bdtype<>'廠辦'"
	+ "group by currentprice_bdtype";

	// 此處為了 as 新增的欄位 bdtype_count 在BEAN新增
	// bdtype_count GET SET方法
	// 此為將"bdtype_count" DB中AS欄位 匯入上行中新建之 bean~元件 !
	// bean.setBdtype_countGET(rset.getInt("bdtype_count")); 將 DB中AS出的新欄位值
	// 塞入BEAN 新建的 BEAN元件
	@Override
	public List<CurrentPriceBean> select_count_by_city_type(String currentprice_city) {
		List<CurrentPriceBean> result1 = null;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rset = null;
		try {
			conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
						// conn = dataSource.getConnection();
			stmt = conn.prepareStatement(SELECT_COUNT_BY_CITY_TYPE);
			stmt.setString(1, currentprice_city);
			rset = stmt.executeQuery();
		

			result1 = new ArrayList<CurrentPriceBean>();
			while (rset.next()) {
				CurrentPriceBean bean = new CurrentPriceBean();
				bean.setCurrentprice_bdtype(rset.getString("currentprice_bdtype"));
				bean.setCount_by_city_type(rset.getInt("bdtype_count"));

				result1.add(bean);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			if (rset != null) {
				try {
					rset.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (stmt != null) {
				try {
					stmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return result1;
	}

	// 第五個方法
	// SELECT TOP 84 PERCENT * FROM currentprice WHERE currentprice_city ='大安區'
	// AND currentprice_bdtype LIKE '%套房%' AND currentprice_transes LIKE '三層%'
	// order by currentprice_tprice

	private static final String SELECT_ALL_BY_CITY_TYPE_TRANSES = "SELECT TOP 84 PERCENT * FROM currentprice WHERE currentprice_city = ? AND  currentprice_bdtype  LIKE ? AND  currentprice_transes LIKE ? "
			+ "order by currentprice_tprice";

	// 模糊查詢 下面要加 "%"+currentprice_bdtype+"%" >>>>
	// pstmt.setString(1,"%"+currentprice_bdtype+"%");
	// 此處為了 as 新增的欄位 CEILING(AVG(Currentprice_oneprice)) 在BEAN新增
	// avg_oneprice_tradedate GET SET方法
	// 此為將"avg_oneprice" DB中AS欄位 匯入上行中新建之 bean~元件 !
	// bean.setAvgoneprice_by_city_type(rset.getFloat("avg_oneprice"));
	@Override
	public List<CurrentPriceBean> select_all_by_city_type_transes(String currentprice_city, String currentprice_bdtype,
			String currentprice_transes) {
		List<CurrentPriceBean> result = null;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rset = null;
		try {
			conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			// conn = dataSource.getConnection();
			stmt = conn.prepareStatement(SELECT_ALL_BY_CITY_TYPE_TRANSES);
			stmt.setString(1, currentprice_city);
			stmt.setString(2, "%" + currentprice_bdtype + "%");
			stmt.setString(3, "%" + currentprice_transes + "%");
			rset = stmt.executeQuery();

			result = new ArrayList<CurrentPriceBean>();
			while (rset.next()) {
				CurrentPriceBean bean = new CurrentPriceBean();
				bean.setCurrentprice_housearea(rset.getFloat("currentprice_housearea"));
				bean.setCurrentprice_tprice(rset.getFloat("currentprice_tprice"));

				result.add(bean);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			if (rset != null) {
				try {
					rset.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (stmt != null) {
				try {
					stmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (conn != null) {
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

	// 第四個方法~!
	// select currentprice_tradedate ,CEILING(AVG(Currentprice_oneprice)) as
	// avg_oneprice from currentprice
	// where currentprice_city ='文山區' AND currentprice_bdtype LIKE '%套房%' AND
	// currentprice_tradedate<>990 AND currentprice_tradedate<>991
	// GROUP BY currentprice_tradedate order by currentprice_tradedate

	private static final String SELECT_AVGONEPRICE_BY_CITY_TYPE_TRADEDATE = " select  currentprice_tradedate ,CEILING(AVG(Currentprice_oneprice)) as avg_oneprice_month from currentprice "
			+ "where  currentprice_city =? AND  currentprice_bdtype  LIKE ? AND currentprice_tradedate<>990 AND currentprice_tradedate<>991"
			+ "GROUP BY  currentprice_tradedate order by currentprice_tradedate ";

	// 模糊查詢 下面要加 "%"+currentprice_bdtype+"%" >>>>
	// pstmt.setString(1,"%"+currentprice_bdtype+"%");
	// 此處為了 as 新增的欄位 CEILING(AVG(Currentprice_oneprice)) 在BEAN新增
	// avg_oneprice_tradedate GET SET方法
	// 此為將"avg_oneprice" DB中AS欄位 匯入上行中新建之 bean~元件 !
	// bean.setAvgoneprice_by_city_type(rset.getFloat("avg_oneprice"));
	@Override
	public List<CurrentPriceBean> select_avgoneprice_by_city_type_tradedate(String currentprice_city,
			String currentprice_bdtype) {
		List<CurrentPriceBean> result = null;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rset = null;
		try {
			conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			// conn = dataSource.getConnection();
			stmt = conn.prepareStatement(SELECT_AVGONEPRICE_BY_CITY_TYPE_TRADEDATE);
			stmt.setString(1, currentprice_city);
			stmt.setString(2, "%" + currentprice_bdtype + "%");
			rset = stmt.executeQuery();

			result = new ArrayList<CurrentPriceBean>();
			while (rset.next()) {
				CurrentPriceBean bean = new CurrentPriceBean();

				bean.setCurrentprice_tradedate(rset.getInt("currentprice_tradedate"));
				bean.setAvgoneprice_by_tradedate(rset.getFloat("avg_oneprice_month"));

				result.add(bean);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			if (rset != null) {
				try {
					rset.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (stmt != null) {
				try {
					stmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (conn != null) {
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

	private static final String SELECT_AVGONEPRICE_BY_CITY_TYPE = " select currentprice_bdtype ,CEILING(AVG(Currentprice_oneprice)) as avg_oneprice from currentprice "
			+ "where  currentprice_city =? AND currentprice_bdtype<>'倉庫' "
			+ "GROUP BY currentprice_bdtype";

	// 第三個方法 select 平均坪價 類型 BY 區域
	// select currentprice_bdtype ,CEILING(AVG(Currentprice_oneprice)) from
	// currentprice where currentprice_city ='大安區' GROUP BY currentprice_bdtype
	// select AVG(Currentprice_oneprice) from currentprice where
	// currentprice_city ='大安區' AND currentprice_bdtype LIKE '%套房%'
	// 模糊查詢 下面要加 "%"+currentprice_bdtype+"%"
	// 此處為了 as 新增的欄位 CEILING(AVG(Currentprice_oneprice)) 在BEAN新增 avg_oneprice
	// GET SET方法
	@Override
	public List<CurrentPriceBean> select_avgoneprice_by_city_type(String currentprice_city) {
		List<CurrentPriceBean> result = null;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rset = null;
		try {
			conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			// conn = dataSource.getConnection();
			stmt = conn.prepareStatement(SELECT_AVGONEPRICE_BY_CITY_TYPE);
			stmt.setString(1, currentprice_city);
			rset = stmt.executeQuery();

			result = new ArrayList<CurrentPriceBean>();
			while (rset.next()) {
				CurrentPriceBean bean = new CurrentPriceBean();

				bean.setCurrentprice_bdtype(rset.getString("currentprice_bdtype"));
				bean.setAvgoneprice_by_city_type(rset.getFloat("avg_oneprice"));

				result.add(bean);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			if (rset != null) {
				try {
					rset.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (stmt != null) {
				try {
					stmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (conn != null) {
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

	// 第一個方法 select 全!
	@Override
	public List<CurrentPriceBean> select() {

		List<CurrentPriceBean> result = null;

		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rset = null;
		try {
			conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			// conn = dataSource.getConnection();
			stmt = conn.prepareStatement(SELECT_ALL);
			rset = stmt.executeQuery();

			result = new ArrayList<CurrentPriceBean>();
			while (rset.next()) {
				CurrentPriceBean bean = new CurrentPriceBean();
				bean.setCurrentprice_city(rset.getString("currentprice_city"));
				bean.setCurrentprice_address(rset.getString("currentprice_address"));
				bean.setCurrentprice_tradedate(rset.getInt("currentprice_tradedate"));
				bean.setCurrentprice_trades(rset.getString("currentprice_trades"));
				bean.setCurrentprice_transes(rset.getString("currentprice_transes"));
				bean.setCurrentprice_floors(rset.getString("currentprice_floors"));
				bean.setCurrentprice_bdtype(rset.getString("currentprice_bdtype"));
				bean.setCurrentprice_mainway(rset.getString("currentprice_mainway"));
				bean.setCurrentprice_maintype(rset.getString("currentprice_maintype"));
				bean.setCurrentprice_enddate(rset.getInt("currentprice_enddate"));
				bean.setCurrentprice_housearea(rset.getFloat("currentprice_housearea"));
				bean.setCurrentprice_rooms(rset.getInt("currentprice_rooms"));
				bean.setCurrentprice_livinroom(rset.getInt("currentprice_livinroom"));
				bean.setCurrentprice_toilet(rset.getInt("currentprice_toilet"));
				bean.setCurrentprice_tprice(rset.getFloat("currentprice_tprice"));
				bean.setCurrentprice_oneprice(rset.getFloat("currentprice_oneprice"));
				bean.setCurrentprice_caraream(rset.getFloat("currentprice_caraream"));

				result.add(bean);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			if (rset != null) {
				try {
					rset.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (stmt != null) {
				try {
					stmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (conn != null) {
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

	// 第二個方法 select 全部 BY 區域
	@Override
	public List<CurrentPriceBean> select_by_cp_city(String currentprice_city) {

		List<CurrentPriceBean> result = null;
		PreparedStatement stmt = null;
		ResultSet rset = null;
		Connection conn = null;
		try {
			// JDBC片段
			conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);

			// conn = dataSource.getConnection();
			stmt = conn.prepareStatement(SELECT_BY_CP_CITY);

			stmt.setString(1, currentprice_city);
			rset = stmt.executeQuery();
			result = new ArrayList<CurrentPriceBean>();
			while (rset.next()) {
				System.out.println(SELECT_BY_CP_CITY);
				CurrentPriceBean bean = new CurrentPriceBean();

				bean.setCurrentprice_housearea(rset.getFloat("currentprice_housearea"));
				bean.setCurrentprice_tprice(rset.getFloat("currentprice_tprice"));

				result.add(bean);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			if (rset != null) {
				try {
					rset.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

			if (stmt != null) {
				try {
					stmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

			if (conn != null) {
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
