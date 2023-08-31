
<%@ page import="java.util.List"%>
<%@ page import="com.model.JobTypeModel"%>
<!DOCTYPE html>
<html lang="en">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
if (session.getAttribute("email") == null) {
	response.sendRedirect("login.jsp");
}
%>

<head>
	<meta charset="utf-8">
	<meta content="width=device-width, initial-scale=1.0" name="viewport">
	
	<title>Home Page - Job Consulting</title>
	<meta content="" name="description">
	<meta content="" name="keywords">
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.4.0/jspdf.umd.min.js"></script>
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
	<link href="assets/vendor/bootstrap/css/bootstrap.min.css"
		rel="stylesheet">
	<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css"
		rel="stylesheet">
	<link href="assets/vendor/boxicons/css/boxicons.min.css"
		rel="stylesheet">
	<link href="assets/vendor/glightbox/css/glightbox.min.css"
		rel="stylesheet">
	<link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
	<link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
	
	<link href="assets/css/style.css" rel="stylesheet">
</head>

<body>
	<!-- ======= Header ======= -->
	<header id="header" class="fixed-top">
		<div class="container d-flex align-items-center justify-content-between">
			<h1 class="logo">
				<a href="index.html"><span id="headerText">Job Consulting</span></a> 
			</h1>
			<nav id="navbar" class="navbar">
				<ul>
					<li style="margin-left: 10px;"><%=session.getAttribute("name")%></span>
					</li>
					<li onClick="Logout()"><a class="getstarted scrollto"
						href="logout">Logout</a></li>
				</ul>
				<i class="bi bi-list mobile-nav-toggle"></i>
			</nav>
			<!-- .navbar -->
		</div>
	</header>
	<!-- End Header -->

	<main id="main">
		<!-- Normal User Area -->
		<div id="normalUser" style="display: none; min-height: 580px">
			<section id="about" class="about mt-5">
				<div class="container" data-aos="fade-up">
					<div class="row content">
						<div class="col-lg-6"></div>
						<div class="col-lg-6 pt-4 pt-lg-0">
							<div class="card p-2 mt-5">
								<div class="section-title text-center">
									<p>Add new Appointment</p>
								</div>
								<form action="book-appointment" method="post">
									<div class="form-group row">
										<div class="col-sm-6 mb-2">
											<label class="mb-2">Job Type</label> 
											<select id="jobTypeSelect" name="jobTypeSelect" class="form-control"></select> 
										</div>
										<div class="col-sm-6 mb-2">
											<label class="mb-2">Consultant</label> 
											<select id="consultant" name="consultant" class="form-control"></select>
										</div>
										<div class="col-sm-6 mb-2">
											<label class="mb-2">Date</label> <input type="date" name="date"
												id="" class="form-control" />
										</div>
										<div class="col-sm-6 mb-2">
											<label class="mb-2">Time</label> <input type="time" name="time"
												id="" class="form-control" />
										</div>
										<div class="col-sm-6 mb-2">
											<button type="clear" class="btn btn-danger mb-2 col-sm-12">Clear</button>
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
										<th scope="col">Status</th>
										<th scope="col">Action</th>
									</tr>
								</thead>
								<tbody id="appList"></tbody>
							</table>
						</div>
					</div>
				</div>
			</section>
		</div>

		<!-- Consultant User Area -->
		<div id="ConsultUser" style="display: none; min-height: 580px">
			<section id="about" class="about mt-5">
				<div class="container" data-aos="fade-up">
					<div class="row content">
						<div class="col-lg-6">
							<div class="card p-2 mt-5">
								<div class="section-title text-center">
									<p>Add Available Time</p>
								</div>
								<form action="add-consult" method="post">
									<div class="form-group row">
										<div class="col-sm-6 mb-2">
											<label class="mb-2">Date</label> <input type="date"
												name="date" id="date" class="form-control" />
										</div>
										<div class="col-sm-6 mb-2">
											<label class="mb-2">Time</label> <input type="time"
												name="time" id="time" class="form-control" />
										</div>
										<div class="col-sm-12 mb-2">
											<label class="mb-2">Job Type</label> 
											<select id="jobTypeSelect2" name="jobType" class="form-control">
											</select> 
										</div>
										<div class="col-sm-6 mb-2">
											<button type="clear" class="btn btn-danger mb-2 col-sm-12">Clear</button>
										</div>
										<div class="col-sm-6 mb-2">
											<button type="submit" class="btn btn-primary col-sm-12 mb-2">Set
												Available Time</button>
										</div>
									</div>
								</form>
							</div>
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
								<tbody id="tbodyConList"></tbody>
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
										<th scope="col">Status</th>
										<th scope="col">Action</th>
									</tr>
								</thead>
								<tbody id="appList2"></tbody>
							</table>
						</div>
					</div>
				</div>
			</section>
		</div>

		<!-- Admin User Area -->
		<div id="adminUser" style="display: none; min-height: 580px">
			<section id="about" class="about mt-5 ">
				<div class="container" data-aos="fade-up">
					<div class="row content">

						<div class="card">
							<div class="row content">
								<div class="section-title mt-4">
									<h2>Consultant Available Time</h2>
								</div>
								<div class="col-lg-4">
									<form action="admin-add-consult" method="post">
										<div class="form-group row">
											<div class="col-sm-6 mb-2">
												<label class="mb-2">Date</label> <input type="date"
													name="date" id="date" class="form-control" />
											</div>
											<div class="col-sm-6 mb-2">
												<label class="mb-2">Time</label> <input type="time"
													name="time" id="" time class="form-control" />
											</div>

											<div class="col-sm-6 mb-2">
												<label class="mb-2">Job Type</label> 
												<select id="jobTypeSelect3" name="jobType" class="form-control">
												</select> 
											</div>
											<div class="col-sm-6 mb-2">
												<label class="mb-2">Consultant</label> 
												<select id="consultant2" name="conUser" class="form-control"></select>
									
											</div>

											<div class="col-sm-12 mb-2">
												<button type="submit" class="btn btn-primary col-sm-12 mb-2">Set
													Available Time</button>
											</div>
										</div>

									</form>
								</div>
								<div class="col-lg-8 pt-4 pt-lg-0">
									<table class="table table-hover">
										<thead>
											<tr>
												<th scope="col">#</th>
												<th scope="col">Job Type</th>
												<th scope="col">Date</th>
												<th scope="col">Time</th>
												<th scope="col">Consultant</th>
												<th scope="col">Action</th>
											</tr>
										</thead>
										<tbody id="tbodyConList2"></tbody>
									</table>
								</div>
							</div>
						</div>
					</div>

				</div>
			</section>

			<section id="counts" class="counts">
				<div class="container" data-aos="fade-up">
					<div class="row no-gutters">
						<div class="card">
							<div class="row content mt-4">
								<div class="section-title">
									<h2>All Booking</h2>
								</div>
								<div class="col-lg-4 pt-4 pt-lg-0">
									<form action="admin-book-appointment" method="post">
										<div class="form-group row">
											<div class="col-sm-6 mb-2">
												<label class="mb-2">Job Type</label> 
												<select id="jobTypeSelect4" name="jobTypeSelect" class="form-control"></select> 
											</div>
											<div class="col-sm-6 mb-2">
												<label class="mb-2">Consultant</label> 
												<select id="consultant3" name="consultant" class="form-control"></select>
											</div>
											<div class="col-sm-6 mb-2">
												<label class="mb-2">Date</label> <input type="date" name="date"
													id="" class="form-control" />
											</div>
											<div class="col-sm-6 mb-2">
												<label class="mb-2">Time</label> <input type="time" name="time"
													id="" class="form-control" />
											</div>
											<div class="col-sm-12 mb-2">
												<label class="mb-2">Appointment User</label> 
												<select id="user1" name="appUser" class="form-control"></select>
											</div>
											<div class="col-sm-12 mb-2">
												<label class="mb-2"></label>
												<button type="submit"
													class="btn btn-primary col-sm-12 mb-2 mt-1">Book
													Appointment</button>
											</div>
										</div>
									</form>
								</div>

								<div class="col-lg-8 pt-4 pt-lg-0">
									<table class="table table-hover" id="rp-booking">
										<thead>
											<tr>
												<th scope="col">#</th>
												<th scope="col">Name</th>
												<th scope="col">Job Type</th>
												<th scope="col">Date</th>
												<th scope="col">Time</th>
												<th scope="col">Status</th>
												<th scope="col">Action</th>
											</tr>
										</thead>
										<tbody id="appList3"></tbody>
									</table>
									
									<div class="col-sm-12 mb-2">
										<div class="row">
											<div class="col-6"></div>
											<div class="col-6">
												<button type="submit"
													class="btn btn-success col-sm-12 mb-2 mt-1" onClick="GenerateBooking()">Generate Report 
												</button>
											</div>
										</div>
									</div>
									
								</div>	
							</div>
						</div>
					</div>
				</div>
			</section>
			
			<section id="counts" class="counts">
				<div class="container" data-aos="fade-up">
					<div class="row no-gutters">
						<div class="card">
							<div class="row content mt-4">
								<div class="section-title">
									<h2>All Users</h2>
								</div>
								<div class="col-lg-4 pt-4 pt-lg-0">
									<form action="register" method="post">
										<div class="form-group row">
										
											<div class="col-sm-6 mb-2">
												<label class="mb-2">Name</label> 
												<input class="form-control" name="name" required/> 
											</div>
											
											<div class="col-sm-6 mb-2">
												<label class="mb-2">Email</label> 
												<input class="form-control" name="email" required/> 
											</div>
											
											<div class="col-sm-6 mb-2">
												<label class="mb-2">Password</label> 
												<input class="form-control" name="password" required/> 
											</div>
											
											<div class="col-sm-6 mb-2">
												<label class="mb-2">Confirm Password</label> 
												<input class="form-control" name="cpassword" required/> 
											</div>
											
											
											<div class="col-sm-6 mb-2">
												<label class="mb-2">User Type</label> 
												<select class="form-select form-select-sm"
													name="userType" aria-label=".form-select-sm example">
													<option selected>Select User Type</option>
													<option value="Normal User">Normal User</option>
													<option value="Consultant">Consultant</option>
												</select>
											</div>
											
											<div class="col-sm-6 mb-2">
												<label class="mb-2">Contact no</label> 
												<input class="form-control" name="contact" /> 
											</div>
											<div class="col-sm-12 mb-2">
												<label class="mb-2"></label>
												<button type="submit"
													class="btn btn-primary col-sm-12 mb-2 mt-1">Add User
													</button>
											</div>
										</div>
									</form>
								</div>

								<div class="col-lg-8 pt-4 pt-lg-0">
									<table class="table table-hover" id="rp-user">
										<thead>
											<tr>
												<th scope="col">#</th>
												<th scope="col">Name</th>
												<th scope="col">Email</th>
												<th scope="col">User Type</th>
												<th scope="col">Contact No</th>
												<th scope="col">Action</th>
											</tr>
										</thead>
										<tbody id="userList"></tbody>
									</table>
									
									<div class="col-sm-12 mb-2">
										<div class="row">
											<div class="col-6"></div>
											<div class="col-6">
												<button type="submit"
													class="btn btn-success col-sm-12 mb-2 mt-1" onClick="GenerateUser()">Generate Report 
												</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>

	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<footer id="footer" class="mt-5">
		<div class="container">
			<div class="copyright">
				&copy; Copyright <strong><span>Job Consulting</span></strong>. All
				Rights Reserved
			</div>

		</div>
	</footer>
	<!-- End Footer -->

	<div id="preloader"></div>
	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>
	<!-- Vendor JS Files -->
	<script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
	<script src="assets/vendor/aos/aos.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
	<script src="assets/vendor/php-email-form/validate.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.4.0/jspdf.umd.min.js"></script>


	<script src="assets/js/main.js"></script>
	<script src="assets/vendor/alert/sweetalert.min.js"></script>
	
	<script>
		var status = '<%=session.getAttribute("status")%>';
		var massage = '<%=session.getAttribute("massage")%>';
		const value = sessionStorage.getItem('indexKey');
	
		var headerText = document.getElementById("headerText");
	
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
				const logedUserType = "<%=session.getAttribute("userType")%>";

				const normal = document.getElementById("normalUser");
			    const admin = document.getElementById("adminUser");
			    const consult = document.getElementById("ConsultUser");
			    const headerText = document.getElementById("headerText");

			    normal.style.display = "none";
			    admin.style.display = "none";
			    consult.style.display = "none";

			    if (status != null && status == "true") {
			        if (logedUserType === "Normal User") {
			            normal.style.display = "block";
			            headerText.innerHTML = 'JOB SEEKER HOME PAGE';
			        } else if (logedUserType === "Consultant") {
			            consult.style.display = "block";
			            headerText.innerHTML = 'CONSULTANT HOME PAGE';
			        } else if (logedUserType === "Admin") {
			            admin.style.display = "block";
			            headerText.innerHTML = 'ADMIN HOME PAGE';
			        }
			    }
			}
		}
	</script>
	
	<script src="assets/js/load.data.min.js"></script>
</body>

</html>