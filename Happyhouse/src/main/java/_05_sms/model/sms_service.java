package _05_sms.model;

import java.util.List;

import _05_sms.model.dao.SmsJNDIDAO;

public class sms_service {

	private SmsJNDIDAO dao = new SmsJNDIDAO();

	public List<SmsVO> select(String user_account) {
		List<SmsVO> result = dao.select(user_account);
		return result;
	}

	public SmsVO write(SmsVO vo) {
		SmsVO result = dao.insert(vo);
		return result;
	}

	public boolean delete(int sms_id) {
		boolean result = dao.delete(sms_id);
		return result;
	}

	public Boolean getAll_user_account(String user_account) {
		List<String> all_user_account = dao.getAll_user_account();
		Boolean result;

		for (String account : all_user_account) {
			if (account.equals(user_account)) {
				result = true;
				return result;
			}
		}

		result = false;
		return result;
	}
}
