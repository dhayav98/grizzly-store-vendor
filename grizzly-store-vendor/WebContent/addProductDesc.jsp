<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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
				<i class="fas fa-bell"></i>
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
	<div class="container-fluid">
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
			<div class="col">
				<div class="add-product">
					<div class="row">
						<div class="col-md-8">
							<ul class="nav nav-tabs" role="tablist">
								<li class="nav-item"><a class="nav-link active na-col"
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
					<div class="container-fluid">
						<div class="tab-content ">
							<div id="home" class="tab-pane active">
								<br>
								<div class="row top-buffer h2">
									<div class="mx-3">
										<p>									
											<%=request.getParameter("prodName")%>
											<span class="h5">by <%=request.getParameter("prodBrand")%>
											</span><span class=""><i class="fas fa-pen-square h5 pl-3"></i></span>
										</p>
										<div class=" h6" style="color: #979797">
											<i class="fa fa-star"><%= request.getParameter("prodRating") %></i>
										</div>
									</div>
								</div>
								<div class="row  top-buffer">
									<div class="col-md-6">
										<div id="carouselExampleControls" class="carousel slide"
											data-ride="carousel">
											<div class="carousel-inner">
												<div class="carousel-item active">
													<img class="d-block h-100 w-100" src="images/dummy.png"
														alt="First slide">
												</div>
												<div class="carousel-item">
													<img class="d-block h-100 w-100" src="images/dummy2.png"
														alt="Second slide">
												</div>
												<div class="carousel-item">
													<img class="d-block h-100 w-100" src="images/dummy3.png"
														alt="Third slide">
												</div>
											</div>
											<a class="carousel-control-prev"
												href="#carouselExampleControls" role="button"
												data-slide="prev"> <span
												class="carousel-control-prev-icon" aria-hidden="true"></span>
												<span class="sr-only">Previous</span>
											</a> <a class="carousel-control-next"
												href="#carouselExampleControls" role="button"
												data-slide="next"> <span
												class="carousel-control-next-icon" aria-hidden="true"></span>
												<span class="sr-only">Next</span>
											</a>
										</div>
									</div>
									<div
										class="col-md-4  d-flex flex-column justify-content-between">
										<div class="row">
											<div class="h5">
												Product Description <i class="fas fa-pen-square h5 pl-2"></i>
											</div>
											<p><%=request.getParameter("prodDesc")%></p>
										</div>
										<div class="row ">
											<span class="h3">Rs. <%=request.getParameter("prodPrice")%>/-
												<span class="h6"><%=request.getParameter("prodOffer") %>%<i
													class="fas fa-pen-square h5 pl-2"></i></span></span>
										</div>
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
			</div>
			<div class="col-sm-1">
				<div class="col d-md-flex align-items-end  h-100">
					<form action="addProductList.jsp" class="form-group">
						<div class="row">
							<button type="submit"
								class="btn btn-dark rounded-circle right-buffer">
								<span>&nbsp;Finish&nbsp;</span>
							</button>
						</div>
						<div class="row top-buffer">
							<button type="clear"
								class="btn btn-secondary rounded-circle right-buffer">
								<span style="color: black">Cancel</span>
							</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>

</html>
