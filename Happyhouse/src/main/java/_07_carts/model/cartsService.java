package _07_carts.model;

import java.util.ArrayList;
import java.util.List;

import _04_message.controller.articleServlet1;
import _07_carts.model.dao.cartsDAO;
import _08_news.model.newsBean;



public class cartsService {
	private cartsDAO dao = new cartsDAO();

public List<cartsBean> select(cartsBean bean){
	
	List<cartsBean> result = null;
  
    if(bean != null && bean.getUser_account() != null){
        cartsBean temp = dao.select(bean.getUser_account());
    if(temp != null){
    	result = new ArrayList<cartsBean>();
    	result.add(temp);
    }
    }
    	
    	
     return  result;
}
	
	public List<cartssellBean> select(cartssellBean bean){
		
		List<cartssellBean> result = null;
		
		if(bean != null && bean.getUser_account() != null){
			result = dao.selectcartssell(bean.getUser_account());
			}
		
		
		 return  result;
	}
	
	public List<cartsrentBean> select(cartsrentBean bean){
		
		List<cartsrentBean> result = null;
		
		if(bean != null && bean.getUser_account() != null){
			result = dao.selectcartsrent(bean.getUser_account());
			}
		
		
		 return  result;
	}	
	
	
	

}
