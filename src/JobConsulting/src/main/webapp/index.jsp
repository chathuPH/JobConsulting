
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
		<div
			class="container d-flex align-items-center justify-content-between">

			<h1 class="logo">
				<a href="index.html">Job Consulting</a>
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
						<div class="col-lg-6">
							<div class="section-title">
								<p>User Home Page</p>
							</div>
						</div>
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
											name="time" id="" time class="form-control" />
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
												<select id="jobTypeSelect3" name="jobTypeSelect" class="form-control">
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

	<!-- Template Main JS File -->
	<script src="assets/js/main.js"></script>
	<script src="assets/vendor/alert/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
	<script>
		
		const currentURL = window.location.href;
		const protocol = window.location.protocol;
		const host = window.location.host;
		const hostUrl = protocol+"//"+host+"/JobConsulting";

				
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
		LoadJobType();
		LoadConsultUser();
		LoadApointmentList();
		LoadConsultTime();
		LoadUserList();

		function LoadUserDiv() {
			if (status != null && status == "true") {
				const logedUserType = "<%=session.getAttribute("userType")%>";

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
		
		function LoadJobType() {
			const jobtypeUrl = hostUrl+'/get-job-type';
			
		    var xhr = new XMLHttpRequest();
		    xhr.open("GET", jobtypeUrl, true);

		    xhr.onreadystatechange = function() {
		        if (xhr.readyState === XMLHttpRequest.DONE) {
		            if (xhr.status === 200) {
		                const data = JSON.parse(xhr.responseText);

		                const jobTypeSelect = document.getElementById("jobTypeSelect");
		                const jobTypeSelect2 = document.getElementById("jobTypeSelect2");
		                const jobTypeSelect3 = document.getElementById("jobTypeSelect3");
		                const jobTypeSelect4 = document.getElementById("jobTypeSelect4");
		                
		                jobTypeSelect.innerHTML = ''; 
		                jobTypeSelect2.innerHTML = ''; 
		                jobTypeSelect3.innerHTML = ''; 
		                jobTypeSelect4.innerHTML = ''; 

		                data.forEach(jobType => {
		                    const option1 = document.createElement('option');
		                    option1.value = jobType.id;
		                    option1.textContent = jobType.name;
		                    
		                    const option2 = document.createElement('option');
		                    option2.value = jobType.id;
		                    option2.textContent = jobType.name;
		                    
		                    const option3 = document.createElement('option');
		                    option3.value = jobType.id;
		                    option3.textContent = jobType.name;
		                    
		                    const option4 = document.createElement('option');
		                    option4.value = jobType.id;
		                    option4.textContent = jobType.name;
		                    
		                    jobTypeSelect.appendChild(option1);
		                    jobTypeSelect2.appendChild(option2);
		                    jobTypeSelect3.appendChild(option3);
		                    jobTypeSelect4.appendChild(option4);
		                });
		                
		            } else {

		            	debugger;
		                console.log('Request failed with status:', xhr.status);
		            }
		        }
		    };

		    xhr.send();
		}

		function LoadConsultUser() {
			const jobtypeUrl = hostUrl+'/getUsers';
			
		    var xhr = new XMLHttpRequest();
		    xhr.open("GET", jobtypeUrl, true);

		    xhr.onreadystatechange = function() {
		        if (xhr.readyState === XMLHttpRequest.DONE) {
		            if (xhr.status === 200) {
		                const data = JSON.parse(xhr.responseText);

		                const selectConsult = document.getElementById("consultant");
		                const selectConsult2 = document.getElementById("consultant2");
		                const selectConsult3 = document.getElementById("consultant3");
		                const user1 = document.getElementById("user1");
		                
		                selectConsult.innerHTML = ''; 
		                selectConsult2.innerHTML = ''; 
		                selectConsult3.innerHTML = ''; 
		                user1.innerHTML = '';

		                data.forEach(dt => {
		                	if(dt.userType == "Consultant"){
		                		const option1 = document.createElement('option');
			                    option1.value = dt.id;
			                    option1.textContent = dt.name;
			                    

		                		const option2 = document.createElement('option');
			                    option2.value = dt.id;
			                    option2.textContent = dt.name;
			                    

		                		const option3 = document.createElement('option');
			                    option3.value = dt.id;
			                    option3.textContent = dt.name;
			                    
			                    selectConsult.appendChild(option1);
			                    selectConsult2.appendChild(option2);
			                    selectConsult3.appendChild(option3);
		                	}
		                	
							if(dt.userType == "Normal User"){
								const option1 = document.createElement('option');
			                    option1.value = dt.id;
			                    option1.textContent = dt.name;
			                    user1.appendChild(option1);
							}
							
		                });
		                
		                
		            } else {
		                console.log('Request failed with status:', xhr.status);
		            }
		        }
		    };

		    xhr.send();
		}
		
		function LoadApointmentList() {
			const jobtypeUrl = hostUrl+'/get-appointment';
			
		    var xhr = new XMLHttpRequest();
		    xhr.open("GET", jobtypeUrl, true);

		    xhr.onreadystatechange = function() {
		        if (xhr.readyState === XMLHttpRequest.DONE) {
		            if (xhr.status === 200) {
		                const data = JSON.parse(xhr.responseText);
		                
		                
		                const tableBody  = document.getElementById("appList");
		                tableBody.innerHTML = '';
		                
		                const tableBody2  = document.getElementById("appList2");
		                tableBody2.innerHTML = '';
		                

		                const tableBody3  = document.getElementById("appList3");
		                tableBody3.innerHTML = '';
		                
		                data.forEach((application, index) => {
		                    const row = document.createElement("tr");
		                    
		                    const indexCell = document.createElement("td");
		                    indexCell.textContent = index + 1;
		                    row.appendChild(indexCell);

		                    const jobTypeCell = document.createElement("td");
		                    jobTypeCell.textContent = application.jobName;
		                    row.appendChild(jobTypeCell);

		                    const consultCell = document.createElement("td");
		                    consultCell.textContent = application.ConsultName;
		                    row.appendChild(consultCell);

		                    const dateCell = document.createElement("td");
		                    dateCell.textContent = application.date;
		                    row.appendChild(dateCell);

		                    const timeCell = document.createElement("td");
		                    timeCell.textContent = application.time;
		                    row.appendChild(timeCell);
		                    
		                    const statusCell = document.createElement("td");
		                    statusCell.textContent = application.state;
		                    row.appendChild(statusCell);
		                    
		                    const actionCell = document.createElement("td");
		                    const deleteButton = document.createElement("button");
		                    deleteButton.type = "button";
		                    deleteButton.classList.add("btn", "btn-outline-danger");
		                    deleteButton.innerHTML = '<i class="ri-delete-bin-line"></i>';
		                    deleteButton.addEventListener("click", function() {
		                        const appId = application.appId;
		                        deleteApplication(appId);
		                    });
		                    actionCell.appendChild(deleteButton);
		                    row.appendChild(actionCell);
		                    tableBody.appendChild(row);
		                    
		                    //row2
		                    const row2 = document.createElement("tr");
		                    
		                    const indexCell2 = document.createElement("td");
		                    indexCell2.textContent = index + 1;
		                    row2.appendChild(indexCell2);

		                    const consultCell2 = document.createElement("td");
		                    consultCell2.textContent = application.appUserName;
		                    row2.appendChild(consultCell2);
		                    
		                    const jobTypeCell2 = document.createElement("td");
		                    jobTypeCell2.textContent = application.jobName;
		                    row2.appendChild(jobTypeCell2);

		                    

		                    const dateCell2 = document.createElement("td");
		                    dateCell2.textContent = application.date;
		                    row2.appendChild(dateCell2);

		                    const timeCell2 = document.createElement("td");
		                    timeCell2.textContent = application.time;
		                    row2.appendChild(timeCell2);
		                    
		                    const statusCell2 = document.createElement("td");
		                    statusCell2.textContent = application.state;
		                    row2.appendChild(statusCell2);
		                    
		                    const actionCell2 = document.createElement("td");
		                    const deleteButton2 = document.createElement("button");
		                    deleteButton2.type = "button";
		                    deleteButton2.classList.add("btn", "btn-outline-danger");
		                    deleteButton2.innerHTML = '<i class="ri-delete-bin-line"></i>';
		                    deleteButton2.addEventListener("click", function() {
		                        const appId = application.appId;
		                        deleteApplication(appId);
		                    });
		                    actionCell2.appendChild(deleteButton2);
		                    row2.appendChild(actionCell2);
		                    tableBody2.appendChild(row2);
		                    
		                  	//row3
		                    const row3 = document.createElement("tr");
		                    
		                    const indexCell3 = document.createElement("td");
		                    indexCell3.textContent = index + 1;
		                    row3.appendChild(indexCell3);

		                    const consultCell3 = document.createElement("td");
		                    consultCell3.textContent = application.appUserName;
		                    row3.appendChild(consultCell3);
		                    
		                    const jobTypeCell3 = document.createElement("td");
		                    jobTypeCell3.textContent = application.jobName;
		                    row3.appendChild(jobTypeCell3);

		                    const dateCell3 = document.createElement("td");
		                    dateCell3.textContent = application.date;
		                    row3.appendChild(dateCell3);

		                    const timeCell3 = document.createElement("td");
		                    timeCell3.textContent = application.time;
		                    row3.appendChild(timeCell3);
		                    
		                    const statusCell3 = document.createElement("td");
		                    statusCell3.textContent = application.state;
		                    row3.appendChild(statusCell3);
		                    
		                    const actionCell3 = document.createElement("td");
		                    const deleteButton3 = document.createElement("button");
		                    deleteButton3.type = "button";
		                    deleteButton3.classList.add("btn", "btn-outline-danger");
		                    deleteButton3.innerHTML = '<i class="ri-delete-bin-line"></i>';
		                    deleteButton3.addEventListener("click", function() {
		                        const appId = application.appId;
		                        deleteApplication(appId);
		                    });
		                    actionCell3.appendChild(deleteButton2);
		                    row3.appendChild(actionCell3);
		                    

		                    tableBody3.appendChild(row3);
		                });
		                
		            } else {

		            	debugger;
		                console.log('Request failed with status:', xhr.status);
		            }
		        }
		    };

		    xhr.send();
		}
		
		function LoadUserList() {
			const jobtypeUrl = hostUrl+'/getUsers';
			
		    var xhr = new XMLHttpRequest();
		    xhr.open("GET", jobtypeUrl, true);

		    xhr.onreadystatechange = function() {
		        if (xhr.readyState === XMLHttpRequest.DONE) {
		            if (xhr.status === 200) {
		                const data = JSON.parse(xhr.responseText);
		                
		                
		                const tableBody  = document.getElementById("userList");
		                tableBody.innerHTML = '';
		                

		                
		                data.forEach((application, index) => {
		                    const row = document.createElement("tr");
		                    
		                    const indexCell = document.createElement("td");
		                    indexCell.textContent = index + 1;
		                    row.appendChild(indexCell);

		                    const jobTypeCell = document.createElement("td");
		                    jobTypeCell.textContent = application.name;
		                    row.appendChild(jobTypeCell);

		                    const consultCell = document.createElement("td");
		                    consultCell.textContent = application.email;
		                    row.appendChild(consultCell);

		                    const dateCell = document.createElement("td");
		                    dateCell.textContent = application.userType;
		                    row.appendChild(dateCell);

		                    const timeCell = document.createElement("td");
		                    timeCell.textContent = application.mobile;
		                    row.appendChild(timeCell);
		                    
		                    const actionCell = document.createElement("td");
		                    const deleteButton = document.createElement("button");
		                    deleteButton.type = "button";
		                    deleteButton.classList.add("btn", "btn-outline-danger");
		                    deleteButton.innerHTML = '<i class="ri-delete-bin-line"></i>';
		                    deleteButton.addEventListener("click", function() {
		                        const appId = application.id;
		                        deleteUser(appId);
		                    });
		                    actionCell.appendChild(deleteButton);
		                    row.appendChild(actionCell);
		                    
		                    tableBody.appendChild(row);
		                    
		                });
		                
		            } else {

		            	debugger;
		                console.log('Request failed with status:', xhr.status);
		            }
		        }
		    };

		    xhr.send();
		}

		
		function deleteApplication(appId) {
			debugger;
			const deleteUrl  = hostUrl+'/delete-appointment?appId='+appId;
			fetch(deleteUrl, {
		        method: 'POST',
		        headers: {
		            'Content-Type': 'application/x-www-form-urlencoded'
		        },
		        body: 'appId='+appId
		    })
		    .then(response => {
		    	debugger;
		        if (response.status === 200) {
		        	//window.location.reload();
		        	LoadApointmentList();
		        } else {
		            console.log('Failed to delete application');
		        }
		    })
		    .catch(error => {
		        console.log('Error:', error);
		    });
		}
		
		function deleteUser(appId) {
			debugger;
			const deleteUrl  = hostUrl+'/delete-user?appId='+appId;
			fetch(deleteUrl, {
		        method: 'POST',
		        headers: {
		            'Content-Type': 'application/x-www-form-urlencoded'
		        },
		        body: 'appId='+appId
		    })
		    .then(response => {
		    	debugger;
		        if (response.status === 200) {
		        	//window.location.reload();
		        	LoadApointmentList();
		        } else {
		            console.log('Failed to delete application');
		        }
		    })
		    .catch(error => {
		        console.log('Error:', error);
		    });
		}
		//get consult time
		
		function LoadConsultTime() {
			const jobtypeUrl = hostUrl+'/get-consult';
			
		    var xhr = new XMLHttpRequest();
		    xhr.open("GET", jobtypeUrl, true);

		    xhr.onreadystatechange = function() {
		        if (xhr.readyState === XMLHttpRequest.DONE) {
		            if (xhr.status === 200) {
		                const data = JSON.parse(xhr.responseText);
		                
		                const tableBody  = document.getElementById("tbodyConList");
		                tableBody.innerHTML = '';
		                
		                const tableBody2  = document.getElementById("tbodyConList2");
	                	tableBody2.innerHTML = '';
		                
		                data.forEach((application, index) => {
		                    const row = document.createElement("tr");
		                    
		                    const indexCell = document.createElement("td");
		                    indexCell.textContent = index + 1;
		                    row.appendChild(indexCell);

		                    const jobTypeCell = document.createElement("td");
		                    jobTypeCell.textContent = application.jobName;
		                    row.appendChild(jobTypeCell);

		                  
		                    const dateCell = document.createElement("td");
		                    dateCell.textContent = application.conDate;
		                    row.appendChild(dateCell);

		                    const timeCell = document.createElement("td");
		                    timeCell.textContent = application.conTime;
		                    row.appendChild(timeCell);
		                    		                    
		                    const actionCell = document.createElement("td");
		                    const deleteButton = document.createElement("button");
		                    deleteButton.type = "button";
		                    deleteButton.classList.add("btn", "btn-outline-danger");
		                    deleteButton.innerHTML = '<i class="ri-delete-bin-line"></i>';
		                    deleteButton.addEventListener("click", function() {
		                        const appId = application.id;
		                        deleteConsultTime(appId);
		                    });
		                    actionCell.appendChild(deleteButton);
		                    row.appendChild(actionCell);
		                    
		                    tableBody.appendChild(row);
		                    
		                    //row2
							const row2 = document.createElement("tr");
		                    
		                    const indexCell2 = document.createElement("td");
		                    indexCell2.textContent = index + 1;
		                    row2.appendChild(indexCell2);

		                    const jobTypeCell2 = document.createElement("td");
		                    jobTypeCell2.textContent = application.jobName;
		                    row2.appendChild(jobTypeCell2);

		                    

		                    const dateCell2 = document.createElement("td");
		                    dateCell2.textContent = application.conDate;
		                    row2.appendChild(dateCell2);

		                    const timeCell2 = document.createElement("td");
		                    timeCell2.textContent = application.conTime;
		                    row2.appendChild(timeCell2);
		                    		            
		                    const consultCell2 = document.createElement("td");
		                    consultCell2.textContent = application.conName;
		                    row2.appendChild(consultCell2);
		                    
		                    const actionCell2 = document.createElement("td");
		                    const deleteButton2 = document.createElement("button");
		                    deleteButton2.type = "button";
		                    deleteButton2.classList.add("btn", "btn-outline-danger");
		                    deleteButton2.innerHTML = '<i class="ri-delete-bin-line"></i>';
		                    deleteButton2.addEventListener("click", function() {
		                        const appId = application.id;
		                        deleteConsultTime(appId);
		                    });
		                    actionCell2.appendChild(deleteButton2);
		                    row2.appendChild(actionCell2);
		                    
		                    tableBody2.appendChild(row2);
		                    
		                    
		                });
		                
		            } else {

		            	debugger;
		                console.log('Request failed with status:', xhr.status);
		            }
		        }
		    };

		    xhr.send();
		}

		
		function deleteConsultTime(appId) {
			debugger;
			const deleteUrl  = hostUrl+'/delete-consult-time?appId='+appId;
			fetch(deleteUrl, {
		        method: 'POST',
		        headers: {
		            'Content-Type': 'application/x-www-form-urlencoded'
		        },
		        body: 'appId='+appId
		    })
		    .then(response => {
		    	debugger;
		        if (response.status === 200) {
		        	//window.location.reload();
		        	LoadConsultTime();
		        } else {
		            console.log('Failed to delete application');
		        }
		    })
		    .catch(error => {
		        console.log('Error:', error);
		    });
		}
		
		function GenerateBooking() {
			debugger;
		    const doc = new jsPDF();
		    const table = document.getElementById('rp-booking');
		    doc.autoTable({ html: table });
		    doc.save('report-booking.pdf');
		}
		
		function GenerateUser() {
			debugger;
		    const doc = new jsPDF();
		    const table = document.getElementById('rp-user');
		    doc.autoTable({ html: table });
		    doc.save('report-User.pdf');
		}
		
	</script>

</body>

</html>