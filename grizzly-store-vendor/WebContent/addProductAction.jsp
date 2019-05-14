<%@page import="com.vendor.dao.ProductDetailsDao"%>
<%@page import="com.vendor.bean.ProductDetailsBean"%>
<%@page import="org.apache.tomcat.dbcp.dbcp2.PStmtKey"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ADMIN LOGIN</title>
</head>
<body>
	<%
		try {
			ProductDetailsBean product = new ProductDetailsBean();
			ProductDetailsDao productDao = new ProductDetailsDao();
			int prodId =Integer.parseInt(request.getParameter("prod-id"));
			int price = Integer.parseInt(request.getParameter("prod-price"));
			int insertStatus;
			product.setProdId(prodId);
			product.setCategory(request.getParameter("prod-category"));
			product.setProdName(request.getParameter("prod-name"));
			product.setDescription(request.getParameter("prod-desc"));
			product.setPrice(price);
			insertStatus = productDao.insert(product);
			if(insertStatus == 1){
				response.sendRedirect("addProductList.jsp");
			} else {
				out.println("Error in adding Product. Please add again....");
				response.sendRedirect("addProduct.jsp");
			}
		} catch (Exception e) {
			out.println(e.getMessage());
		}
	%>
</body>
</html>

