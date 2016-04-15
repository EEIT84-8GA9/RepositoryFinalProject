package _09_furniture.model.dao;

import java.util.Date;
import java.util.List;

import _09_furniture.model.FurnitureBean;


public interface FurnitureDAO {

	public List<FurnitureBean> selectAllFurniture();

	public List<FurnitureBean> selectKeyWord(String user_account);

	public FurnitureBean select(int id);
	
	public FurnitureBean insert(FurnitureBean bean);

	public FurnitureBean update(FurnitureBean bean);

	public boolean delete(int furniture_id);

	public List<FurnitureBean> select(String user_account);

	

}