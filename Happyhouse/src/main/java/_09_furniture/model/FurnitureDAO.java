package _09_furniture.model;

import java.util.List;


public interface FurnitureDAO {

	public abstract List<FurnitureBean> selectAllFurniture();

	public abstract List<FurnitureBean> selectKeyWord(String user_account);

	public abstract FurnitureBean select(int id);

}