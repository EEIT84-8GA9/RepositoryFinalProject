package _08_news.model;

import java.util.ArrayList;
import java.util.List;

import _05_sms.model.SmsVO;
import _08_news.model.dao.newDAO;


public class NewsService {

	private newDAO dao = new newDAO();

	private static void main(String[] args) {
		// NewsService service = new NewsService();
		// List<newsBean> bean = service

		// NewsService service = new NewsService();
		// List<newsBean> beans = service.select(null);
		// System.out.println("beans=" + beans);

	}

	public newsBean select(int id) {
		newsBean result = dao.select(id);
		return result;
	}
	
	public List<newsBean> select(newsBean bean) {
		List<newsBean> result = null;

		if (bean != null && bean.getNew_id() != 0) {
			newsBean temp = dao.select(bean.getNew_id());
			if (temp != null) {
				result = new ArrayList<newsBean>();
				result.add(temp);
			}
		} else {
			result = dao.select();
		}
		return result;
	}

	public newsBean insert(newsBean bean) {
		newsBean result = null;
		if (bean != null) {
			result = dao.insert(bean);

		}

		return result;

	}

	public newsBean update(newsBean bean) {
		newsBean result = null;
		if (bean != null) {

			result = dao.update(bean.getNew_title(), bean.getNew_describe(),
					bean.getNew_photo1(), bean.getNew_photo2(),
					bean.getNew_photo3(), bean.getNew_id());

		}
		return result;
	}

     public boolean delete(newsBean bean){
    	 boolean result = false;
    	 if(bean!=null){
    		 result = dao.delete(bean.getNew_id());
    	 }
    	 return result;
     }
	
	
}
