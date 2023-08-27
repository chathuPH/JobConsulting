<!DOCTYPE html>
<html lang="en">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
	<% if (session.getAttribute("email")==null) { response.sendRedirect("login.jsp"); } %>

		<head>
			<meta charset="utf-8">
			<meta content="width=device-width, initial-scale=1.0" name="viewport">

			<title>Home Page - Job Consulting</title>
			<meta content="" name="description">
			<meta content="" name="keywords">

			<!-- Favicons -->
			<link href="assets/img/favicon.png" rel="icon">
			<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

			<!-- Google Fonts -->
			<link
				href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
				rel="stylesheet">

			<!-- Vendor CSS Files -->
			<link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">
			<link href="assets/vendor/aos/aos.css" rel="stylesheet">
			<link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
			<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
			<link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
			<link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
			<link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
			<link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

			<link href="assets/css/style.css" rel="stylesheet">
		</head>

		<body>

			<!-- ======= Header ======= -->
			<header id="header" class="fixed-top">
				<div class="container d-flex align-items-center justify-content-between">

					<h1 class="logo"><a href="index.html">Job Consulting</a></h1>
					<nav id="navbar" class="navbar">
						<ul>
							<!-- 
								<li><a class="nav-link scrollto active" href="#hero">Home</a></li>
							 -->
							<li style="margin-left:10px;">
								<%=session.getAttribute("name")%></span>
							</li>
							<li onClick="Logout()"><a class="getstarted scrollto" href="logout">Logout</a></li>
						</ul>
						<i class="bi bi-list mobile-nav-toggle"></i>
					</nav><!-- .navbar -->

				</div>
			</header><!-- End Header -->

			<main id="main">
			
				<!-- Normal User Area -->
				<div id="normalUser" style="display:none; min-height:580px">
					<section id="about" class="about mt-5">
						<div class="container" data-aos="fade-up">

							<div class="row content">
								<div class="col-lg-6">

								</div>
								<div class="col-lg-6 pt-4 pt-lg-0">
									<form>
										<div class="form-group row">
											<div class="col-sm-6 mb-2">
												<label class="mb-2">Job Type</label>
												<select class="form-control" id="exampleFormControlSelect1">
													<option>Job Type</option>
													<option>Software Engineer</option>
													<option>Doctor</option>
													<option>Teacher</option>
												</select>
											</div>
											<div class="col-sm-6 mb-2">
												<label class="mb-2">Consultant</label>
												<select class="form-control" id="exampleFormControlSelect1">
													<option>Consultant</option>
													<option>Bob Harizon</option>
													<option>John Smith</option>
												</select>
											</div>

											
											
											<div class="col-sm-6 mb-2">
												<label class="mb-2">Date</label>
												<input type="date" name="" id="" class="form-control" />
											</div>
											<div class="col-sm-6 mb-2">
												<label class="mb-2">Time</label>
												<input type="time" name="" id="" class="form-control" />
											</div>

											<div class="col-sm-6 mb-2">
												<button type="clear"
													class="btn btn-danger mb-2 col-sm-12">Clear</button>
											</div>

											<div class="col-sm-6 mb-2">
												<button type="submit" class="btn btn-primary col-sm-12 mb-2">Book
													Appointment</button>
											</div>
										</div>

									</form>
								</div>
							</div>

						</div>
					</section>

					<section id="counts" class="counts">
						<div class="container" data-aos="fade-up">
							<div class="section-title">
								<h2>Consultant</h2>
								<p>Appointment List</p>
							</div>
							<div class="row no-gutters">

								<div class="col-lg-12 col-md-6 d-md-flex align-items-md-stretch">
									<table class="table table-hover">
										<thead>
											<tr>
												<th scope="col">#</th>
												<th scope="col">Job Type</th>
												<th scope="col">Consultant</th>
												<th scope="col">Date</th>
												<th scope="col">Time</th>
												<th scope="col">Action</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th scope="row">1</th>
												<td>Software Engineer</td>
												<td>Bob Harizon</td>
												<td>29/08/2023</td>
												<td>8.30 PM</td>
												<td>
													<button type="button" class="btn btn-outline-danger"><i
															class="ri-delete-bin-line"></i></button>
												</td>
											</tr>
											<tr>
												<th scope="row">2</th>
												<td>Software Engineer</td>
												<td>John Smith</td>
												<td>30/08/2023</td>
												<td>8.30 PM</td>
												<td>
													<button type="button" class="btn btn-outline-danger"><i
															class="ri-delete-bin-line"></i></button>
												</td>
											</tr>

										</tbody>
									</table>
								</div>


							</div>

						</div>
					</section>

				</div>

				<!-- Consultant User Area -->
				<div id="ConsultUser" style="display:none; min-height:580px">
					<section id="about" class="about mt-5">
						<div class="container" data-aos="fade-up">
							<div class="row content">
								<div class="col-lg-6">
									<form>
										<div class="form-group row">
											<div class="col-sm-6 mb-2">
											<label class="mb-2">Date</label>
												<input type="date" name="" id="" class="form-control" />
											</div>
											<div class="col-sm-6 mb-2">
											<label class="mb-2">Time</label>
												<input type="time" name="" id="" class="form-control" />
											</div>

											<div class="col-sm-12 mb-2">
												<label class="mb-2">Job Type</label>
												<select class="form-control" id="exampleFormControlSelect1">
													<option>Job Type</option>
													<option>Software Engineer</option>
													<option>Doctor</option>
													<option>Teacher</option>
												</select>
											</div>

											<div class="col-sm-6 mb-2">
												<button type="clear"
													class="btn btn-danger mb-2 col-sm-12">Clear</button>
											</div>

											<div class="col-sm-6 mb-2">
												<button type="submit" class="btn btn-primary col-sm-12 mb-2">Set
													Available Time</button>
											</div>
										</div>

									</form>
								</div>
								<div class="col-lg-6 pt-4 pt-lg-0">
								
									<div class="section-title">
										<h2>Consultant</h2>
										<p>Available Time</p>
									</div>
									<table class="table table-hover">
										<thead>
											<tr>
												<th scope="col">#</th>
												<th scope="col">Job Type</th>
												<th scope="col">Date</th>
												<th scope="col">Time</th>
												<th scope="col">Action</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th scope="row">1</th>
												<td>Software Engineering</td>
												<td>28/08/2023</td>
												<td>8.30 PM</td>
												<td>
													<button type="button" class="btn btn-outline-danger"><i
															class="ri-delete-bin-line"></i></button>
												</td>
											</tr>
											<tr>
												<th scope="row">2</th>
												<td>Doctor</td>
												<td>28/08/2023</td>
												<td>10.30 PM</td>
												<td>
													<button type="button" class="btn btn-outline-danger"><i
															class="ri-delete-bin-line"></i></button>
												</td>
											</tr>

										</tbody>
									</table>
								</div>
							</div>

						</div>
					</section>

					<section id="counts" class="counts">
						<div class="container" data-aos="fade-up">
							<div class="section-title">
								<h2>Consultant</h2>
								<p>Appointment List</p>
							</div>
							<div class="row no-gutters">

								<div class="col-lg-12 col-md-6 d-md-flex align-items-md-stretch">
									<table class="table table-hover">
										<thead>
											<tr>
												<th scope="col">#</th>
												<th scope="col">Name</th>
												<th scope="col">Job Type</th>
												<th scope="col">Date</th>
												<th scope="col">Time</th>
												<th scope="col">Action</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th scope="row">1</th>
												<td>Asanka</td>
												<td>Software Engineering</td>
												<td>28/08/2023</td>
												<td>8.30 PM</td>
												<td>
													<button type="button" class="btn btn-outline-danger"><i
															class="ri-delete-bin-line"></i></button>
												</td>
											</tr>
											<tr>
												<th scope="row">2</th>
												<td>Smith</td>
												<td>Doctor</td>
												<td>28/08/2023</td>
												<td>10.30 PM</td>
												<td>
													<button type="button" class="btn btn-outline-danger"><i
															class="ri-delete-bin-line"></i></button>
												</td>
											</tr>

										</tbody>
									</table>
								</div>


							</div>

						</div>
					</section>
				</div>
				
				<!-- Admin User Area -->
				<div id="adminUser" style="display:none; min-height:580px">

				</div>

			</main><!-- End #main -->

			<!-- ======= Footer ======= -->
			<footer id="footer" class="mt-5">
				<div class="container">
					<div class="copyright">
						&copy; Copyright <strong><span>Job Consulting</span></strong>. All Rights Reserved
					</div>

					<!-- 
      
      	<div class="credits">
       Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
      </div>
       -->

				</div>
			</footer>
			<!-- End Footer -->

			<div id="preloader"></div>
			<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
					class="bi bi-arrow-up-short"></i></a>

			<!-- Vendor JS Files -->
			<script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
			<script src="assets/vendor/aos/aos.js"></script>
			<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
			<script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
			<script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
			<script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
			<script src="assets/vendor/php-email-form/validate.js"></script>

			<!-- Template Main JS File -->
			<script src="assets/js/main.js"></script>
			<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
			<link rel="stylesheet" href="alert/dist/sweetalert.css">
			<script>
				var status = '<%=session.getAttribute("status")%>';
				var massage = '<%=session.getAttribute("massage")%>';
				const value = sessionStorage.getItem('indexKey');

				if (status != null && status == "false" && value == null) {
					swal("Error!", massage, "error");
					sessionStorage.setItem('indexKey', 1);
				} else if (status != null && status == "true" && value == null) {
					swal("Success!", massage, "success");
					sessionStorage.setItem('indexKey', 1);
				}


				function Logout() {
					sessionStorage.clear();
				}

				LoadUserDiv();

				function LoadUserDiv() {

					if (status != null && status == "true") {
						const logedUserType = "<%=session.getAttribute("userType") %>";

						var normal = document.getElementById("normalUser");
						var admin = document.getElementById("adminUser");
						var consult = document.getElementById("ConsultUser");

						if (logedUserType == "Normal User") {
							normal.style.display = "block";
							admin.style.display = "none";
							consult.style.display = "none";
						}
						if (logedUserType == "Consultant") {
							normal.style.display = "none";
							consult.style.display = "block";
							admin.style.display = "none";
						}
						if (logedUserType == "Admin") {
							normal.style.display = "none";
							admin.style.display = "block";
							consult.style.display = "none";
						}
					}

				}

			</script>

		</body>

</html>