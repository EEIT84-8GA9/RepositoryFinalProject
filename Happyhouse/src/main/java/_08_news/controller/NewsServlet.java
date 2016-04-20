package _08_news.controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import javax.servlet.http.Part;

import _02_sellhouse.model.SellHouseBean;
import _05_sms.model.SmsVO;
import _05_sms.model.sms_service;
import _08_news.model.NewsService;
import _08_news.model.newsBean;
import _08_news.model.dao.newDAO;


@MultipartConfig(location = "", fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 500, maxRequestSize = 1024 * 1024 * 500 * 5)
@WebServlet(urlPatterns = { "/test.controller" })
public class NewsServlet extends HttpServlet {
	private sms_service servicelogin = new sms_service();
	private NewsService service = new NewsService();
	private static final long serialVersionUID = 1L;

	public NewsServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		doPost(request, response);

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		Map<String, String> error = new HashMap<String, String>();
		request.setAttribute("error", error);


		// 接收HTML的資料

		String temp3 = request.getParameter("id");
		String temp1 = request.getParameter("title");
		String temp2 = request.getParameter("content");

		String newsupdate = request.getParameter("newsupdate");

		System.out.println(temp1);
		System.out.println(temp2);
		System.out.println(temp3);
		System.out.println(newsupdate);
		
		//圖片上傳
				long sizeInBytes1 = 0;
				long sizeInBytes2 = 0;
				long sizeInBytes3 = 0;
				String fldName1 = "";
				String fldName2 = "";
				String fldName3 = "";
				String value1 = "";
				String value2 = "";
				String value3 = "";
				String memberID = "";
				String fileName1 = "";
				InputStream is1 = null;
				String fileName2 = "";
				InputStream is2 = null;
				String fileName3 = "";
				InputStream is3 = null;
				//接收圖片資料
			Collection<Part> parts = request.getParts() ;
			
		// 轉換HTML的資料

		int id = 0;
		if (temp3 != null && temp3.trim().length() != 0) {

			try {
				id = Integer.parseInt(temp3.trim());
			} catch (NumberFormatException e) {
				error.put("id", "編號必須要是整數數字才行喔");
				 request.getRequestDispatcher("/_08_news/test.jsp").forward(request,
				 response);
			}
		}

		// 驗證HTML的資料

		if ("Insert".equals(newsupdate)) {
			if (temp1 == null || temp1.trim().length() == 0) {
				error.put("title", "標題或是內容不能空白,請確定後再輸入" + newsupdate);
			}
		}

		if ("更新首頁資訊".equals(newsupdate) || "Delete".equals(newsupdate)) {
			if (temp3 == null || temp3.trim().length() == 0) {
				error.put("updateid", "編號不能空白,請先輸入編號" + newsupdate);
			}
		}

		if (error != null && !error.isEmpty()) {
			request.getRequestDispatcher("/_08_news/test.jsp")
					.forward(request, response);
			return;
		}

		// 呼叫model

		newDAO dao = new newDAO();

		newsBean bean = new newsBean();

		bean.setNew_id(id);
		bean.setNew_title(temp1);
		bean.setNew_describe(temp2);

//		圖片上傳
		if (parts != null) {
			for (Part p : parts) {
				if (p.getContentType() == null) {
					if (fldName1.equals("text")) {
						//memberID = value1;
					}
				} else {
					if (is1 == null) {
						is1 = p.getInputStream();
						sizeInBytes1 = p.getSize();
						fileName1 = NewsService.getFileName(p); // 此為圖片檔的檔名
						fileName1 = NewsService.adjustFileName(fileName1,
								NewsService.IMAGE_FILENAME_LENGTH);
					} else if (is2 == null && is1 != null) {
						is2 = p.getInputStream();
						sizeInBytes2 = p.getSize();
						fileName2 = NewsService.getFileName(p); // 此為圖片檔的檔名
						fileName2 = NewsService.adjustFileName(fileName2,
								NewsService.IMAGE_FILENAME_LENGTH);
					} else if (is3 == null && is1 != null && is2 != null) {
						is3 = p.getInputStream();
						sizeInBytes3 = p.getSize();
						fileName3 = NewsService.getFileName(p); // 此為圖片檔的檔名
						fileName3 = NewsService.adjustFileName(fileName3,
								NewsService.IMAGE_FILENAME_LENGTH);
					}
					if (fileName1 !=null && fileName1.trim().length() > 0) {
						bean.setNew_photo1_name(fileName1);
						bean.setNew_photo2_name(fileName2);
						bean.setNew_photo3_name(fileName3);
						System.out.println("fileName1=" + fileName1
								+ "sizeInBytes1=" + sizeInBytes1);
						System.out.println("fileName2=" + fileName2
								+ "sizeInBytes2=" + sizeInBytes2);
						//dao.insert(bean,is1,sizeInBytes1,is2,sizeInBytes2,is3,sizeInBytes3);
					}
					
				}
				
			}
		
		}

		// 根據Model執行姐果顯示View

		if ("看目前的首頁資訊".equals(newsupdate)) {
			List<newsBean> result = service.select(bean);
			System.out.println(result);
			newsBean datebean = new newsBean();

//			datebean = dao.select(temp1);
//			System.out.println(datebean);
//			Date b = datebean.getNew_date();
//			bean.setNew_date(b);

			request.setAttribute("select", result);
			request.getRequestDispatcher("/_08_news/selectpage.jsp").forward(request,
					response);
		} else if

		("Insert".equals(newsupdate)) {

			newsBean result = service.insert(bean);

			newsBean datebean = new newsBean();

			datebean = dao.select(temp1);

			Integer a = datebean.getNew_id();
			Date b = datebean.getNew_date();

			bean.setNew_date(b);
			bean.setNew_id(a);


			
			
			
			request.setAttribute("insert", result);
			System.out.println(result);
			request.getRequestDispatcher("/_08_news/test.jsp")
					.forward(request, response);
		} else if

		(newsupdate != null && newsupdate.equals("更新首頁資訊")) {

			newsBean result = service.update(bean, is1, sizeInBytes1, is2, sizeInBytes2, is3, sizeInBytes3);
			newsBean datebean = new newsBean();
			datebean = dao.select(temp1);
			Date b = datebean.getNew_date();
			bean.setNew_date(b);

			request.setAttribute("update", result);
			System.out.println(result);
//			session.setAttribute("update", result);
			request.getRequestDispatcher("/_08_news/test.jsp")
					.forward(request, response);
//			response.sendRedirect("/_08_news/test.jsp");
		} else if (newsupdate != null && newsupdate.equals("Delete")) {
			boolean result = service.delete(bean);
			if (!result) {
				request.setAttribute("delete", 0);
			} else {
				request.setAttribute("delete", 1);
			}
			request.getRequestDispatcher("/_08_news/test.jsp")
					.forward(request, response);

		}

	}

}
