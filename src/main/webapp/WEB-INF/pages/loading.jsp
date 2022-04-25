<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Insert title here</title>
	<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <link rel="stylesheet" href="<c:url value="/resources/plugins/fontawesome-free/css/all.min.css" />">
    <%-- <link rel="stylesheet" href="<c:url value="/resources/bootstrap/css/bootstrap.css" />"> --%>
    <link rel="stylesheet" href="<c:url value="/resources/plugins/fontawesome-free/css/fontawesome.css" />">
    <link rel="stylesheet" href="<c:url value="/resources/dist/css/adminlte.css" />">
    <link rel="stylesheet" href="<c:url value="/resources/plugins/fontawesome-free/css/all.min.css" />">
    <link rel="stylesheet" href="<c:url value="/resources/css/aw/aw.css" />">
    <link rel="stylesheet" href="<c:url value="/resources/plugins/toastr/toastr.css" />">
	
	<script src="<c:url value="/resources/js/aw/aw.js" />"></script>
    <script src="<c:url value="/resources/plugins/jquery/jquery.min.js" />"></script>
    <script src="<c:url value="/resources/plugins/bootstrap/js/bootstrap.min.js" />"></script>
    <script src="<c:url value="/resources/js/ajax.js" />"></script>
    <script src="<c:url value="/resources/js/Commonjs.js" />"></script>
    <script src="<c:url value="/resources/plugins/datatables/jquery.dataTables.min.js" />"></script>
    <script src="<c:url value="/resources/plugins/toastr/toastr.min.js" />"></script>
    
    <style type="text/css">
		.bd-example-modal-lg .modal-dialog{
		    display: table;
		    position: relative;
		    margin: 0 auto;
		    top: calc(50% - 24px);
		  }
		
		  .bd-example-modal-lg .modal-dialog .modal-content{
		    background-color: transparent;
		    border: none;
		  }
		  
		  .modal-backdrop.show {
			opacity: 0.3;
		  }
	</style>
</head>
<body>
	<div class="modal fade bd-example-modal-lg" data-backdrop="static" data-keyboard="false" tabindex="-1" id="processingModel">
	    <div class="modal-dialog modal-sm">
	        <div class="spinner-border text-secondary" role="status">
			  <span class="sr-only">Loading...</span>
			</div>
	    </div>
	</div>
</body>
</html>