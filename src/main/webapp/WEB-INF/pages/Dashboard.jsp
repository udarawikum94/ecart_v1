<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
  <title></title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Business Setup</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  	
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
    
    <script type="text/javascript">

	$( document ).ready(function() {
		var contextPath = $('#contextPath').val();
		getBusinessSetting();

		var createBtnAction = "CREATE";
		$( "#getCreate" ).click(function() {
			createBtnAction = "CREATE";
			clearAll();
		});


		$( "#createBusiness" ).click(function() {
			if(validation()){
				if(createBtnAction == "CREATE"){
					createBusinessSetting();
				}else{
					updateBusinessSetting();
				}
			};
		});
		
		$( "#clearBusiness" ).click(function() {
			clearAll();
		});

		function clearAll(){
			$("#id").val(0);
			$("#name").val("");
			$("#address").val("");
	    	$("#telephoneNumber").val("");
	    	$("#faxNumber").val("");
	    	$("#ttNumber").val("");
	    	$("#notes").val("");
	    	$("#image").val("");
	    	
		}

		function validation(){
			if($("#name").val()==""){
				Command: toastr["error"]("Name is required !");
				return false;
			}
			/* if($("#userTypeCode").val()=="" || $("#userTypeCode").val()=="0"){
				Command: toastr["error"]("User type is required !");
				return false;
			} */
			return true;
		}

		function createBusinessSetting(){
	    	var data = {};
	    	data["name"] = $("#name").val();
	    	
	    	if($("#address").val()!=""){
	    		data["address"] = $("#address").val();
	    	}
	    	
	    	if($("#telephoneNumber").val()!=""){
	    		data["telephoneNumber"] = $("#telephoneNumber").val();
	    	}
	    	
	    	if($("#faxNumber").val()!=""){
	    		data["faxNumber"] = $("#faxNumber").val();
	    	}
	    	
	    	if($("#ttNumber").val()!=""){
	    		data["ttNumber"] = $("#ttNumber").val();
	    	}
	    	
	    	if($("#notes").val()!=""){
	    		data["notes"] = $("#notes").val();
	    	}
	    	
	    	if($("#image").val()!=""){
	    		data["image"] = $("#image").val();
	    	}
	    	
	    	//$('#my-box').boxRefresh('load');
			$.post({
				type: "POST",
	            contentType: "application/json",
	            url: contextPath+"/businessSetting/createBusinessSetting",
	            data: JSON.stringify(data),
	            dataType: 'json',
	            timeout: 600000,
			}, function(data2) {
				if(data2["code"]=="SUCCESS"){
					//Command: toastr["success"](data2["description"]);
					Swal.fire({
						  position: 'top-end',
						  icon: 'success',
						  title: data2["description"],
						  showConfirmButton: false,
						  timer: 1500
						})
					getAllUserTypes();
				}else{
					//Command: toastr["error"](data2["description"]);
					Swal.fire({
						  position: 'top-end',
						  icon: 'error',
						  title: data2["description"],
						  showConfirmButton: false,
						  timer: 1500
						})
				}
			}).done(function() {
				console.log("1");
			}).fail(function(xhr, textStatus, errorThrown) {
				console.log("2");
			}).always(function() {
				console.log("3");
			});
	    }

		function updateBusinessSetting(){
	    	var data = {};
	    	data["id"] = $("#id").val();
			data["version"] = $("#version").val();
			data["name"] = $("#name").val();
	    	data["address"] = $("#address").val();
	    	data["telephoneNumber"] = $("#telephoneNumber").val();
	    	data["faxNumber"] = $("#faxNumber").val();
	    	data["ttNumber"] = $("#ttNumber").val();
	    	data["ttNumber"] = $("#ttNumber").val();
	    	
	    	if($("#image").val()!=""){
	    		data["image"] = $("#image").val();
	    	}
	    	
			$.post({
				type: "POST",
	            contentType: "application/json",
	            url: contextPath+"/businessSetting/updateBusinessSetting",
	            data: JSON.stringify(data),
	            dataType: 'json',
	            timeout: 600000,
			}, function(data2) {
				if(data2["code"]=="SUCCESS"){
					//Command: toastr["success"](data2["description"]);
					Swal.fire({
						  position: 'top-end',
						  icon: 'success',
						  title: data2["description"],
						  showConfirmButton: false,
						  timer: 1500
						})
					getAllUserTypes();
				}else{
					//Command: toastr["error"](data2["description"]);
					Swal.fire({
						  position: 'top-end',
						  icon: 'error',
						  title: data2["description"],
						  showConfirmButton: false,
						  timer: 1500
						})
				}
			}).done(function() {
				console.log("1");
			}).fail(function(xhr, textStatus, errorThrown) {
				console.log("2");
			}).always(function() {
				console.log("3");
			});
	    }

		function deleteUser(dataArr){
		    var data = {};
	    	data["id"] = dataArr["userId"];	
			$.post({
				type: "POST",
	            contentType: "application/json",
	            url: contextPath+"/userCreation/deleteUser?id="+dataArr["userId"],
	            data: JSON.stringify(data),
	            dataType: 'json',
	            timeout: 600000,
			}, function(data2) {
				if(data2["code"]=="SUCCESS"){
					//Command: toastr["success"](data2["description"]);
					Swal.fire({
						  position: 'top-end',
						  icon: 'success',
						  title: data2["description"],
						  showConfirmButton: false,
						  timer: 1500
						})
					getAllUserTypes();
				}else{
					//Command: toastr["error"](data2["description"]);
					Swal.fire({
						  position: 'top-end',
						  icon: 'error',
						  title: data2["description"],
						  showConfirmButton: false,
						  timer: 1500
						})
				}	
			}).done(function() {
				console.log("1");
			}).fail(function(xhr, textStatus, errorThrown) {
				console.log("2");
			}).always(function() {
				console.log("3");
			});   
		}
		
		function getBusinessSetting(){
		    var data = {}
			$.post({
				type: "GET",
	            contentType: "application/json",
	            url: contextPath+"/businessSetting/getBusinessSetting",
	            dataType: 'json',
	            timeout: 600000,
			}, function(data2) {
				if(data2["code"]=="SUCCESS"){
					var arr=data2["object"];
					 
					$("#id").val(arr["id"]);
					$("#version").val(arr["version"]);
					$("#name").val(arr["name"]);
					$("#address").val(arr["address"]);
			    	$("#telephoneNumber").val(arr["telephoneNumber"]);
			    	$("#faxNumber").val(arr["faxNumber"]);
			    	$("#ttNumber").val(arr["ttNumber"]);
			    	$("#notes").val(arr["notes"]);
			    	$("#createBusiness").html("Update");
			    	
			    	createBtnAction = "UPDATE";
				}
			}).done(function() {
				console.log("1");
			}).fail(function(xhr, textStatus, errorThrown) {
				console.log("2");
			})
		}

	});

	</script>
