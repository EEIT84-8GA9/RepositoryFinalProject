package _01_users.model;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.Arrays;

import _01_users.model_dao.UsersDAOJdbc;



public class UserService {
	private UserDAO userDAO = new UsersDAOJdbc();

	// private MessageDigest mDigest;

	public static void main(String[] args) {
		UserService service = new UserService();
		UsersBean bean = service.login("Alex123", "sa123");
		System.out.println(bean);
		service.changePassword("Alex123", "sa123", "EEE");
	}

	public UsersBean login(String username, String password) {
		UsersBean bean = userDAO.select(username);
		if (bean != null) {
			String pass = bean.getUser_password(); // 資料庫抓出的密碼
			if (pass.equals(password)) {

				return bean;
			}
		}
		return null;
	}

	public int changePassword(String username, String oldPassword,
			String newPassword) {
		UsersBean bean = this.login(username, oldPassword);
		if (bean != null) {
			if (newPassword != null && newPassword.length() != 0) {
				byte[] temp = newPassword.getBytes();
				// temp = mDigest.digest(temp);
				try {
					return userDAO.update(bean);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return 0;
	}

}
