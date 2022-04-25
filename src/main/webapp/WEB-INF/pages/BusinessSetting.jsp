<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
		    	
				$.post({
					type: "POST",
		            contentType: "application/json",
		            url: contextPath+"/businessSetting/createBusinessSetting",
		            data: JSON.stringify(data),
		            dataType: 'json',
		            timeout: 600000,
				}, function(data2) {
					if(data2["code"]=="SUCCESS"){
						Command: toastr["success"](data2["description"]);
					}else{
						Command: toastr["error"](data2["description"]);
					}
				}).done(function() {
					getBusinessSetting();
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
		    	
		    	$('#processingModel').modal('show');
				$.post({
					type: "POST",
		            contentType: "application/json",
		            url: contextPath+"/businessSetting/updateBusinessSetting",
		            data: JSON.stringify(data),
		            dataType: 'json',
		            timeout: 600000,
				}, function(data2) {
					$('#processingModel').modal('hide');
					if(data2["code"]=="SUCCESS"){
						Command: toastr["success"](data2["description"]);
					}else{
						Command: toastr["error"](data2["description"]);
					}
				}).done(function() {
					getBusinessSetting();
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
						Command: toastr["success"](data2["description"]);
						getAllUserTypes();
					}else{
						Command: toastr["error"](data2["description"]);
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
			
			function readURL(input) {
			  if (input.files && input.files[0]) {
			    var reader = new FileReader();
			    
			    reader.onload = function(e) {
			      $('#previewImage').attr('src', e.target.result);
			    }
			    
			    $('#logoLable').html(input.files[0]["name"])
			    reader.readAsDataURL(input.files[0]); 
			  }
			}

			$("#logoImage").change(function() {
				uploadImage(this);
			  	readURL(this);
			});
			
			function uploadImage(input) {
				console.log("contextPath+'/businessSetting/uploadImage '"+contextPath+"/businessSetting/uploadImage");
				console.log($("#imageForm").attr('action', contextPath+"/businessSetting/uploadImage").submit());
				$("#imageForm").attr('action', contextPath+"/businessSetting/uploadImage").submit(function(data2){
					alert(1);
					/*if(data2["code"]=="SUCCESS"){
						Command: toastr["success"](data2["description"]);
						var arr=data2["object"];
						$('#imageId').html(arr["id"])
					}else{
						Command: toastr["error"](data2["description"]);
					}*/
				});
				if (input.files && input.files[0]) {
					
				}
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
			<div class="row">
				<div class="col-md-1">
					<c:if test="${CREATE=='TRUE'}">
						<button type="button" class="btn btn-block bg-gradient-google" data-toggle="modal" id="getCreate">Create</button>
					</c:if>	
				</div>
			</div></br>
			<div class="row">
				<div class="col-md-7">
	            <!-- general form elements -->
	            <div class="card card-primary">
	              <!-- <div class="card-header">
	                <h3 class="card-title">Quick Example</h3>
	              </div> -->
	              <!-- /.card-header -->
	              <!-- form start -->
	              <form>
	                <div class="card-body">
	                  <div class="form-group">
	                    <label for="name">Name</label>
	                    <input type="text" class="form-control" id="name" name="name">
	                  </div>
	                  <div class="form-group">
	                    <label for="address">Address</label>
	                    <input type="text" class="form-control" id="address" name="address">
	                  </div>
	                  <div class="form-group">
	                    <label for="telephoneNumber">Telephone Number</label>
	                    <input type="text" class="form-control" id="telephoneNumber" name="telephoneNumber">
	                  </div>
	                  <div class="form-group">
	                    <label for="faxNumber">Fax Number</label>
	                    <input type="text" class="form-control" id="faxNumber" name="faxNumber">
	                  </div>
	                  <div class="form-group">
	                    <label for="ttNumber">TT Number</label>
	                    <input type="text" class="form-control" id="ttNumber" name="ttNumber">
	                  </div>
	                  <div class="form-group">
	                    <label>Notes</label>
	                    <textarea class="form-control" rows="3" id="notes" name="notes"></textarea>
	                  </div>
	                </div>
	                <!-- /.card-body -->
	
	                <!-- <div class="card-footer">
	                  <button type="submit" class="btn btn-primary">Submit</button>
	                </div> -->
	              </form>
	            </div>
	           </div>
	           <div class="col-md-5">
	            <!-- Form Element sizes -->
	            <div class="card card-primary">
	              <div class="card-body">
	                <!-- <div class="form-group">
						<label for="item_images" class="col-sm-5 control-label">Upload Logo</label>
						<div class="col-sm-12">
							<input type="file" accept="image/*" onchange=""  multiple class="form-control input-sm" id="logoImage">
						</div>
					</div> -->
					<div class="form-group">
						<div class="col-sm-12">
							<img src="<c:url value="/resources/images/image_add_btn.png" />" alt="Logo Preview Not Available" height="150px" width="150px" id="previewImage" class="img-thumbnail" style="background-color: #fff">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-12">
						</div>
					</div>
					<form method="POST" action="" enctype="multipart/form-data" id="imageForm" name="imageForm">
						<div class="input-group mb-3">
							  <div class="input-group-prepend">
							    <span class="input-group-text">Upload Logo</span>
							  </div>
							  <div class="custom-file">
							    <input type="file" class="custom-file-input" accept="image/*" multiple id="logoImage" name="logoImage">
							    <label class="custom-file-label" for="logoImage" id="logoLable">Choose file</label>
							    <input type="hidden" value="0" readonly="readonly" id="imageId">
							  </div>
						</div>
					</form>
	              </div>
	              <!-- /.card-body -->
	            </div>
				<!-- /.row -->
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<div class="progress progress-xxs">
                  <div class="progress-bar progress-bar-danger progress-bar-striped" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%, background-color: #000">
                  </div>
                </div>
				</div>
			</div>
			
			<div class="row no-print">
                <div class="col-12 with-border">
                  <button type="button" id="createBusiness" class="btn btn-block bg-gradient-red mist float-right"><i class="fas fa-file-alt"></i> Save
                  </button>
                  <button type="button" id="clearBusiness" class="btn btn-default bg-gradient-clouds float-right" style="margin-right: 5px;">
                    <i class="fas fa-sync"></i> Clear
                  </button>
                </div>
              </div>
		</div>
		<!-- /.container-fluid -->
	</section>
	<%@ include file="../pages/loading.jsp" %>
</body>
</html>
