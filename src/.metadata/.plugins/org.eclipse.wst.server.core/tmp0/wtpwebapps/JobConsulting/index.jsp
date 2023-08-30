
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
										<select id="jobTypeSelect2" name="jobTypeSelect" class="form-control">
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
								<tbody>
									<tr>
										<th scope="row">1</th>
										<td>Software Engineering</td>
										<td>28/08/2023</td>
										<td>8.30 PM</td>
										<td>
											<button type="button" class="btn btn-outline-danger">
												<i class="ri-delete-bin-line"></i>
											</button>
										</td>
									</tr>
									<tr>
										<th scope="row">2</th>
										<td>Doctor</td>
										<td>28/08/2023</td>
										<td>10.30 PM</td>
										<td>
											<button type="button" class="btn btn-outline-danger">
												<i class="ri-delete-bin-line"></i>
											</button>
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
											<button type="button" class="btn btn-outline-danger">
												<i class="ri-delete-bin-line"></i>
											</button>
										</td>
									</tr>
									<tr>
										<th scope="row">2</th>
										<td>Smith</td>
										<td>Doctor</td>
										<td>28/08/2023</td>
										<td>10.30 PM</td>
										<td>
											<button type="button" class="btn btn-outline-danger">
												<i class="ri-delete-bin-line"></i>
											</button>
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
		<div id="adminUser" style="display: none; min-height: 580px">
			<section id="about" class="about mt-5 ">
				<div class="container" data-aos="fade-up">
					<div class="row content">

						<div class="card">
							<div class="row content">
								<div class="section-title mt-4">
									<h2>Consultant Available Time</h2>
								</div>
								<div class="col-lg-6">
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
								<div class="col-lg-6 pt-4 pt-lg-0">


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
												<td>Software Engineering</td>
												<td>Bob Harizon</td>
												<td>28/08/2023</td>
												<td>8.30 PM</td>
												<td>
													<button type="button" class="btn btn-outline-danger">
														<i class="ri-delete-bin-line"></i>
													</button>
												</td>
											</tr>
											<tr>
												<th scope="row">2</th>
												<td>Doctor</td>
												<td>Bob Harizon</td>
												<td>28/08/2023</td>
												<td>10.30 PM</td>
												<td>
													<button type="button" class="btn btn-outline-danger">
														<i class="ri-delete-bin-line"></i>
													</button>
												</td>
											</tr>

										</tbody>
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
								
								<div class="col-lg-6 pt-4 pt-lg-0">
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

									<div class="col-sm-6 mb-2">
										<label class="mb-2">Appointment User</label> 
										<select id="user1" name="appUser" class="form-control"></select>
									
										
									</div>

									<div class="col-sm-6 mb-2">
										<label class="mb-2"></label>
										<button type="submit"
											class="btn btn-primary col-sm-12 mb-2 mt-1">Book
											Appointment</button>
									</div>
								</div>

							</form>
						</div>

						<div class="col-lg-6 pt-4 pt-lg-0">


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
											<button type="button" class="btn btn-outline-danger">
												<i class="ri-delete-bin-line"></i>
											</button>
										</td>
									</tr>
									<tr>
										<th scope="row">2</th>
										<td>Smith</td>
										<td>Doctor</td>
										<td>28/08/2023</td>
										<td>10.30 PM</td>
										<td>
											<button type="button" class="btn btn-outline-danger">
												<i class="ri-delete-bin-line"></i>
											</button>
										</td>
									</tr>

								</tbody>
							</table>
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
		                
		                tableBody.innerHTML = ''; // Clear existing table rows

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
		                        const appId = application.appId; // Get the appId
		                        deleteApplication(appId);
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
		
	</script>

</body>

</html>