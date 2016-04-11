package _09_furniture.model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import _09_furniture.model.FurnitureBean;
import _09_furniture.model.FurnitureDAO;




public class FurnitureDAOJdbc implements FurnitureDAO  {
	private static final String URL = "jdbc:sqlserver://localhost:1433;database=HappyHouse";
	private static final String USERNAME = "sa";
	private static final String PASSWORD = "sa123456";
	FurnitureBean fb = new FurnitureBean();

	public static void main(String[] args) {
		FurnitureDAO fc = new FurnitureDAOJdbc();
		// System.out.println(fc.selectAllFurniture());
		System.out.println(fc.selectKeyWord("l"));
	}

	private static final String SELECT_ALL_FURNITURE = "SELECT * FROM furniture";

	/* (non-Javadoc)
	 * @see model.dao.FurnitureDAO#selectAllFurniture()
	 */
	@Override
	public List<FurnitureBean> selectAllFurniture() {
		FurnitureBean fib = new FurnitureBean();
		List<FurnitureBean> fibs = new ArrayList<FurnitureBean>();
		try {
			Connection conn = DriverManager.getConnection(URL, USERNAME,
					PASSWORD);
			PreparedStatement pstmt = conn
					.prepareStatement(SELECT_ALL_FURNITURE);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
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
			Connection conn = DriverManager.getConnection(URL, USERNAME,
					PASSWORD);
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

	private static final String SELECT_BY_ID="ELECT * FROM furniture where Furniture_id=?";
	/* (non-Javadoc)
	 * @see model.dao.FurnitureDAO#select(int)
	 */
	@Override
	public FurnitureBean select(int id) {
		FurnitureBean result = null;
		ResultSet rset = null;
		try(
			Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
//			Connection conn = dataSource.getConnection();
			PreparedStatement stmt = conn.prepareStatement(SELECT_BY_ID);) {
			
			stmt.setInt(1, id);
			rset = stmt.executeQuery();
			if(rset.next()) {
				result = new FurnitureBean();
				result.setFurniture_id(rset.getInt("Furniture_id"));
				result.setFurniture_neme(rset.getString("Furniture_neme"));
			    result.setFurniture_price(rset.getDouble("Furniture_price"));
				result.setFurniture_time(rset.getString("Furniture_time"));
				result.setFurnitur_message(rset.getString(""));;
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
}
