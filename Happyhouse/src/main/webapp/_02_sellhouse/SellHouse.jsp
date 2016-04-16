<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form enctype="multipart/form-data" action="<c:url value="/house/house.controller"/>"method="post">
<table>
<td>sellhouse_id111</td>
<td><input type="text" name="sellhouse_id" value="${param.sellhouse_id}" ></td>
</tr>
<tr>
<td>user_account</td>
<td><input type="text" name="user_account" value="${param.user_account}" ></td>
</tr>
<tr>
<td>sellhouse_name</td>
<td><input type="text" name="sellhouse_name" value="${param.sellhouse_name}" ></td>
</tr>
<td>sellhouse_price</td>
<td><input type="text" name="sellhouse_price" value="${param.sellhouse_price}" ></td>
</tr>
<tr>
<td>sellhouse_patterns</td>
<td><input type="text" name="sellhouse_patterns" value="${param.sellhouse_patterns}" ></td>
</tr>
<tr>
<td>sellhouse_address</td>
<td><input type="text" name="sellhouse_address" value="${param.sellhouse_address}" ></td>
</tr>
<tr>
<td>sellhouse_describe</td>
<td><input type="text" name="sellhouse_describe" value="${param.sellhouse_describe}" ></td>
</tr>
<tr>
<td>sellhouse_size</td>
<td><input type="text" name="sellhouse_size" value="${param.sellhouse_size}" ></td>
</tr>
<tr>
<td>sellhouse_floor</td>
<td><input type="text" name="sellhouse_floor" value="${param.sellhouse_floor}" ></td>
</tr>
<tr>
<td>sellhouse_age</td>
<td><input type="text" name="sellhouse_age" value="${param.sellhouse_age}" ></td>
</tr>
<tr>
<td>sellhouse_type</td>
<td><input type="text" name="sellhouse_type" value="${param.sellhouse_type}" ></td>
</tr>
<tr>
<td>sellhouse_message</td>
<td><input type="text" name="sellhouse_message" value="${param.sellhouse_message}" ></td>
</tr>
<tr>
<td>sellhouse_date</td>
<td><input type="text" name="sellhouse_date" value="${param.sellhouse_date}" ></td>
</tr>
<tr>
<td>sellhouse_car</td>
<td><input type="text" name="sellhouse_car" value="${param.sellhouse_car}" ></td>
</tr>
<tr>
<td>sellhouse_phone</td>
<td><input type="text" name="sellhouse_phone" value="${param.sellhouse_phone}" ></td>
</tr>
<tr>
<td>sellhouse_email</td>
<td><input type="text" name="sellhouse_email" value="${param.sellhouse_email}" ></td>
</tr>
<tr>
<td>sellhouse_photo1</td>
<td><input type="file" name="sellhouse_photo1"></td>
</tr>
<tr>
<td>sellhouse_photo2</td>
<td><input type="file" name="sellhouse_photo2"></td>
</tr>
<tr>
<td>sellhouse_photo3</td>
<td><input type="file" name="sellhouse_photo3"></td>
</tr>
</table>
<table>
<tr>
<td><input type="submit" value="搜尋" name="prodaction"/>
<td><input type="submit" value="新增" name="prodaction"/>
<td><input type="submit" value="修改" name="prodaction"/>
<td><input type="submit" value="刪除" name="prodaction"/>
</tr>
</table>                                                                    
</form>


<c:if test="${not empty select}">
		<table>
			<thead>
				<th>user_account</th>
				<th>sellhouse_name</th>
				<th>sellhouse_price</th>
				<th>sellhouse_patterns</th>
				<th>sellhouse_address</th>
				<th>sellhouse_describe</th>
				<th>sellhouse_size</th>
				<th>sellhouse_floor</th>
				<th>sellhouse_age</th>
				<th>sellhouse_message</th>
				<th>sellhouse_date</th>
				<th>sellhouse_car</th>
				<th>sellhouse_phone</th>
				<th>sellhouse_email</th>
			</thead>
			<tbody>
				<c:forEach var="row" items="${select}">
					<c:url value="/_02_sellhouse/SellHouseSingleView.jsp" var="path" scope="page">
						<c:param name="user_account" value="${row.user_account}" />
						<c:param name="sellhouse_id" value="${row.sellhouse_id}" />
						<c:param name="sellhouse_name" value="${row.sellhouse_name}" />
						<c:param name="sellhouse_price" value="${row.sellhouse_price}" />
						<c:param name="sellhouse_patterns"
							value="${row.sellhouse_patterns}" />
						<c:param name="sellhouse_address" value="${row.sellhouse_address}" />
						<c:param name="sellhouse_describe"
							value="${row.sellhouse_describe}" />
						<c:param name="sellhouse_size" value="${row.sellhouse_size}" />
						<c:param name="sellhouse_floor" value="${row.sellhouse_floor}" />
						<c:param name="sellhouse_age" value="${row.sellhouse_age}" />
						<c:param name="sellhouse_message" value="${row.sellhouse_message}" />
						<c:param name="sellhouse_date" value="${row.sellhouse_date}" />
						<c:param name="sellhouse_car" value="${row.sellhouse_car}" />
						<c:param name="sellhouse_phone" value="${row.sellhouse_phone}" />
						<c:param name="sellhouse_email" value="${row.sellhouse_email}" />
						
					</c:url>
					<tr>
						<td>${row.user_account}</td>
						<td>${row.sellhouse_id}</td>
						<td><a href="${path}">${row.sellhouse_name}</a></td>
						<td>${row.sellhouse_price}</td>
						<td>${row.sellhouse_patterns}</td>
						<td>${row.sellhouse_address}</td>
						<td>${row.sellhouse_describe}</td>
						<td>${row.sellhouse_size}</td>
						<td>${row.sellhouse_floor}</td>
						<td>${row.sellhouse_age}</td>
						<td>${row.sellhouse_message}</td>
						<td>${row.sellhouse_date}</td>
						<td>${row.sellhouse_car}</td>
						<td>${row.sellhouse_phone}</td>
						<td>${row.sellhouse_email}</td>
						<td> <img  src="${pageContext.servletContext.contextPath}/image1?sellhouse_id=${row.sellhouse_id}" width="150px"></td>
						<td> <img  src="${pageContext.servletContext.contextPath}/image2?sellhouse_id=${row.sellhouse_id}" width="150px"></td>
						<td> <img  src="${pageContext.servletContext.contextPath}/image3?sellhouse_id=${row.sellhouse_id}" width="150px"></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:if>
	<label><a href="/Happyhouse/index.jsp">回首頁</a></label>
</body>
</html>