</head>
<body class="bodyClass"><!-- onload="getAllUserTypes()"  -->
<input type="hidden" id="contextPath" value="<%=request.getContextPath()%>" readonly></input>
<input type="hidden" id="id" value="0" readonly></input>
<input type="hidden" id="version" value="0" readonly></input>
	</br>
	<section class="content">
		<div class="container-fluid">
		<div id="my-box" class="box box-default">
			<div class="overlay">
			  <i class="fa fa-refresh fa-spin"></i>
			</div>
		</div>
			
			<div class="row">
				<div class="col-md-1">
					<c:if test="${CREATE=='TRUE'}">
						<button type="button" class="btn btn-block bg-gradient-google" data-toggle="modal" id="getCreate">Create</button>
					</c:if>	
				</div>
			</div></br>
			<div class="row">
          <div class="col-12 col-sm-6 col-md-3">
            <div class="info-box">
              <span class="info-box-icon bg-info elevation-1"><i class="fas fa-cog"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">CPU Traffic</span>
                <span class="info-box-number">
                  10
                  <small>%</small>
                </span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
          <!-- /.col -->
          <div class="col-12 col-sm-6 col-md-3">
            <div class="info-box mb-3">
              <span class="info-box-icon bg-danger elevation-1"><i class="fas fa-thumbs-up"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Likes</span>
                <span class="info-box-number">41,410</span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
          <!-- /.col -->

          <!-- fix for small devices only -->
          <div class="clearfix hidden-md-up"></div>

          <div class="col-12 col-sm-6 col-md-3">
            <div class="info-box mb-3">
              <span class="info-box-icon bg-success elevation-1"><i class="fas fa-shopping-cart"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Sales</span>
                <span class="info-box-number">760</span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
          <!-- /.col -->
          <div class="col-12 col-sm-6 col-md-3">
            <div class="info-box mb-3">
              <span class="info-box-icon bg-warning elevation-1"><i class="fas fa-users"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">New Members</span>
                <span class="info-box-number">2,000</span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
		</div>
		<!-- /.container-fluid -->
	</section>
	
</body>
</html>
