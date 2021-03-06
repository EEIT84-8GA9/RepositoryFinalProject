package _01_users.model_dao;

import java.io.InputStream;
import java.sql.SQLException;
import java.util.List;

import _01_users.model.UsersBean;



public interface UserDAO {

	public abstract UsersBean select(String user_account);

	public abstract List<UsersBean> selectAll();

	public abstract void runSelectAll(List<UsersBean> users);

	public static final String USER_UPDATE = "update users set user_password=?,user_address=?,user_phone=?"
			+ ",user_email=?,user_type=? where user_account=?";

	public abstract int update(UsersBean user) throws SQLException;

	public static final String USER_INSERT = "insert into users values(?,?,?,?,?,?,?,?,?,?)";



	public abstract UsersBean insertdata(UsersBean user);

	

	public UsersBean insert(UsersBean user,InputStream is1,long size1);

}