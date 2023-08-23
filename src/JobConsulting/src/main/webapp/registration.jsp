<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Sign Up Form by Job Consulting</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">


<!-- Main css -->
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/index-styles.css">


</head>
<body>

	<div class="main">

		<!-- Sign up form -->
		<section class="signup" style="width: 70%; margin-left: 15%">
			<div class="container">
				<div class="signup-content">
					<div class="signup-form">
						<h2 class="form-title">SIGN UP PAGE</h2>

						<form method="post" action="register" class="register-form"
							id="register-form">
							<div class="form-group">
								<label for="name"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="name" id="name" placeholder="Your Name" />
							</div>
							<div class="form-group">
								<label for="email"><i class="zmdi zmdi-email"></i></label> <input
									type="email" name="email" id="email" placeholder="Your Email" />
							</div>
							<div class="form-group">
								<label for="pass"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="password" id="pass"
									placeholder="Password" />
							</div>
							<div class="form-group">
								<label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
								<input type="password" name="cpassword" id="re_pass"
									placeholder="Repeat your password" />
							</div>
							<div class="form-group">
								
								<select class="form-select form-select-sm"
									name="userType" aria-label=".form-select-sm example">
									<option selected>Select User Type</option>
									<option value="Normal User">Normal User</option>
									<option value="Consultant">Consultant</option>
								</select>
							</div>
							<div class="form-group">
								<label for="contact"><i class="zmdi zmdi-lock-outline"></i></label>
								<input type="text" name="contact" id="contact"
									placeholder="Contact no" />
							</div>
							<div class="form-group">
								<input type="checkbox" name="agree-term" id="agree-term"
									class="agree-term" /> <label for="agree-term"
									class="label-agree-term"><span><span></span></span>I
									agree all statements in <a href="#" class="term-service">Terms
										of service</a></label>
							</div>
							<div class="form-group form-button">
								<input type="submit" name="signup" id="signup"
									class="form-submit" value="Register" />
							</div>
						</form>
					</div>
					<div class="signup-image">
						<figure>
							<img src="assets/img/avataaars.svg" alt="sing up image">
						</figure>
						<a href="login.jsp" class="signup-image-link">I am already
							member</a>
					</div>
				</div>
			</div>
		</section>


	</div>
	<!-- JS -->

	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">

	<script>
		var status = '<%=session.getAttribute("status")%>';
		var massage = '<%=session.getAttribute("massage")%>';
		const value = sessionStorage.getItem('regKey');
		if (status != null && status == "false") {
			swal("Error!", massage, "error");
			//sessionStorage.setItem('regKey', 1);
		} else if (status != null && status == "true" && value == null) {
			swal("Success!", massage, "success");
			//sessionStorage.setItem('regKey', 1);
		}
	</script>


</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>