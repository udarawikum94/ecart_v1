<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>PVD Electronics Login</title>

  	<!-- Google Font: Source Sans Pro -->
  	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  
  	<link rel="stylesheet" href="<c:url value="/resources/plugins/fontawesome-free/css/all.min.css" />">
    <link rel="stylesheet" href="<c:url value="/resources/plugins/fontawesome-free/css/fontawesome.css" />">
    <link rel="stylesheet" href="<c:url value="/resources/dist/css/adminlte.css" />">
    <link rel="stylesheet" href="<c:url value="/resources/css/aw/aw.css" />">
    <link rel="stylesheet" href="<c:url value="/resources/plugins/toastr/toastr.css" />">
    <link rel="stylesheet" href="<c:url value="/resources/plugins/icheck-bootstrap/icheck-bootstrap.min.css"/>">
	<link rel="stylesheet" href="<c:url value="/resources/dist/css/adminlte.min.css"/>">
    <%-- <link rel="stylesheet" href="<c:url value="/resources/plugins/fontawesome-free/css/all.min.css" />css/aw/aw.css"> --%>
    <%-- <link rel="stylesheet" href="<c:url value="/resources/bootstrap/css/bootstrap.min.css" />"> --%>
	
	<script src="<c:url value="/resources/js/aw/aw.js" />"></script>
    <script src="<c:url value="/resources/plugins/jquery/jquery.min.js" />"></script>
    <script src="<c:url value="/resources/plugins/bootstrap/js/bootstrap.min.js" />"></script>
    <script src="<c:url value="/resources/js/ajax.js" />"></script>
    <script src="<c:url value="/resources/js/Commonjs.js" />"></script>
    <script src="<c:url value="/resources/plugins/datatables/jquery.dataTables.min.js" />"></script>
    <script src="<c:url value="/resources/plugins/toastr/toastr.min.js" />"></script>
    <script src="<c:url value="/resources/dist/js/adminlte.min.js"/>"></script>

	<!-- Bootstrap 4 -->
	<script src="<c:url value="/resources/plugins/bootstrap/js/bootstrap.bundle.min.js" />"></script>
	<!-- jquery-validation -->
	<script src="<c:url value="/resources/plugins/jquery-validation/jquery.validate.min.js" />"></script>
	<script src="<c:url value="/resources/plugins/jquery-validation/additional-methods.min.js" />"></script>
    <%-- <script src="<c:url value="/resources/plugins/bootstrap/js/bootstrap.bundle.min.js" />"></script> --%>
    
    <style>
		body {
		  background-image: url(<c:url value="/resources/images/red-wallpaper-18.jpg"/>);
		  opacity: 90%;
		  background-blend-mode: luminosity;
		}
		
		.panel-profile-img { 
			max-width: 120px;
		    margin-top: 10px;
		    margin-bottom: 2px;
		    border: 3px solid #e5e5e5;
		    border-radius: 1%;
		    padding-bottom: 5px;
		}
	</style>
</head>
<body class="hold-transition login-page background-image: url(<c:url value="/resources/images/red-wallpaper-18.jpg"/>)">
<div class="login-box">
  <!-- /.login-logo -->
  <div class="card card-outline card-primary">
    <div class="card-block text-center" style="height: fit-content; border: 3px solid #f4f6fe;border-radius: 1%; background-color: whitesmoke">
     	<img class="panel-profile-img rounded-circle" src="<c:url value="/resources/images/logo-001.jpg"/>">
     	<br><a class="h1" style="margin-top: 5px;"><b> E</b> - Cart</a>
    </div>
    <div class="card-body">
      <!-- <p class="login-box-msg">Sign in to start your session</p> -->

      <form:form id="regForm" action="login" method="post" modelAttribute="user">
        <div class="form-group mb-3">
        	<label for="exampleInputEmail1">Username</label>
        	<div class="input-group mb-3">
	          	<input type="text" class="form-control" id="userName" name="userName">
	          	<div class="input-group-append">
	            	<div class="input-group-text">
	              	<span class="fas fa-envelope"></span>
	            	</div>
	          </div>
          </div>
        </div>
        
        <div class="form-group mb-3">
        	<label for="passwordInput">Password</label>
	        <div class="input-group mb-3">
	          <input type="password" class="form-control" id="password" name="password">
	          <div class="input-group-append">
	            <div class="input-group-text">
	              <span class="fas fa-lock"></span>
	            </div>
	          </div>
	        </div>
	     </div>
        <div class="row">
         <!--  <div class="col-8">
            <div class="icheck-primary">
              <input type="checkbox" id="remember">
              <label for="remember">
                
              </label>
            </div>
          </div> -->
          <!-- /.col -->
          <div class="col-12">
            <button type="submit" class="btn btn-block bg-gradient-red mist">Sign In</button>
          </div>
          <!-- /.col -->
        </div>
      </form:form>

      <!-- <div class="social-auth-links text-center mt-2 mb-3">
        <a href="#" class="btn btn-block btn-primary">
          <i class="fab fa-facebook mr-2"></i> Sign in using Facebook
        </a>
        <a href="#" class="btn btn-block btn-danger">
          <i class="fab fa-google-plus mr-2"></i> Sign in using Google+
        </a>
      </div> -->
      <!-- /.social-auth-links -->

     <!--  <p class="mb-1">
        <a href="forgot-password.html">I forgot my password</a>
      </p>
      <p class="mb-0">
        <a href="register.html" class="text-center">Register a new membership</a>
      </p> -->
    </div>
    <!-- /.card-body -->
  </div>
  <!-- /.card -->
</div>
<!-- /.login-box -->
<script>
$(function () {
  //$.validator.setDefaults({
    //submitHandler: function () {
      //alert( "Form successful submitted!" );
   // }
 // });
  $('#regForm').validate({
    rules: {
      userName: {
        required: true,
      },
      password: {
        required: true,
        minlength: 8,
        maxlength: 20
      }
    },
    messages: {
      email: {
        required: "Please enter the username"
      },
      password: {
        required: "Please provide a password",
        minlength: "Your password must be at least 8 characters long",
        maxlength: "Your password cannot be greater than 20 characters long",
      }
    },
    errorElement: 'span',
    errorPlacement: function (error, element) {
      error.addClass('invalid-feedback');
      element.closest('.form-group').append(error);
    },
    highlight: function (element, errorClass, validClass) {
      $(element).addClass('is-invalid');
    }
  });
});
</script>
</body>
</html>

