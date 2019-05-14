<%@page import="com.vendor.dao.ProductDetailsDao"%>
<%@page import="com.vendor.bean.ProductDetailsBean"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Action</title>
</head>
<body>
	<%
		try {
			int prodId = Integer.parseInt(request.getParameter("prodId"));
			ProductDetailsDao productDao = new ProductDetailsDao();
			int deleteStatus = 0;
			deleteStatus = productDao.delete(prodId);
			if(deleteStatus > 0){
				response.sendRedirect("addProductList.jsp");
			} else {
				out.println("Error in deletion of the Product records....");
			}
		} catch (Exception e) {
			out.println(e.getMessage());
		}
	%>
</body>
</html>
