<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
<title>Grizzly Store</title>
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
				<i class="fa fa-bell"></i>
			</div>
			<div class="col-md-2 lead text-center">
				Welcome, Admin
				<%=session.getAttribute("userName")%></div>
			<div class="col-md-1 lead text-right">
				<a href="logout.jsp" class="btn btn-secondary rounded-circle">
					<span style="color: black">Logout</span>
				</a>
			</div>
		</div>
	</div>
	<div class="container-fluid ">
		<div class="row">
			<div class=" col-md-3">
				<div class="card profile" style="height: 90%">
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
			<div class="col-md-8">
				<div class="add-product">
					<div class="row">
						<div class="col-md-8">
							<ul class="nav nav-tabs" role="tablist">
								<li class="nav-item "><a class="nav-link active na-col"
									data-toggle="tab" href="#home">
										<p class="h2">PRODUCTS</p>
								</a></li>
								<li class="nav-item"><a class="nav-link na-col"
									data-toggle="tab" href="#vendors">
										<p class="h2">VENDORS</p>
								</a></li>
							</ul>
						</div>
					</div>
					<div class=" tab-content">
						<div id="home" class="tab-pane active">
							<br>
							<div class="row top-buffer">
								<div class="col-md-6">
									<img width="600" src="images/add-image.png" alt="product-image">
								</div>
								<div class="col-md-4">
									<form action="addProductAction.jsp" id="main-form">
										<input type="text" class="form-control" name="prod-id"
											id="prod-id" placeholder="Enter Product ID" />
										<hr>
										<input type="text" list="prod-category" class="form-control"
											name="prod-category" placeholder="Category">
										<hr>
										<datalist id="prod-category">
											<%
												try {
													String url = "jdbc:mysql://localhost:3306/grizzly";
													String user = "root";
													String password = "root";
													String sql = "SELECT category_name FROM category_table";
													Class.forName("com.mysql.jdbc.Driver");
													Connection conn = DriverManager.getConnection(url, user, password);
													Statement stmt = conn.createStatement();
													ResultSet rs = stmt.executeQuery(sql);
													while (rs.next()) {
											%>
											<option value="<%=rs.getString(1)%>">

												<%
													}
														rs.close();
														stmt.close();
														conn.close();
													} catch (Exception e) {
														out.println(e.getMessage());
													}
												%>
											
										</datalist>
										<input type="text" class="form-control" name="prod-name"
											id="prod-name" placeholder="Name" />
										<hr>
										<input type="text" class="form-control" name="prod-desc"
											id="prod-desc" placeholder="Description" />
										<hr>
										<input type="text" class="form-control" name="prod-price"
											id="prod-price" placeholder="Price" />
										<hr>
									</form>
								</div>
							</div>
							<div class="row d-flex pt-5">
								<div class="col-md-1">
									<img src="images/add-image2.png" alt="product-image2">
								</div>
								<div class="col-md-1">
									<img src="images/add-image2.png" alt="product-image2">
								</div>
								<div class="col-md-1">
									<img src="images/add-image2.png" alt="product-image2">
								</div>
								<div class="col-md-1">
									<img src="images/add-image2.png" alt="product-image2">
								</div>
							</div>
						</div>

						<div id="vendors" class="container tab-pane fade">
							<br>
							<h3>VENDORS</h3>
							<p>Yet to be designed</p>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-1">
				<div class="col d-md-flex align-items-end  h-100">
					<div class="form-group">
						<div class="row pl-4">
							<button type="submit" class="btn btn-dark rounded-circle"
								form="main-form">
								<span>&nbsp;&nbsp;Add&nbsp;&nbsp; </span>
							</button>
						</div>
						<div class="row top-buffer pl-4">
							<a href="addProductList.jsp"
								class="btn btn-secondary rounded-circle"> <span
								style="color: black">Cancel</span>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>
