package _06_currentprice.model;

public class CurrentPriceBean {

	
	 private String currentprice_city;
	 private String currentprice_address;
	 private int currentprice_tradedate;
	 private String currentprice_trades;
	 private String currentprice_transes;
	 private String currentprice_floors;
	 private String currentprice_bdtype;
	 private String currentprice_mainway;
	 private String currentprice_maintype;
	 private int currentprice_enddate;
	 private float currentprice_housearea;
	 private int  currentprice_rooms;
	 private int  currentprice_livinroom;
	 private int currentprice_toilet;
	 private float currentprice_tprice;
	 private float currentprice_oneprice;
	 private float currentprice_caraream;
	 
	 
	 //方法三特別~!
	 private float avgoneprice_by_city_type;
	 
	 
	 //方法四特別~!
	 private float avgoneprice_by_tradedate;


	@Override
	public String toString() {
		return "CurrentPriceBean [currentprice_city=" + currentprice_city + ", currentprice_address="
				+ currentprice_address + ", currentprice_tradedate=" + currentprice_tradedate + ", currentprice_trades="
				+ currentprice_trades + ", currentprice_transes=" + currentprice_transes + ", currentprice_floors="
				+ currentprice_floors + ", currentprice_bdtype=" + currentprice_bdtype + ", currentprice_mainway="
				+ currentprice_mainway + ", currentprice_maintype=" + currentprice_maintype + ", currentprice_enddate="
				+ currentprice_enddate + ", currentprice_housearea=" + currentprice_housearea + ", currentprice_rooms="
				+ currentprice_rooms + ", currentprice_livinroom=" + currentprice_livinroom + ", currentprice_toilet="
				+ currentprice_toilet + ", currentprice_tprice=" + currentprice_tprice + ", currentprice_oneprice="
				+ currentprice_oneprice + ", currentprice_caraream=" + currentprice_caraream
				+ ", avgoneprice_by_city_type=" + avgoneprice_by_city_type + ", avgoneprice_by_tradedate="
				+ avgoneprice_by_tradedate + "]";
	}


	public String getCurrentprice_city() {
		return currentprice_city;
	}


	public void setCurrentprice_city(String currentprice_city) {
		this.currentprice_city = currentprice_city;
	}


	public String getCurrentprice_address() {
		return currentprice_address;
	}


	public void setCurrentprice_address(String currentprice_address) {
		this.currentprice_address = currentprice_address;
	}


	public int getCurrentprice_tradedate() {
		return currentprice_tradedate;
	}


	public void setCurrentprice_tradedate(int currentprice_tradedate) {
		this.currentprice_tradedate = currentprice_tradedate;
	}


	public String getCurrentprice_trades() {
		return currentprice_trades;
	}


	public void setCurrentprice_trades(String currentprice_trades) {
		this.currentprice_trades = currentprice_trades;
	}


	public String getCurrentprice_transes() {
		return currentprice_transes;
	}


	public void setCurrentprice_transes(String currentprice_transes) {
		this.currentprice_transes = currentprice_transes;
	}


	public String getCurrentprice_floors() {
		return currentprice_floors;
	}


	public void setCurrentprice_floors(String currentprice_floors) {
		this.currentprice_floors = currentprice_floors;
	}


	public String getCurrentprice_bdtype() {
		return currentprice_bdtype;
	}


	public void setCurrentprice_bdtype(String currentprice_bdtype) {
		this.currentprice_bdtype = currentprice_bdtype;
	}


	public String getCurrentprice_mainway() {
		return currentprice_mainway;
	}


	public void setCurrentprice_mainway(String currentprice_mainway) {
		this.currentprice_mainway = currentprice_mainway;
	}


	public String getCurrentprice_maintype() {
		return currentprice_maintype;
	}


	public void setCurrentprice_maintype(String currentprice_maintype) {
		this.currentprice_maintype = currentprice_maintype;
	}


	public int getCurrentprice_enddate() {
		return currentprice_enddate;
	}


	public void setCurrentprice_enddate(int currentprice_enddate) {
		this.currentprice_enddate = currentprice_enddate;
	}


	public float getCurrentprice_housearea() {
		return currentprice_housearea;
	}


	public void setCurrentprice_housearea(float currentprice_housearea) {
		this.currentprice_housearea = currentprice_housearea;
	}


	public int getCurrentprice_rooms() {
		return currentprice_rooms;
	}


	public void setCurrentprice_rooms(int currentprice_rooms) {
		this.currentprice_rooms = currentprice_rooms;
	}


	public int getCurrentprice_livinroom() {
		return currentprice_livinroom;
	}


	public void setCurrentprice_livinroom(int currentprice_livinroom) {
		this.currentprice_livinroom = currentprice_livinroom;
	}


	public int getCurrentprice_toilet() {
		return currentprice_toilet;
	}


	public void setCurrentprice_toilet(int currentprice_toilet) {
		this.currentprice_toilet = currentprice_toilet;
	}


	public float getCurrentprice_tprice() {
		return currentprice_tprice;
	}


	public void setCurrentprice_tprice(float currentprice_tprice) {
		this.currentprice_tprice = currentprice_tprice;
	}


	public float getCurrentprice_oneprice() {
		return currentprice_oneprice;
	}


	public void setCurrentprice_oneprice(float currentprice_oneprice) {
		this.currentprice_oneprice = currentprice_oneprice;
	}


	public float getCurrentprice_caraream() {
		return currentprice_caraream;
	}


	public void setCurrentprice_caraream(float currentprice_caraream) {
		this.currentprice_caraream = currentprice_caraream;
	}


	public float getAvgoneprice_by_city_type() {
		return avgoneprice_by_city_type;
	}


	public void setAvgoneprice_by_city_type(float avgoneprice_by_city_type) {
		this.avgoneprice_by_city_type = avgoneprice_by_city_type;
	}


	public float getAvgoneprice_by_tradedate() {
		return avgoneprice_by_tradedate;
	}


	public void setAvgoneprice_by_tradedate(float avgoneprice_by_tradedate) {
		this.avgoneprice_by_tradedate = avgoneprice_by_tradedate;
	}
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 


	
	
	
	
	
	
	
}
