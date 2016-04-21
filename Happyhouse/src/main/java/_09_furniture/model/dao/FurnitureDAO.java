package _09_furniture.model.dao;

import java.io.InputStream;
import java.util.Date;
import java.util.List;

import _09_furniture.model.FurnitureBean;


public interface FurnitureDAO {

	public List<FurnitureBean> selectAllFurniture();

	public List<FurnitureBean> selectKeyWord(String user_account);

	public FurnitureBean select(int id);
	
	public FurnitureBean insert(FurnitureBean bean,InputStream is1,long size1,InputStream is2,long size2);

	public FurnitureBean update(FurnitureBean bean);

	public boolean delete(int furniture_id);

	public List<FurnitureBean> select(String user_account);

	

}