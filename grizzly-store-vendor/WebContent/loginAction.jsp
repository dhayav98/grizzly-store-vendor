<%@page import="com.vendor.dao.VendorDetailsDao"%>
<%@page import="com.vendor.bean.VendorUserDetailsBean"%>
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
	<%!static int status = 0;%>
	<%
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		System.out.println(status);

		VendorUserDetailsBean vendorUser = new VendorUserDetailsBean();
		VendorDetailsDao vendorDao = new VendorDetailsDao();
		vendorUser = vendorDao.loginDetails(username);
		session.setAttribute("userId", vendorUser.getUserId());
		session.setAttribute("userName", vendorUser.getUserName());
		session.setAttribute("address", vendorUser.getAddress());
		session.setAttribute("contact", vendorUser.getContact());
		session.setAttribute("userRating", vendorUser.getRating());

		if (username.equals(vendorUser.getUserName()) && password.equals(vendorUser.getPassword())
				&& vendorUser.getStatus() == 1) {
			response.sendRedirect("addProductList.jsp");
		} else if (status < 3 && vendorUser.getStatus() == 1) {
			status += 1;
			System.out.println(status + "status");
			response.sendRedirect("index.jsp");
		} else if (status >= 3) {
			int updateStatus = 0;
			updateStatus = vendorDao.checkStatus(vendorUser.getUserName());
			System.out.println("locked");
			out.println("Login exceeded three times. Your account is locked.");
		}
		if (vendorUser.getStatus() == 0) {
			out.println("Contact the Database Administrator to unlock your account....");
		}
	%>
</body>
</html>

