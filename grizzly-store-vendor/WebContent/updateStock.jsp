<%@page import="com.vendor.bean.Display2Bean"%>
<%@page import="com.vendor.dao.ProductDetailsDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%
	if (session.getAttribute("userName") == null) {
		response.sendRedirect("index.jsp");
	}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Vendor Stock Details</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="styles/main.css">
<link rel="stylesheet" href="styles/bootstrap.css">
<script src="scripts/main.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">
<script src="scripts/bootstrap.js"></script>
</head>
<body>
	<div class="container-fluid n">
		<div class="row align-items-center" style="padding: 20px;">
			<div class="col-md-2">
				<span class="nav-brand" style="font-size: 20px;">GRIZZLY<img
					src="images/logo-nav.png" width="50px" height="50px" />STORE
				</span>
			</div>
			<div class="col-md-2 lead">
				<div class="searchContainer rounded-circle search-box">
					<input class="searchBox" type="search" name="search"
						placeholder="Search"> <i class="fa fa-search searchIcon"></i>
				</div>
			</div>
			<div class="col-md-4"></div>
			<div class="col-md-1 lead text-right">
				<i class="fas fa-bell"></i>
			</div>
			<div class="col-md-2 lead text-center">
				Welcome, Admin
				<%=session.getAttribute("userName")%></div>
			<div class="col-md-1 lead text-right">
				<a href="logout.jsp" class="btn btn-secondary rounded-circle"> <span
					style="color: black">Logout</span>
				</a>
			</div>
		</div>
	</div>
	<div class="container-fluid ">
		<div class="row">
			<div class=" col-md-3">
				<div class="card profile h-100" style="height: 88%">
					<div
						class="align-items-center d-md-flex card-title justify-content-between">
						<div class="card-title h5 p-2">PROFILE</div>
						<div>
							<h5 class="pr-2">Edit</h5>
						</div>
					</div>
					<div class="w-75 mx-auto">
						<img class="card-img-top" src="images/human.png"
							alt="Card image cap">
					</div>
					<div class="card-body">
						<p class="card-text profile-text">
							<span class="h4"><%=session.getAttribute("userName")%></span> </br> <span
								class="h6" style="color: #979797"><i class="fa fa-star">
									<%=session.getAttribute("userRating")%></i></span> </br> <strong>Contact</strong>
							</br>
							<%=session.getAttribute("contact")%>
							</br> <strong>Address</strong> </br> <span class="text-justify"><%=session.getAttribute("address")%></span>
							</br>
							<button class="btn btn-secondary btn-lg mt-2 rounded-circle"
								disabled>Contact Grizzly</button>
					</div>
				</div>
			</div>
			<%
				try {
					Display2Bean display2 = new Display2Bean();
					ProductDetailsDao productDao = new ProductDetailsDao();
					int prodId = Integer.parseInt(request.getParameter("prodId"));
					display2 = productDao.readdisplay2(prodId);
			%>

			<div class="col col-offset-3 row">
				<header class="text-center h3">Update Stock Details</header>
				<div class="">
					<form action="updateStockAction.jsp" method="post">
						<table class="table table-hover">
							<tr>
								<td>Product Name</td>
								<td><input type="text" value="<%=display2.getProdName()%>"
									readonly="readonly"></td>
							</tr>
							<tr>
								<td>Product Id</td>
								<td><input type="text" value="<%=display2.getProdId()%>"
									readonly="readonly" name="prodId"></td>
							</tr>
							<tr>
								<td>In Stock*</td>
								<td><input type="text" name="updateInStock"
									value="<%=display2.getInStock()%>"></td>
							</tr>
							<tr>
								<td>Buffer*</td>
								<td><input type="text" name="updateBuffer"
									value="<%=display2.getBuffer()%>"></td>
							</tr>
							<tr>
								<td>Item/Product Price</td>
								<td><input type="text" value="<%=display2.getPrice()%>"
									readonly="readonly"></td>
							</tr>
							<tr>
								<td>Offer*</td>
								<td><input type="text" name="updateOffer"
									value="<%=display2.getOffer()%>"></td>
							</tr>
							<tr>
								<td>Rating*</td>
								<td><input type="text" name="updateRating"
									value="<%=display2.getRating()%>"></td>
							</tr>
							<tr>
								<td class="text-center"><input class="btn btn-secondary btn-lg rounded-circle"
									type="submit" value="Submit"></td>
								<td class="text-center"><a href="addProductList.jsp#inventory"
									class="btn btn-secondary btn-lg rounded-circle">Cancel</a></td>
							</tr>
						</table>
					</form>
				</div>
				<%
					} catch (Exception e) {
						out.println(e.getMessage());
					}
				%>
			</div>
		</div>
	</div>
</body>
</html>
