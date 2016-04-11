package _07_carts.model.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import _07_carts.model.cartsBean;


public class cartsDAO {

	private static final String URL = "jdbc:sqlserver://localhost:1433;database=HappyHouse";
	private static final String USERNAME = "sa";
	private static final String PASSWORD = "sa123456";

	public static void main(String[] args) {

		cartsDAO dao = new cartsDAO();

		cartsBean bean = dao.select(400);

		System.out.println(bean);

		// 新增

		// cartsBean bean1 = new cartsBean();

		// bean1.setUser_account("Alex123");
		// bean1.setHouse_id(109);

		// dao.insert(bean1);
		// System.out.println(bean1);

		Connection con = null;
		PreparedStatement stm = null;

		// 刪除

		dao.delete(401);

	}

	private static final String SELECT_BY_CARTSID = "select * from carts where cart_id = ?";

	public cartsBean select(int cart_id) {

		cartsBean result = null;
		Connection con = null;
		PreparedStatement stm = null;
		ResultSet rse = null;

		try {
			con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			stm = con.prepareStatement(SELECT_BY_CARTSID);
			stm.setInt(1, cart_id);
			rse = stm.executeQuery();

			if (rse.next()) {

				result = new cartsBean();

				result.setCart_id(rse.getInt("cart_id"));
				result.setUser_account(rse.getString("user_account"));
				result.setHouse_id(rse.getInt("house_id"));
				result.setCatr_date(rse.getDate("cart_date"));

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

	private static final String SELECT_BY_SELECTALL = "select c.cart_id , u.user_account	,  s.sellhouse_id , sellhouse_name  ,s.sellhouse_price	, sellhouse_patterns ,s.sellhouse_address	 , s.sellhouse_describe , s.sellhouse_size ,sellhouse_floor,  sellhouse_age , s.sellhouse_car , s.sellhouse_photo1 , s. sellhouse_photo2 , s. sellhouse_photo3from sellhouse s left join carts con s.sellhouse_id=c.sellhouse_id left join users uon c.user_account=u.user_accountwhere c.cart_id is not null";

	
	
	
	
	
	private static final String INSERT = "insert into carts (user_account,house_id,cart_date) values (?,?,getdate())";

	private cartsBean insert(cartsBean bean) {

		Connection con = null;
		PreparedStatement stm = null;

		try {
			con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			stm = con.prepareStatement(INSERT);

			// int con1 = bean.getCart_id();
			String con2 = bean.getUser_account();
			int con3 = bean.getHouse_id();

			// stm.setInt(1, con1);
			stm.setString(1, con2);
			stm.setInt(2, con3);

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

		return null;

	}

	private static final String DELETE = "delete from carts where cart_id=?";

	public boolean delete(int id) {

		Connection con = null;
		PreparedStatement stm = null;

		try {
			con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			stm = con.prepareStatement(DELETE);
			stm.setInt(1, 401);
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
