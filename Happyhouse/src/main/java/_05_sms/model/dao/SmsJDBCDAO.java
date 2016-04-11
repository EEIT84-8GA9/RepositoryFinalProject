package _05_sms.model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import _05_sms.model.SmsVO;

public class SmsJDBCDAO {

	private static final String URL = "jdbc:sqlserver://localhost:1433;database=HappyHouse";
	private static final String USERNAME = "sa";
	private static final String PASSWORD = "passw0rd";

	private static final String SELECT_BY_ID = "select * from sms where sms_id=?";
	private static final String INSERT = "insert into sms (user_account,sms_mailers,sms_title,sms_describe,sms_date) values (?,?,?,?,getdate())";
	private static final String SELECT_ALL = "select * from sms";
	private static final String UPDATE = "update sms set User_account=?, sms_mailers=?, sms_title=?, sms_describe=?,sms_date=getdate() where sms_id=?";
	private static final String DELETE = "delete from sms where sms_id=?";

	private SmsVO select(int sms_id) {
		SmsVO result = null;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rset = null;
		try {
			conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			stmt = conn.prepareStatement(SELECT_BY_ID);
			stmt.setInt(1, sms_id);
			rset = stmt.executeQuery();
			if (rset.next()) {
				result = new SmsVO();
				result.setUser_account(rset.getString("user_account"));
				result.setSms_mailers(rset.getString("sms_mailers"));
				result.setSms_title(rset.getString("sms_title"));
				result.setSms_describe(rset.getString("sms_describe"));
				result.setSms_date(rset.getDate("sms_date"));
				result.setSms_id(rset.getInt("sms_id"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rset != null) {
				try {
					rset.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (stmt != null) {
				try {
					stmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return result;
	}

	
	public SmsVO insert(SmsVO vo) {
		Connection conn = null;
		PreparedStatement stmt = null;
		SmsVO result = null;
		ResultSet rset = null;
		try {
			conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			stmt = conn.prepareStatement(INSERT);
			if (vo != null) {
				stmt.setString(1, vo.getUser_account());
				stmt.setString(2, vo.getSms_mailers());
				stmt.setString(3, vo.getSms_title());
				stmt.setString(4, vo.getSms_describe());
				int i = stmt.executeUpdate();
				if (i == 1) {
					result = vo;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rset != null) {
				try {
					rset.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (stmt != null) {
				try {
					stmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return result;
	}

	
	public List<SmsVO> getAll() {
		List<SmsVO> result = null;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rset = null;
		try {
			conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			stmt = conn.prepareStatement(SELECT_ALL);
			rset = stmt.executeQuery();
			result = new ArrayList<SmsVO>();
			while (rset.next()) {
				SmsVO vo = new SmsVO();
				vo.setUser_account(rset.getString("user_account"));
				vo.setSms_mailers(rset.getString("sms_mailers"));
				vo.setSms_title(rset.getString("sms_title"));
				vo.setSms_describe(rset.getString("sms_describe"));
				vo.setSms_date(rset.getDate("sms_date"));
				result.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rset != null) {
				try {
					rset.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (stmt != null) {
				try {
					stmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return result;
	}

	private SmsVO update(String account, String mailers, String title,
			String describe, int id) {
		Connection conn = null;
		PreparedStatement stmt = null;
		SmsVO result = null;
		ResultSet rset = null;
		try {
			conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			stmt = conn.prepareStatement(UPDATE);
			stmt.setString(1, account);
			stmt.setString(2, mailers);
			stmt.setString(3, title);
			stmt.setString(4, describe);
			stmt.setInt(5, id);
			int i = stmt.executeUpdate();
			if (i == 1) {
				result = this.select(id);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rset != null) {
				try {
					rset.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			if (stmt != null) {
				try {
					stmt.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}

		return result;
	}


	public boolean delete(int sms_id) {
		Connection conn = null;
		PreparedStatement stmt = null;
		try {
			conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			stmt = conn.prepareStatement(DELETE);
			stmt.setInt(1, sms_id);
			int i = stmt.executeUpdate();
			if (i == 1) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(stmt!=null){
				try {
					stmt.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			if(conn!=null){
				try {
					conn.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return false;
	}

	public static void main(String[] args) {
		SmsJDBCDAO dao = new SmsJDBCDAO();

		// 查詢
//		 SmsVO vo =dao.select(300);
//		 System.out.println("sms_id : "+vo.getSms_id());
//		 System.out.println("user_account : "+vo.getUser_account());
//		 System.out.println("sms_mailers : "+vo.getSms_mailers());
//		 System.out.println("sms_title : "+vo.getSms_title());
//		 System.out.println("sms_describe : "+vo.getSms_describe());
//		 System.out.println("sms_date : "+vo.getSms_date());

		// 新增
//		 SmsVO vo =new SmsVO();
//		 vo.setUser_account("Alex123");
//		 vo.setSms_mailers("Cat777");
//		 vo.setSms_title("新增");
//		 vo.setSms_describe("Hello");
//		 dao.insert(vo);

		// 查全部
//		 List<SmsVO> vo = dao.getAll();
//		 for (SmsVO asms : vo) {
//		 System.out.println("sms_id : "+asms.getSms_id());
//		 System.out.println("user_account : "+asms.getUser_account());
//		 System.out.println("sms_mailers : "+asms.getSms_mailers());
//		 System.out.println("sms_title : "+asms.getSms_title());
//		 System.out.println("sms_describe : "+asms.getSms_describe());
//		 System.out.println("sms_date : "+asms.getSms_date());
//		 System.out.println();
//		 }

		// 更新
//		 dao.update("Alex123", "Cat777", "更新5566", "hELLO", 300);
		
		//刪除
//		dao.delete(302);
	}

}
