package _09_furniture.model.dao;

import java.util.Date;
import java.util.List;

import _09_furniture.model.FurnitureBean;


public interface FurnitureDAO {

	public abstract List<FurnitureBean> selectAllFurniture();

	public abstract List<FurnitureBean> selectKeyWord(String user_account);

	public abstract FurnitureBean select(int id);
	
	public FurnitureBean insert(FurnitureBean bean);

	public FurnitureBean update(String name, double price, String status,String message,
			int id);

	public boolean delete(int furniture_id);

}