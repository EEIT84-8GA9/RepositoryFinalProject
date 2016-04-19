package _01_users.model;
import java.sql.SQLException;

import _01_users.model_dao.UserDAO;
import _01_users.model_dao.UsersDAOJdbc;



public class UserService {
	private UserDAO userDAO = new UsersDAOJdbc();

	// private MessageDigest mDigest;

	public static void main(String[] args) {
		UserService service = new UserService();
//		UsersBean bean = new UsersBean();
//		 bean.setUser_account("99");
//		 bean.setUser_password("99");
//		 bean.setUser_name("99");
//		 bean.setUser_address("99");
//		 bean.setUser_phone("99");
//		 bean.setUser_email("99");
//		 bean.setUser_gender("99");
//		 service.regist(bean);
		// UsersBean bean = service.login("Alex123", "sa123");
		// System.out.println(bean);
		System.out.print(service.changePassword("Alex123", "sa123", "sa1234"));

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

	public UsersBean regist(UsersBean bean) {

		int conut = userDAO.insert(bean);
		if (conut == 1) {
			return bean;
		}
		return null;
	}

	public int changePassword(String username, String oldPassword,
			String newPassword) {
		UsersBean bean = this.login(username, oldPassword);
		
		if (bean != null) {
			if (newPassword != null && newPassword.trim().length() != 0) {
				if(oldPassword!=newPassword){
				bean.setUser_password(newPassword);
				// temp = mDigest.digest(temp);
				try {
					return userDAO.update(bean);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			}
		}
		return 0;
	}

}
