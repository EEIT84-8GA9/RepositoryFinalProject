package _09_furniture.model;

import java.util.ArrayList;
import java.util.List;

import _09_furniture.model.dao.FurnitureDAO;
import _09_furniture.model.dao.FurnitureDAOJdbc;


public class FurnitureService {
	private FurnitureDAO productDao = new FurnitureDAOJdbc();
	public static void main(String[] args) {
		FurnitureService service = new FurnitureService();
		List<FurnitureBean> beans = service.select(null);
		System.out.println("beans="+beans);
	}
	public List<FurnitureBean> select(FurnitureBean bean) {
		List<FurnitureBean> result = null;
		if(bean!=null && bean.getFurniture_id()!=0) {
			FurnitureBean temp = productDao.select(bean.getFurniture_id());
			if(temp!=null) {
				result = new ArrayList<FurnitureBean>();
				result.add(temp);
			}
		} else {
			result = productDao.selectAllFurniture(); 
		}
		return result;
	}
	
	public FurnitureBean insert(FurnitureBean bean) {
		FurnitureBean result = null;
		if(bean!=null) {
			result = productDao.insert(bean);
		}
		return result;
	}
	public FurnitureBean update(FurnitureBean bean) {
		FurnitureBean result = null;
		if(bean!=null) {
			result = productDao.update(bean.getFurniture_neme(), bean.getFurniture_price(),
					bean.getFurniture_status(), bean.getFurnitur_message(), bean.getFurniture_id());
		}
		return result;
	}
	public boolean delete(FurnitureBean bean) {
		boolean result = false;
		if(bean!=null) {
			result = productDao.delete(bean.getFurniture_id());
		}
		return result;
	}
}
