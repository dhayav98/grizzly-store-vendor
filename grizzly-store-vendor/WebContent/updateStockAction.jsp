<%@page import="com.vendor.dao.ProductDetailsDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%
if(session.getAttribute("userName") == null){
	response.sendRedirect("index.jsp");
}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Stock</title>
</head>
<body>
	<%
		try {
			ProductDetailsDao productDao = new ProductDetailsDao();
			int prodId = Integer.parseInt(request.getParameter("prodId"));
			int inStock = Integer.parseInt(request.getParameter("updateInStock"));
			int buffer = Integer.parseInt(request.getParameter("updateBuffer"));
			float offer = Float.parseFloat(request.getParameter("updateOffer"));
			float rating = Float.parseFloat(request.getParameter("updateRating"));
			int updateStatus = 0;
			updateStatus = productDao.updateStock(prodId, inStock, buffer, offer, rating);
			if( updateStatus == 1){
				response.sendRedirect("addProductList.jsp#inventory");
			} else {
				response.sendRedirect("updateStock.jsp");
			}
		} catch (Exception e) {
			out.println(e.getMessage());
		}
	%>
</body>
</html>