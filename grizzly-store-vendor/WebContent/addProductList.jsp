<%@page import="com.vendor.bean.Display2Bean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.vendor.bean.DisplayBean"%>
<%@page import="java.util.List"%>
<%@page import="com.vendor.dao.ProductDetailsDao"%>
<%@page import="com.vendor.bean.ProductDetailsBean"%>
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
<style>
</style>
</head>

<body>
	<div class="container-fluid n">
		<div class="row align-items-center" style="padding: 20px;">
			<div class="col-sm-2">
				<span class="nav-brand" style="font-size: 20px;">GRIZZLY<img
					src="images/logo-nav.png" width="50px" height="50px" />STORE
				</span>
			</div>
			<div class="col-sm-2 lead">
				<div class="searchContainer rounded-circle search-box">
					<input class="searchBox" type="search" name="search"
						placeholder="Search"> <i class="fa fa-search searchIcon"></i>
				</div>
			</div>
			<div class="col-sm-4"></div>
			<div class="col-sm-1 lead text-right">
				<i class="fas fa-bell"></i>
			</div>
			<div class="col-sm-2 lead text-center">
				Welcome, Admin
				<%=session.getAttribute("userName")%></div>
			<div class="col-sm-1 lead text-right">
				<a href="logout.jsp" class="btn btn-secondary rounded-circle">
					<span style="color: black">Logout</span>
				</a>
			</div>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row">
			<div class=" col-sm-3">
				<div class="card profile h-100">
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
						<div class="col-sm-8">
							<ul class="nav nav-tabs" role="tablist">
								<li class="nav-item "><a class="nav-link active na-col"
									data-toggle="tab" href="#home">
										<p class="h2">PRODUCTS</p>
								</a></li>
								<li class="nav-item"><a class="nav-link na-col"
									data-toggle="tab" href="#inventory">
										<p class="h2">INVENTORY</p>
								</a></li>
							</ul>
						</div>
					</div>
					<div class="tab-content">
						<div id="home" class="tab-pane active">
							</br>
							<div
								class=" top-buffer d-flex flex-row align-items-center justify-content-between">
								<div class="d-flex">
									<div class="rounded-circle1 mr-4">
										<span class="myarrow"><input type="text" list="choose"
											class="rounded-circle1" name="choose"
											placeholder="Choose Action"></span>
										<datalist id="choose">
											<option value="...">
											<option value="...">
										</datalist>
									</div>
									<div class="rounded-circle1 mr-4">
										<input type="search" placeholder="Product Name/ID..."
											class="rounded-circle1 pt-2"><i
											class="fa fa-search searchIcon"></i>
									</div>
									<div class="rounded-circle1 mr-4">
										<span class="myarrow"><input type="text" list="sortby"
											class="rounded-circle1" name="sortby" placeholder="Sort By"></span>
										<datalist id="sortby">
											<option value="Ascending">
											<option value="Descending">
										</datalist>
									</div>
								</div>
								<div>
									<form action="addProduct.jsp">
										<button class="btn btn-dark rounded-circle btn-lg">Add
											Product</button>
									</form>
								</div>
							</div>
							<div class="row pt-5">
								<div class="col">
									<div class="table-wrapper-scroll-y">
										<table class="table h4 w-100 h-100">
											<thead>
												<tr>
													<th class="no-border-checkb no-border"
														style="border-bottom: transparent"></th>
													<th class="text-center">Products List</th>
													<th class="text-center">ID</th>
													<th class="text-center">Brand</th>
													<th class="text-center">Category</th>
													<th class="text-center">Rating</th>
													<th class="text-center"></th>
												</tr>
											</thead>
											<tbody>
												<div>
													<%
														try {
															List<DisplayBean> displayList = new ArrayList<DisplayBean>();
															ProductDetailsBean product = new ProductDetailsBean();
															ProductDetailsDao productDao = new ProductDetailsDao();
															displayList = productDao.readAll();
															for (DisplayBean b : displayList) {
													%>
													<form action="addProductDesc.jsp" method="post">
													<tr>
														<td class="no-border-checkb"><div class="round">
																<input type="checkbox" id="1" /> <label for="1"></label>
															</div></td>
														<td><%=b.getProdName()%></td>
														<td><%=b.getProdId()%></td>
														<td><%=b.getBrandName()%></td>
														<td><%=b.getCategory()%></td>
														<td class="text-center"><%=b.getRating()%> <input
															type="hidden" name="prodName"
															value="<%=b.getProdName()%>"> <input
															type="hidden" name="prodBrand"
															value="<%=b.getBrandName()%>"> <input
															type="hidden" name="prodDesc"
															value="<%=b.getDescription()%>"> <input
															type="hidden" name="prodPrice" value="<%=b.getPrice()%>">
															<input type="hidden" name="prodOffer"
															value="<%=b.getOffer()%>"> <input type="hidden"
															name="prodRating" value="<%=b.getRating()%>"></td>
														<td class="text-center">
															<button
																class="btn btn-secondary btn-lg rounded-circle  col-md-5">View</button>
															<a href="deleteAction.jsp?prodId=<%=b.getProdId()%>"
															class="btn btn-secondary btn-lg rounded-circle  col-md-5">Remove</a>
														</td>
													</tr>
													</form>
													<%
														}
														} catch (Exception e) {
															out.println(e.getMessage());
														}
													%>
												</div>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
						<div id="inventory" class="container tab-pane fade">
							</br>
							<div
								class=" top-buffer d-flex flex-row align-items-center justify-content-between">
								<div class="d-flex">
									<div class="rounded-circle1 mr-4">
										<span class="myarrow"><input type="text" list="choose"
											class="rounded-circle1" name="choose"
											placeholder="Choose Action"></span>
										<datalist id="choose">
											<option value="...">
											<option value="...">
										</datalist>
									</div>
									<div class="rounded-circle1 mr-4">
										<input type="search" placeholder="Product Name/ID..."
											class="rounded-circle1 pt-2"><i
											class="fa fa-search searchIcon"></i>
									</div>
									<div class="rounded-circle1 mr-4">
										<span class="myarrow"><input type="text" list="sortby"
											class="rounded-circle1" name="sortby" placeholder="Sort By"></span>
										<datalist id="sortby">
											<option value="Ascending">
											<option value="Descending">
										</datalist>
									</div>
								</div>
								<div>
									<form action="#">
										<button class="btn btn-dark rounded-circle btn-lg">Add
											Product</button>
									</form>
								</div>
							</div>
							<div class="row pt-5">
								<div class="col">
									<div class="table-wrapper-scroll-y">
										<table class="table h4 w-100 h-100">
											<thead>
												<tr>
													<th class="no-border-checkb no-border"
														style="border-bottom: transparent"></th>
													<th class="text-center">Products List</th>
													<th class="text-center">ID</th>
													<th class="text-center">In Stock</th>
													<th class="text-center">Req.</th>
													<th class="text-center">Buffer</th>
													<th class="text-center">Price/Item</th>
													<th class="text-center">Pending</th>
													<th class="text-center">Rating</th>
													<th class="text-center"></th>
												</tr>
											</thead>
											<tbody>
												<%
													try {
														List<Display2Bean> displayList = new ArrayList<Display2Bean>();
														ProductDetailsBean product = new ProductDetailsBean();
														ProductDetailsDao productDao1 = new ProductDetailsDao();
														displayList = productDao1.read2All();
														for (Display2Bean b1 : displayList) {
												%>
												<tr>
													<td class="no-border-checkb"><div class="round">
															<input type="checkbox" id="7" /> <label for="7"></label>
														</div></td>
													<td><%=b1.getProdName()%></td>
													<td><%=b1.getProdId()%></td>
													<td class="text-center"><%=b1.getInStock()%></td>
													<td class="text-center"><%=b1.getReq()%></td>
													<td class="text-center"><%=b1.getBuffer()%></td>
													<td class="text-center"><%=b1.getPrice()%></td>
													<td class="text-center">0</td>
													<td class="text-center"><%=b1.getRating()%></td>
													<td class="text-center"><a
														href="updateStock.jsp?prodId=<%=b1.getProdId()%>"
														class="btn btn-secondary btn-lg rounded-circle col">Manage</a>
													</td>
												</tr>
												<%
													}
													} catch (Exception e) {
														out.println(e.getMessage());
													}
												%>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
