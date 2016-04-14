package _04_message.model;

import java.util.List;

import _01_users.model.UsersBean;
import _04_message.model.dao.MessageJNDIDAO;

public class MessageService {
	private MessageJNDIDAO dao = new MessageJNDIDAO();

	// public static void main(String args[]){
	// MessageService service = new MessageService();
	//
	// MessageVO vo = new MessageVO();
	// vo.setUser_account("Alex123");
	// vo.setMessage_title("55555");
	// vo.setMessage_describe("55555");
	// service.add(vo);
	// }
	// public CustomerBean login(String username, String password) {
	// CustomerBean bean = customerDao.select(username);
	// if(bean!=null) {
	// byte[] pass = bean.getPassword(); //資料庫抓出的密碼
	// byte[] temp = password.getBytes(); //使用者輸入的密碼
	// if(Arrays.equals(pass, temp)) {
	// return bean;
	// }
	// }
	// return null;
	// }
	public MessageVO add(MessageVO vo) {
		MessageVO result = dao.addArticle(vo);
		return result;

	}

	public MessageVO resp(MessageVO vo) {

		MessageVO result = dao.respArticle(vo);
		return result;
	}

	public List<MessageVO> getall() {

		List<MessageVO> list = dao.getAll();
		return list;
	}

	public MessageVO select(String title) {
		MessageVO DBVO = dao.select(title);
		return DBVO;
	}
	public UsersBean login(String username, String password) {
		UsersBean bean = dao.select_account(username);
		if(bean!=null) {
			String pass = bean.getUser_password();	//資料庫抓出的密碼
			
			if(password.equals(pass)) {
				return bean;
			}
		}
		return null;
	}
	public MessageVO reportupdate(MessageVO vo) {
		MessageVO datamember =dao.select(vo);
		datamember.setMessage_reportfrom(vo.getMessage_reportfrom());
		datamember.setMessage_reportreason(vo.getMessage_reportreason());
		MessageVO result = dao.reportupdate(datamember);
		return result;
	}
}