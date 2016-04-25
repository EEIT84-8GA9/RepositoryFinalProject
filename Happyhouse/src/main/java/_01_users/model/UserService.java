package _01_users.model;

import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.Collection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

import _01_users.model_dao.UserDAO;
import _01_users.model_dao.UsersDAOJdbc;
import _02_sellhouse.model.SellHouseService;
import _09_furniture.model.FurnitureBean;

public class UserService {
	private UserDAO userDAO = new UsersDAOJdbc();
	public static final int IMAGE_FILENAME_LENGTH = 20;

	// private MessageDigest mDigest;

	public static void main(String[] args) {
		UserService service = new UserService();
		// UsersBean bean = new UsersBean();
		// bean.setUser_account("99");
		// bean.setUser_password("99");
		// bean.setUser_name("99");
		// bean.setUser_address("99");
		// bean.setUser_phone("99");
		// bean.setUser_email("99");
		// bean.setUser_gender("99");
		// service.regist(bean);
		// UsersBean bean = service.login("Alex123", "sa123");
		// System.out.println(bean);
		// System.out.print(service.changePassword("Alex123", "sa123",
		// "sa1234"));

		// System.out.print(service.changeUserType("Tank87", "D"));

	}

	public int changeUserType(String username, String type) {
		UsersBean bean = userDAO.select(username);

		if (bean != null) {

			bean.setUser_type(type);
			try {
				return userDAO.update(bean);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return 0;
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

	public UsersBean regist(UsersBean bean, InputStream is1, long size1) {
		UsersBean result = null;
		if(bean!=null) {
			result = userDAO.insert(bean,is1,size1);
		}
		
		
	
		return result;
	}

	public int changePassword(String username, String oldPassword,
			String newPassword) {
		UsersBean bean = this.login(username, oldPassword);

		if (bean != null) {
			if (newPassword != null && newPassword.trim().length() != 0) {
				if (oldPassword != newPassword) {
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

	public static String adjustFileName(String fileName, int maxLength) {
		int length = fileName.length();
		if (length <= maxLength) {
			return fileName;
		}
		int n = fileName.lastIndexOf(".");
		int sub = fileName.length() - n - 1;
		fileName = fileName.substring(0, maxLength - 1 - sub) + "."
				+ fileName.substring(n + 1);
		return fileName;
	}

	public static String getFileName(final Part part) {
		for (String content : part.getHeader("content-disposition").split(";")) {
			if (content.trim().startsWith("filename")) {
				return content.substring(content.indexOf('=') + 1).trim()
						.replace("\"", "");
			}
		}
		return null;
	}

	public static void exploreParts(Collection<Part> parts,
			HttpServletRequest req) {
		try {
			for (Part part : parts) {
				String name = part.getName();
				String contentType = part.getContentType();
				String value = "";
				long size = part.getSize(); // 上傳資料的大小，即上傳資料的位元組數
				InputStream is = part.getInputStream();
				if (contentType != null) { // 表示該part為檔案
					// 取出上傳檔案的檔名
					String filename = UserService.getFileName(part);
					// 將上傳的檔案寫入到location屬性所指定的資料夾
					if (filename != null && filename.trim().length() > 0) {
						part.write(filename);
						System.out.println(part.getClass().getName());
					}
				} else { // 表示該part為一般的欄位
					// 將上傳的欄位資料寫入到location屬性所指定的資料夾，檔名為"part_"+ name
					part.write("part_" + name);
					value = req.getParameter(name);
				}
				System.out.printf("%-15s %-15s %8d  %-20s \n", name,
						contentType, size, value);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
}
