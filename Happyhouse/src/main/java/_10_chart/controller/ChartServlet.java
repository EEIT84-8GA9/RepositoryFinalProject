package _10_chart.controller;

import java.io.IOException;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.taglibs.standard.lang.jstl.test.Bean1;

import com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader.Array;

import _06_currentprice.model.CurrentPriceBean;
import _10_chart.model.ChartService;




@WebServlet(urlPatterns = {"/chart.controller"})

// ★ ✰ ☆ ✩ ✫ ✬ ✭ ✮ ✡
public class ChartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ChartService chartService = new ChartService();
	protected void doGet(HttpServletRequest request, HttpServletResponse res) throws ServletException, IOException {

		// 接收HTML Form資料
		String currentprice_city = request.getParameter("currentprice_city");
		String currentprice_bdtype = request.getParameter("currentprice_bdtype");
		String currentprice_transes = request.getParameter("currentprice_transes");
		String temp1 = request.getParameter("currentprice_housearea");
		String temp2 = request.getParameter("currentprice_tprice");
		String prodaction = request.getParameter("prodaction");
		// 從cpweb得到 4種!~用以比對 value 為 哪一種圖型 之後...

		// 轉換HTML Form資料
		// 轉型為需要的資料..如果insert則轉成資料庫的型式
		// 因為cpweb頁面輸入值為字串 所以需將 坪數與總價 轉換為float
		Map<String, String> error = new HashMap<String, String>();
		request.setAttribute("error", error);

		float currentprice_housearea = 0;
		if (temp1 != null && temp1.trim().length() != 0) {
			try {
				currentprice_housearea = Float.parseFloat(temp1.trim());
			} catch (NumberFormatException e) {
				e.printStackTrace();
				error.put("currentprice_housearea", "必須為數字");
			}
		}

		float currentprice_tprice = 0;
		if (temp2 != null && temp2.trim().length() != 0) {
			try {
				currentprice_tprice = Float.parseFloat(temp2.trim());
			} catch (NumberFormatException e) {
				e.printStackTrace();
				error.put("currentprice_tprice", "必須是數字");
			}
		}

		// 驗證HTML Form資料 此區為絕對必須輸入 City的圖!!! 像是Scatter Pei
		// 第一個驗證!!! 如果click的按鈕為 新刪修 則City格不可為空..若為空則導回 前頁面..但回傳剛剛輸入的值 回填~~!
		if ("Scatter".equals(prodaction) || "Pie".equals(prodaction) || "Column".equals(prodaction)) {
			if (currentprice_city == null || currentprice_city.trim().length() == 0) {
				error.put("currentprice_city", "請輸入city以便於執行" + prodaction);
			}
		}
		if("Line".equals(prodaction) || "LineLine".equals(prodaction)){
			if(currentprice_city == null || currentprice_city.trim().length() == 0 
					|| currentprice_bdtype == null || currentprice_bdtype.trim().length() == 0)
			{
				error.put("currentprice_city", "請輸入city以便於執行" + prodaction);
				error.put("currentprice_bdtype", "請輸入type以便於執行" + prodaction);
			}
		
		}
		
		if("Scattermine".equals(prodaction) || "Scattermine".equals(prodaction)){
			if(currentprice_city == null || currentprice_city.trim().length() == 0 
					|| currentprice_bdtype == null || currentprice_bdtype.trim().length() == 0
					|| currentprice_transes == null || currentprice_transes.trim().length() == 0)
			{
				error.put("currentprice_city", "請輸入city以便於執行" + prodaction);
				error.put("currentprice_bdtype", "請輸入type以便於執行" + prodaction);
				error.put("currentprice_transes", "請輸入樓層以便於執行" + prodaction);
			}
		
		}
		if (error != null && !error.isEmpty()) {
			request.getRequestDispatcher("/_06_currentprice/cpweb.jsp").forward(request,res);
			return;
		}

		// 呼叫Model
		CurrentPriceBean bean = new CurrentPriceBean();
		bean.setCurrentprice_city(currentprice_city);
		bean.setCurrentprice_bdtype(currentprice_bdtype);
		bean.setCurrentprice_transes(currentprice_transes);
		bean.setCurrentprice_housearea(currentprice_housearea);
		bean.setCurrentprice_tprice(currentprice_tprice);

		
		// 根據Model執行結果顯示View
		// 4種比對!! prodaction 為SELECT的話 使用productService.select 方法
		//request.setAttribute("Scatter", result);   "Scatter" 作為EL 標千~ 可以在JSP中用EL呼叫值
		if ("Scatter".equals(prodaction)) {
			List<CurrentPriceBean> result = chartService.select(bean);
			
			request.setAttribute("Scatter", result);
			request.getRequestDispatcher("/_10_chart/chart.jsp").forward(request,res);
		} else if (prodaction != null && prodaction.equals("Pie")) {
			List<CurrentPriceBean> result1 = chartService.select_pei_by_three_type(bean);
			List<CurrentPriceBean> result2 = chartService.select_pei_by_three_area(bean);
			List<CurrentPriceBean> result3 = chartService.select_pei_by_three_transes(bean);
			if (result1 == null) {
				error.put("action", "xxxx fail");
			} else {
				request.setAttribute("Pie1", result1);
				request.setAttribute("Pie2", result2);
				request.setAttribute("Pie3", result3);
				System.out.println(result3);
							
							
			}
			request.getRequestDispatcher("/_10_chart/pie.jsp").forward(request,res);
		
		}else if (prodaction != null && prodaction.equals("Column")) {
			List<CurrentPriceBean> result = chartService.select_avg_type(bean);
			if (result == null) {
				error.put("action", "xxxx fail");
			} else {
				request.setAttribute("Column", result);
			}
			request.getRequestDispatcher("/_10_chart/column.jsp").forward(request,res);
		}else if (prodaction != null && prodaction.equals("Line")) {
			List<CurrentPriceBean> result = chartService.select_avg_month(bean);
			if (result == null) {
				error.put("action", "xxxx fail");
			} else {
				request.setAttribute("Line", result);
			}
			request.getRequestDispatcher("/_10_chart/line.jsp").forward(request,res);
		}else if (prodaction != null && prodaction.equals("LineLine")) {
			List<CurrentPriceBean> result = chartService.select_avg_month(bean);
			if (result == null) {
				error.put("action", "xxxx fail");
			} else {
				request.setAttribute("LineLine", result);
			}
			request.getRequestDispatcher("/_10_chart/lineline.jsp").forward(request,res);
		}else if (prodaction != null && prodaction.equals("Scattermine")) {
			List<CurrentPriceBean> result = chartService.select_oneprice_area_by_three(bean);
			if (result == null) {
				error.put("action", "xxxx fail");
			} else {
				request.setAttribute("Scattermine", result);
			}
			request.getRequestDispatcher("/_10_chart/scattermine.jsp").forward(request,res);
		}else {
			error.put("action", "Unknown Action:" + prodaction);
			request.getRequestDispatcher("/_06_currentprice/cpweb.jsp").forward(request, res);
		}
	}

// chart部份!!!!!!★ ★ ★ ★  可見 新莊原始檔
//	ArrayList<CurrentPriceBean> array = new ArrayList<CurrentPriceBean>();
//
//	CurrentPriceBean bean = new CurrentPriceBean();
//
//	bean.setCurrentprice_housearea(10);bean.setCurrentprice_tprice(100000000);array.add(bean);
//
//	CurrentPriceBean bean2 = new CurrentPriceBean();bean2.setCurrentprice_housearea(20);bean2.setCurrentprice_tprice(1500000000);array.add(bean2);
//
//	CurrentPriceBean bean3 = new CurrentPriceBean();bean3.setCurrentprice_housearea(50);bean3.setCurrentprice_tprice(2000000000);array.add(bean3);
//
//	request.setAttribute("pics",array);
//
//	request.getRequestDispatcher("/chart/chart.jsp").forward(request,res);
//	}

	protected void doPost(HttpServletRequest request, HttpServletResponse res) throws ServletException, IOException {

	}

}
