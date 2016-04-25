package _00_init;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.StringTokenizer;

public class CurrentPriceTable {
	public static final String UTF8_BOM = "\uFEFF";  // 定義 UTF-8的BOM字元 
	private static CharSequence test;
	public static void main(String[] args) throws SQLException, IOException, ClassNotFoundException {
		// TODO Auto-generated method stub
        //txt 檔也必須為 UTF8檔
		
			
		FileReader fr=new FileReader("e:/cpfinal.txt");

		// 附檔為 不動產 2015 5/1~ 10/31 台北 新北 *4   2015s3a 2015s3f 2015s4a 2015s4f
		
		  BufferedReader bf=new BufferedReader(fr);

		  StringTokenizer stk=null;

		  String line=null;

		  String SqlStr="";

		  String FieldStr="";

		  String ValueStr="";

//		  if ((line=bf.readLine())!=null)
//
//		  //先讀取第一行取得欄位
//
//		  {
//
//		     stk=new StringTokenizer(line,",");
//
//		     FieldStr="(";
//
//		     ValueStr="(";
//
//		     while (stk.hasMoreTokens())
//
//		     {
//
//		       FieldStr=FieldStr+stk.nextToken()+",";
//
//		       ValueStr=ValueStr+"?,";
//
//		     }
//
//		     FieldStr=FieldStr.substring(0,FieldStr.length()-1)+")";
//
//		     ValueStr=ValueStr.substring(0,ValueStr.length()-1)+")";
//
//		  }

//		  SqlStr="insert into Data (city,type,address,area,no1,no2,no3,tradedate,trades,transes,floors,bdtype,mainway,maintype,"
//					+"enddate,hsarea,rooms,livinroom,toilet,wall,manage,tprice,oneprice,carplace,cararea,caraream,ps,number)" 
//					+"values (?,?,?, ?, ?,?,?,?, ?, ?,?,?,?, ?, ?,?,?,?, ?, ?,?,?,?, ?, ?,?,?,?)";

		  //以上的步驟為讀取第一行資料，並組合成SQL語法
		  
		  
		  SqlStr="insert into currentprice(currentprice_city,currentprice_address, currentprice_tradedate, currentprice_trades,currentprice_transes,"
		  		+"currentprice_floors,currentprice_bdtype,currentprice_mainway, currentprice_maintype,currentprice_enddate,"
				+"currentprice_housearea,currentprice_rooms,currentprice_livinroom,currentprice_toilet, currentprice_tprice,"
		  		+"currentprice_oneprice,currentprice_caraream) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
 
		  
		  
		  //上為刪減版   28格  >>  17格
		  

		  

		  Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

		  Connection con=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=HappyHouse","sa","sa123456");

		  PreparedStatement pstmt=con.prepareStatement(SqlStr);
 
		  while((line=bf.readLine())!=null)

		  {

		     
			String[] items= line.split(",");
			
			pstmt.setString(1,items[0]);
			pstmt.setString(2,items[2]);
			
			//此區取日期,為了使資料只有年月~ 所以截掉日期的部份
			if (items[7].length()==7){
				pstmt.setString(3,(String)items[7].subSequence(0,5)); 
			}else if(items[7].length()==6){
				pstmt.setString(3,(String)items[7].subSequence(0,3)); 
			}else{
			pstmt.setString(3,items[7]);
			}
			
			
			
			pstmt.setString(4,items[8]);
			pstmt.setString(5,items[9]);
			pstmt.setString(6,items[10]);
			pstmt.setString(7,items[11]);
			pstmt.setString(8,items[12]);
			pstmt.setString(9,items[13]);
			pstmt.setString(10,items[14]);
			pstmt.setString(11,items[15]);
			pstmt.setString(12,items[16]);
			pstmt.setString(13,items[17]);
			pstmt.setString(14,items[18]);
			pstmt.setString(15,items[21]);
			pstmt.setString(16,items[22]);
			pstmt.setString(17,items[25]);

					


		    pstmt.addBatch();
 
		  }
//        上為		
		  
		  
		  
		  
//		  while((line=bf.readLine())!=null)
//
//		  {
//			  String[] items= line.split(",");
//			for(int i = 0 ; i < 28; i++)
//			{
//				 pstmt.setString((i+1),items[i]);
//			} 
//
//		    pstmt.addBatch();
// 
//		  }
//		  上為  跑出 TXT所有資料~
		  
		  
		  
//        因為	 用StringTokenizer	  他會忽略empty值
//        所以用上面的line.split    xx,,eee  中間,,間的資才會顯示空值出來

//		  int i=1;
//
//		  while((line=bf.readLine())!=null)
//
//		  {
//
//		    stk=new StringTokenizer(line,",");
//
//		    while(stk.hasMoreTokens())
//
//		    {
//
//		      pstmt.setString(i,stk.nextToken());
//
//		      i++;
//
//		    }
//
//		    pstmt.addBatch();
//
//		    i=1;
//
//		  }
		  
		   

		  pstmt.executeBatch();

		  bf.close();

		  fr.close();

		  pstmt.close();

		  con.close();

		 System.out.println("資料匯入完畢！");


		 
		 
		 
		 
	}

}