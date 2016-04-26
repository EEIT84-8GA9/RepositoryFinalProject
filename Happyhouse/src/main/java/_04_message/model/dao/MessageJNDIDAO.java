package _04_message.model.dao;

import java.sql.Connection;
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
import _04_message.model.MessageVO;

public class MessageJNDIDAO {
//	private static final String URL = "jdbc:sqlserver://localhost:1433;database=HappyHouse";
//	private static final String USERNAME = "sa";
//	private static final String PASSWORD = "passw0rd";
	
	private DataSource dataSource;
	public MessageJNDIDAO(){
		try {
			Context ctx = new InitialContext();
			dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/HappyHouse");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public MessageJNDIDAO(String dbString) {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup(dbString);
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	private static final String SELECT_BY_ID="select * from message where message_id=?";
	private static final String SELECT_BY_TITLE = "select * from message where message_title=?";
	private static final String SELECT_ALL = "select * from message";
	private static final String REPORTUPDATE = "update message set User_account=?, Message_title=?, Message_describe=?, Message_date=getdate(),Message_type='B' ,message_actiontype=? ,message_reportfrom=?,message_reportreason=? where Message_id=?";
	private static final String ADDARTICLE = "insert into message (user_account,message_title,message_describe,message_type,message_date,message_actiontype,message_reportfrom,message_reportreason) values (?,?,?,'A',?,'add',null,null)";
	private static final String RESPARTICLE ="insert into message (user_account,message_title,message_describe,message_type,message_date,message_actiontype,message_reportfrom,message_reportreason) values (?,?,?,'A',?,'res',null,null)";
	private static final String DELETE = "delete from message where message_id=?";
	private static final String SELECT_BY_ACCOUNT = "select * from users where user_account=?";
	private static final String TYPEUPDATE ="update message set User_account=?, Message_title=?, Message_describe=?, Message_date=?,Message_type=? ,message_actiontype=? ,message_reportfrom=?,message_reportreason=? where Message_id=?";
	
	public MessageVO select(MessageVO vo) {
		MessageVO result = null;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rset = null;
		try {
			//conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			conn = dataSource.getConnection();
			stmt = conn.prepareStatement(SELECT_BY_ID);
			stmt.setInt(1,vo.getMessage_id() );
			rset = stmt.executeQuery();
			if (rset.next()) {
				result = new MessageVO();
				result.setUser_account(rset.getString("user_account"));
				result.setMessage_title(rset.getString("message_title"));
				result.setMessage_describe(rset.getString("message_describe"));
				result.setMessage_date(rset.getDate("message_date"));
				result.setMessage_type(rset.getString("message_type"));
				result.setMessage_id(rset.getInt("message_id"));
				result.setMessage_actiontype(rset.getString("message_actiontype"));
				result.setMessage_reportfrom(rset.getString("message_reportfrom"));
				result.setMessage_reportreason(rset.getString("message_reportreason"));
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
	
	public MessageVO select(String message_title) {
		MessageVO result = null;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rset = null;
		try {
			//conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			conn = dataSource.getConnection();
			stmt = conn.prepareStatement(SELECT_BY_TITLE);
			stmt.setString(1, message_title);
			rset = stmt.executeQuery();
			if (rset.next()) {
				result = new MessageVO();
				result.setUser_account(rset.getString("user_account"));
				result.setMessage_title(rset.getString("message_title"));
				result.setMessage_describe(rset.getString("message_describe"));
				result.setMessage_date(rset.getDate("message_date"));
				result.setMessage_type(rset.getString("message_type"));
				result.setMessage_id(rset.getInt("message_id"));
				result.setMessage_actiontype(rset.getString("message_actiontype"));
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

	public List<MessageVO> getAll() {
		List<MessageVO> result = null;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rset = null;
		try {
			//conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			conn = dataSource.getConnection();
			stmt = conn.prepareStatement(SELECT_ALL);
			rset = stmt.executeQuery();
			result = new ArrayList<MessageVO>();
			while (rset.next()) {
				MessageVO vo = new MessageVO();
				vo.setUser_account(rset.getString("user_account"));
				vo.setMessage_title(rset.getString("message_title"));
				vo.setMessage_describe(rset.getString("message_describe"));
				vo.setMessage_date(rset.getDate("message_date"));
				vo.setMessage_type(rset.getString("message_type"));
				vo.setMessage_id(rset.getInt("message_id"));
				vo.setMessage_actiontype(rset.getString("message_actiontype"));
				vo.setMessage_reportfrom(rset.getString("message_reportfrom"));
				vo.setMessage_reportreason(rset.getString("message_reportreason"));
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
	public MessageVO reportupdate(MessageVO vo) {
		
		
		Connection conn = null;
		PreparedStatement stmt = null;
		MessageVO result = null;
		ResultSet rset = null;
		
		try {
			
			//conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			conn = dataSource.getConnection();
			stmt = conn.prepareStatement(REPORTUPDATE);
			stmt.setString(1, vo.getUser_account());
			stmt.setString(2, vo.getMessage_title());
			stmt.setString(3, vo.getMessage_describe());

			stmt.setString(4, vo.getMessage_actiontype());
			stmt.setString(5, vo.getMessage_reportfrom());
			stmt.setString(6, vo.getMessage_reportreason());
			stmt.setInt(7, vo.getMessage_id());
			int i = stmt.executeUpdate();
			if (i == 1) {
				result = vo;
			}
		} catch (Exception e) {
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
	public MessageVO addArticle(MessageVO vo) {
		Connection conn = null;
		PreparedStatement stmt = null;
		MessageVO result = null;
		ResultSet rset = null;
		try {
			//conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			conn = dataSource.getConnection();
			stmt = conn.prepareStatement(ADDARTICLE);
			if (vo != null) {
				stmt.setString(1, vo.getUser_account());
				stmt.setString(2, vo.getMessage_title());
				stmt.setString(3, vo.getMessage_describe());
				
				java.util.Date make=new java.util.Date();
				long time = make.getTime();
				vo.setMessage_date(new java.sql.Date(time));
				
				stmt.setDate(4, vo.getMessage_date());
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
	public MessageVO respArticle(MessageVO vo) {
		Connection conn = null;
		PreparedStatement stmt = null;
		MessageVO result = null;
		ResultSet rset = null;
		try {
			//conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			conn = dataSource.getConnection();
			stmt = conn.prepareStatement(RESPARTICLE);
			if (vo != null) {
				stmt.setString(1, vo.getUser_account());
				stmt.setString(2, vo.getMessage_title());
				stmt.setString(3, vo.getMessage_describe());
				java.util.Date make=new java.util.Date();
				long time = make.getTime();
				vo.setMessage_date(new java.sql.Date(time));
				
				stmt.setDate(4, vo.getMessage_date());
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
	public boolean delete(int message_id) {
		Connection conn = null;
		PreparedStatement stmt = null;
		try {
			//conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			conn = dataSource.getConnection();
			stmt = conn.prepareStatement(DELETE);
			stmt.setInt(1, message_id);
			int i = stmt.executeUpdate();
			if (i == 1) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

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
		return false;
	}

	public UsersBean select_account(String user_account) {
		UsersBean result = null;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rset = null;
		try {
			//conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			conn = dataSource.getConnection();
			stmt = conn.prepareStatement(SELECT_BY_ACCOUNT);
			stmt.setString(1, user_account);
			rset = stmt.executeQuery();
			if (rset.next()) {
				result = new UsersBean();
				result.setUser_account(rset.getString("user_account"));
				result.setUser_password(rset.getString("user_password"));
				result.setUser_name(rset.getString("user_name"));
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
	

	public MessageVO message_typeUpdate(MessageVO vo) {
		
		
		Connection conn = null;
		PreparedStatement stmt = null;
		MessageVO result = null;
		ResultSet rset = null;
		
		try {
			
			//conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			conn = dataSource.getConnection();
			stmt = conn.prepareStatement(TYPEUPDATE);
			stmt.setString(1, vo.getUser_account());
			stmt.setString(2, vo.getMessage_title());
			stmt.setString(3, vo.getMessage_describe());

			stmt.setDate(4, vo.getMessage_date());
			stmt.setString(5, vo.getMessage_type());
			stmt.setString(6, vo.getMessage_actiontype());
			stmt.setString(7,vo.getMessage_reportfrom());
			stmt.setString(8,vo.getMessage_reportreason());
			stmt.setInt(9, vo.getMessage_id());
			int i = stmt.executeUpdate();
			if (i == 1) {
				result = vo;
			}
		} catch (Exception e) {
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
}