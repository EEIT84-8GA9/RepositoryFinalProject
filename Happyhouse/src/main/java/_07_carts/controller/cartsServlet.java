package _07_carts.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import _01_users.model.UsersBean;
import _07_carts.model.cartsService;
import _07_carts.model.cartsrentBean;
import _07_carts.model.cartssellBean;
import _07_carts.model.dao.cartsDAO;


@WebServlet("/gousejsp.controller")
public class cartsServlet extends HttpServlet {
	private cartsService service = new cartsService();
	private static final long serialVersionUID = 1L;
       

    public cartsServlet() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//版面設定UTF-8格式
		
		request.setCharacterEncoding("UTF-8");
		
		//裝錯誤訊息用
		
		HttpSession session = request.getSession();
		

		
		Map<String, String> error = new HashMap<String, String>();
		request.setAttribute("error", error);
		
		// 接收HTML的資料
		//String user_account = request.getParameter("user_account");
		// 改接收session的使用者資料
		
		UsersBean bean1 = (UsersBean) session.getAttribute("LoginOK");
		if (bean1 != null) {
		    String user_account = bean1.getUser_account();
		
	
		
		String sell = request.getParameter("sell");
		String rent = request.getParameter("rent");
		
		// 轉換HTML的資料(不用轉換)
		
		// 驗證HTML的資料 ()
		

		
		if("這裡往出售".equals(sell)){
			if(user_account == null || user_account.trim().length() == 0){
				error.put("sell","輸入帳號不能空白");
				System.out.println("2222222222222222222222222222");
			}
		}
		
		if("這裡往出租".equals(rent)){
			if(user_account == null || user_account.trim().length() == 0){
				error.put("sell","輸入帳號不能空白");
				System.out.println("2222222222222222222222222222");
			}
		}
		
		if(error != null && !error.isEmpty()){
			request.getRequestDispatcher("/_07_carts/gousejsp.jsp").forward(request, response);
			System.out.println("3333333333333333333333333333333");
			return;
			
		}
		
		//呼叫model
		
        cartsDAO dao = new cartsDAO();
        
        cartssellBean bean = new cartssellBean();
        
        cartsrentBean beanrent = new cartsrentBean();
		
        bean.setUser_account(user_account);
        
        beanrent.setUser_account(user_account);
        
		// 根據Model執行結果顯示View
		
        if("這裡往出售".equals(sell)){
        	List<cartssellBean> result = service.select(bean);
        	System.out.println("出售的bean" + result);
        	
        	if(result.isEmpty()){
        		
        		error.put("non", "你輸入的帳號是空的,請查明後再撥");
        		request.getRequestDispatcher("/_07_carts/gousejsp.jsp").forward(request, response);
            	
        	}else{
        		request.setAttribute("sell", result);
        		System.out.println("有咧");
            	request.getRequestDispatcher("/_07_carts/spselltest.jsp").forward(request, response);
            	
        	}
          }
		if("這裡往出租".equals(rent)){
			List<cartsrentBean> result = service.select(beanrent);
			System.out.println("出租的bean" + result);
			
		if(result.isEmpty()){
			
			error.put("non", "你輸入的帳號是空的,請查明後再撥" );
			request.getRequestDispatcher("/_07_carts/gousejsp.jsp").forward(request, response);
			
		}else{
			
			request.setAttribute("rent", result);
			request.getRequestDispatcher("/_07_carts/sprenttest.jsp").forward(request, response);
			
		}
		
		}
		
		}
		
		
	}

}
