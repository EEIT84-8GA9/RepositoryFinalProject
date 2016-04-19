package _01_users.model_dao;

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

public class UsersDAOJdbc implements UserDAO {
	private static final String USER_INSERT = "insert into users(user_account,user_password,user_name,user_address,user_phone,user_email,user_gender) values(?,?,?,?,?,?,?)";
	// private static final String URL =
	// "jdbc:sqlserver://localhost:1433;database=HappyHouse";
	// private static final String USERNAME = "sa";
	// private static final String PASSWORD = "sa123456";
	UsersBean result = null;
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	private DataSource dataSource;

	public UsersDAOJdbc() {
		try {
			Context ctx = new InitialContext();
			dataSource = (DataSource) ctx
					.lookup("java:comp/env/jdbc/HappyHouse");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	public static void main(String[] args) throws SQLException {
		UserDAO ud = new UsersDAOJdbc();
		 System.out.println(ud.select("Cat777"));
		List<UsersBean> users = ud.selectAll();
		// ud.runSelectAll(users);
		UsersBean user = new UsersBean();

		// System.out.print(ud.update(user));
		// ud.insert(user);
		// System.out.println(ud.insert(ud.insertdata(user)));

	}

	private static final String ONE_USER_SELECT = "select *  from users where user_account=? ";

	@Override
	public UsersBean select(String user_account) {

		try {

			// conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			conn = dataSource.getConnection();

			pstmt = conn.prepareStatement(ONE_USER_SELECT);
			pstmt.setString(1, user_account);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = new UsersBean();
				result.setUser_account(rs.getString("user_account"));
				result.setUser_password(rs.getString("user_password"));
				result.setUser_name(rs.getString("user_name"));
				result.setUser_phone(rs.getString("user_phone"));
				result.setUser_address(rs.getString("user_address"));
				result.setUser_email(rs.getString("user_email"));
				result.setUser_gender(rs.getString("user_gender"));
				result.setUser_type(rs.getString("user_type"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
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

	private static final String All_USER_SELECT = "select * from users";

	@Override
	public List<UsersBean> selectAll() {
		UsersBean user = null;
		List<UsersBean> users = new ArrayList<UsersBean>();

		try {
			// conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			conn = dataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(All_USER_SELECT);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				user = new UsersBean();
				user.setUser_account(rs.getString("user_account"));
				user.setUser_password(rs.getString("user_password"));
				user.setUser_name(rs.getString("user_name"));
				user.setUser_phone(rs.getString("user_phone"));
				user.setUser_email(rs.getString("user_email"));
				user.setUser_gender(rs.getString("user_gender"));
				user.setUser_type(rs.getString("user_type"));
				user.setUser_photo(rs.getBytes("user_photo"));
				users.add(user);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}

		return users;

	}

	@Override
	public void runSelectAll(List<UsersBean> users) {

		for (UsersBean user : users) {
			System.out.print(user.getUser_account() + ", ");
			System.out.print(user.getUser_password() + ", ");
			System.out.print(user.getUser_name() + ", ");
			System.out.print(user.getUser_phone() + ", ");
			System.out.print(user.getUser_email() + ", ");
			System.out.print(user.getUser_gender() + ", ");
			System.out.print(user.getUser_type() + ", ");
			System.out.print(user.getUser_photo() + "\n");

		}

	}

	@Override
	public int update(UsersBean user) throws SQLException {
		int updatecount = 0;
		try {
			conn = dataSource.getConnection();
			// conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);

			PreparedStatement pstmt = conn.prepareStatement(USER_UPDATE);
			pstmt.setString(1, user.getUser_password());
			pstmt.setString(2, user.getUser_address());
			pstmt.setString(3, user.getUser_phone());
			pstmt.setString(4, user.getUser_email());
			pstmt.setString(5, user.getUser_type());
			pstmt.setString(6, user.getUser_account());
			updatecount = pstmt.executeUpdate();
		} catch (SQLException e) {

			e.printStackTrace();
		}

		return updatecount;

	}

	@Override
	public int insert(UsersBean user) {

		int insertcount = 0;
		PreparedStatement pstmt = null;
		try {
			conn = dataSource.getConnection();
			// conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			pstmt = conn.prepareStatement(USER_INSERT);
			pstmt.setString(1, user.getUser_account());
			pstmt.setString(2, user.getUser_password());
			pstmt.setString(3, user.getUser_name());
			pstmt.setString(4, user.getUser_address());
			pstmt.setString(5, user.getUser_phone());
			pstmt.setString(6, user.getUser_email());
			pstmt.setString(7, user.getUser_gender());
			insertcount = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
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

		return insertcount;
	}

	@Override
	public UsersBean insertdata(UsersBean user) {
		user.setUser_account("xx5520");
		user.setUser_password("xxx");
		user.setUser_name("xxx");
		user.setUser_phone("09555555");
		user.setUser_address("台北市建國北路152號");
		user.setUser_email("123@yahoo.com.tw");
		user.setUser_gender("男");

		return user;

	}

}
