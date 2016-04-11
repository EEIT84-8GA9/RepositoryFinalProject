package _02_sellhouse.controller;





import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import _02_sellhouse.model.SellHouseBean;
import _02_sellhouse.model.SellHouseService;






@WebListener
public class IndexLinstener implements ServletContextListener {
	
 

	
    public void contextDestroyed(ServletContextEvent sce)  { 
       
    }

	
    public void contextInitialized(ServletContextEvent event)  { 
    	System.out.println("1");
       ServletContext context=event.getServletContext();
       System.out.println("2");
    	String dbString=context.getInitParameter("DBString");
    	System.out.println("3");
    	SellHouseService service=new SellHouseService();
    	SellHouseBean bean=new SellHouseBean();
    	bean.setSellhouse_id(108);
    	//bean.setSellhouse_address("中山");
    	System.out.println("4");
    	List<SellHouseBean> result=service.select(bean);
    	System.out.println("5");
    context.setAttribute("contextSellHouseBean",bean);
    System.out.println("6");
    }
	
}
