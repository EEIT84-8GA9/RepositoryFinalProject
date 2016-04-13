package _08_news.model.dao;

import java.sql.Blob;
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

import org.junit.internal.runners.InitializationError;

import _08_news.model.newsBean;



public class newDAO {

	// private static final String URL
	// ="jdbc:sqlserver://localhost:1433;database=HappyHouse";
	// private static final String USERNAME = "sa";
	// private static final String PASSWORD = "sa123456";

	private DataSource dataSource;

	public newDAO() {

		try {
			Context ctx = new InitialContext();
			dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/HappyHouse");
		} catch (NamingException e) {
			e.printStackTrace();
		}

	}

	public static void main(String[] args) {

		newDAO dao = new newDAO();

		// 單一查詢

		// newsBean bean = dao.select(400);
		//
		// System.out.println(bean);

		// newsBean bean = dao.select("根本是小坪數奇蹟啊～峇里島風樓中樓");
		//
		// System.out.println(bean);

		// 全體查詢

		 List<newsBean> bean = dao.select();
		
		 for(newsBean set : bean){
		
		 set.getNew_id();
		 set.getNew_title();
		 set.getNew_describe();
		 set.getNew_date();
		 set.getNew_photo1();
		 set.getNew_photo2();
		 set.getNew_photo3();
		
		 System.out.println(set);
		
		
		 }

		// 新增

		// newsBean bean1 = new newsBean();
		//
		// bean1.setNew_title("超級無敵大拍賣");
		// bean1.setNew_describe("　遊戲的規則如同玩家所熟悉的 MOBA 類型遊戲，玩家的基地會不斷生出小兵推向敵陣，同一隊伍的玩家必須擬定策略逐步拿下對方據點，也可以藉由個人的操作技巧逆轉戰局。此外戰鬥過程中，玩家也可以在戰場上建設戰略性的建築物來嚇阻對方的攻勢。");
		// bean1.setNew_photo1(null);
		// bean1.setNew_photo2(null);
		// bean1.setNew_photo3(null);
		// dao.insert(bean1);
		// System.out.println(bean1);

		// 修改

		// dao.update("三三四五六七八",
		// "無限期支持薩滿瞬發爐石法案延宕中 請暴雪關懷弱勢老人清明時節 雷加爐石搓半天沒辦法回家又被祖先排擠的窘境", null, null,
		// null, 403);

		// 刪除

		// dao.delete(401);

	}

	private static final String SELECT_BY_NEW_ID = "select * from news where new_id = ?";

	public newsBean select(int new_id) {

		newsBean result = null;
		Connection con = null;
		PreparedStatement stm = null;
		ResultSet rse = null;

		try {
			con = dataSource.getConnection();
			// con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			stm = con.prepareStatement(SELECT_BY_NEW_ID);
			stm.setInt(1, new_id);
			rse = stm.executeQuery();

			if (rse.next()) {

				result = new newsBean();

				result.setNew_id(rse.getInt("new_id"));
				result.setNew_title(rse.getString("new_title"));
				result.setNew_describe(rse.getString("new_describe"));
				result.setNew_date(rse.getDate("new_date"));
				result.setNew_photo1(rse.getBlob("new_photo1"));
				result.setNew_photo2(rse.getBlob("new_photo2"));
				result.setNew_photo3(rse.getBlob("new_photo3"));

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
			}
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

	private static final String SELECT_BY_NEW_TITLE = "select * from news where new_title = ?";

	public newsBean select(String new_title) {

		newsBean result = null;
		Connection con = null;
		PreparedStatement stm = null;
		ResultSet rse = null;

		try {
			con = dataSource.getConnection();
			// con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			stm = con.prepareStatement(SELECT_BY_NEW_TITLE);
			stm.setString(1, new_title);
			rse = stm.executeQuery();

			if (rse.next()) {

				result = new newsBean();

				result.setNew_id(rse.getInt("new_id"));
				result.setNew_title(rse.getString("new_title"));
				result.setNew_describe(rse.getString("new_describe"));
				result.setNew_date(rse.getDate("new_date"));
				result.setNew_photo1(rse.getBlob("new_photo1"));
				result.setNew_photo2(rse.getBlob("new_photo2"));
				result.setNew_photo3(rse.getBlob("new_photo3"));

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
			}
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

	private static final String SELECT_ALL = "select * from news";

	public List<newsBean> select() {

		Connection con = null;
		PreparedStatement stm = null;
		ResultSet rs = null;


		newsBean setall = null;
		List<newsBean> startset = new ArrayList<newsBean>();

		try {
			con = dataSource.getConnection();
			// con = DriverManager.getConnection(URL,USERNAME,PASSWORD);
			stm = con.prepareStatement(SELECT_ALL);
			rs = stm.executeQuery();

			while (rs.next()) {

				setall = new newsBean();

				setall.setNew_id(rs.getInt("new_id"));
				setall.setNew_title(rs.getString("new_title"));
				setall.setNew_describe(rs.getString("new_describe"));
				setall.setNew_date(rs.getDate("new_date"));
				setall.setNew_photo1(rs.getBlob("new_photo1"));
				setall.setNew_photo2(rs.getBlob("new_photo2"));
				setall.setNew_photo3(rs.getBlob("new_photo3"));

			
				
				startset.add(setall);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (stm != null) {
				try {
					rs.close();
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

		return startset;

	}

	private static final String INSERT = "insert into news (new_title,new_describe,new_date,new_photo1,new_photo2,new_photo3) values (?,?,getdate(),?,?,?)";

	public newsBean insert(newsBean bean) {

		Connection con = null;
		PreparedStatement stm = null;

		try {
			con = dataSource.getConnection();
			// con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			stm = con.prepareStatement(INSERT);

			String con1 = bean.getNew_title();
			String con2 = bean.getNew_describe();
			Blob con3 = bean.getNew_photo1();
			Blob con4 = bean.getNew_photo2();
			Blob con5 = bean.getNew_photo3();

			stm.setString(1, con1);
			stm.setString(2, con2);
			stm.setBlob(3, con3);
			stm.setBlob(4, con4);
			stm.setBlob(5, con5);

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
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

		return bean;

	}

	private static final String UPDATE = "update news set new_title=? ,new_describe=? ,new_photo1 =? ,new_photo2 =?,new_photo3=? where new_id=? ";



	public newsBean update(String new_title, String new_describe,
			Blob new_photo1, Blob new_photo2, Blob new_photo3, Integer new_id) {

		Connection con = null;
		PreparedStatement stm = null;
		
		
		newsBean result = new newsBean();
		try {
			con = dataSource.getConnection();
			// con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			stm = con.prepareStatement(UPDATE);

			stm.setString(1, new_title);
			stm.setString(2, new_describe);
			stm.setBlob(3, new_photo1);
			stm.setBlob(4, new_photo2);
			stm.setBlob(5, new_photo3);
			stm.setInt(6, new_id);

			int i = stm.executeUpdate();
			if(i==1){
				result = this.select(new_id);
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

	private static final String DELETE = "delete from news where new_id=?";

	public boolean delete(int id) {

		Connection con = null;
		PreparedStatement stm = null;

		try {
			con = dataSource.getConnection();
			// con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
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

}
