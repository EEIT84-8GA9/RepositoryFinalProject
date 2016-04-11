package _01_users.model;

import java.sql.SQLException;
import java.util.List;



public interface UserDAO {

	public abstract UsersBean select(String user_account);

	public abstract List<UsersBean> selectAll();

	public abstract void runSelectAll(List<UsersBean> users);

	public static final String USER_UPDATE = "update users set user_password=?,user_address=?,user_phone=?"
			+ ",user_email=?,user_type=? where user_account=?";

	public abstract int update(UsersBean user) throws SQLException;

	public static final String USER_INSERT = "insert into users(user_account,user_password,user_name,"
			+ "user_address,user_phone,user_email,user_gender)"
			+ " values(?,?,?,?,?,?,?)";

	public abstract int insert(UsersBean user) throws SQLException;

	public abstract UsersBean insertdata(UsersBean user);

}