<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    
    <link rel="stylesheet" href="<c:url value="/resources/plugins/fontawesome-free/css/all.min.css" />">
    <link rel="stylesheet" href="<c:url value="/resources/plugins/fontawesome-free/css/fontawesome.css" />">
    <link rel="stylesheet" href="<c:url value="/resources/dist/css/adminlte.css" />">
    <link rel="stylesheet" href="<c:url value="/resources/plugins/fontawesome-free/css/all.min.css" />">
    <link rel="stylesheet" href="<c:url value="/resources/css/aw/aw.css" />">
    <link rel="stylesheet" href="<c:url value="/resources/plugins/toastr/toastr.css" />">
    <%-- <link rel="stylesheet" href="<c:url value="/resources/plugins/fontawesome-free/css/all.min.css" />css/aw/aw.css"> --%>
    <%-- <link rel="stylesheet" href="<c:url value="/resources/bootstrap/css/bootstrap.min.css" />"> --%>
	
	<script src="<c:url value="/resources/js/aw/aw.js" />"></script>
    <script src="<c:url value="/resources/plugins/jquery/jquery.min.js" />"></script>
    <script src="<c:url value="/resources/plugins/bootstrap/js/bootstrap.min.js" />"></script>
    <script src="<c:url value="/resources/js/ajax.js" />"></script>
    <script src="<c:url value="/resources/js/Commonjs.js" />"></script>
    <%-- <script src="<c:url value="/resources/plugins/datatables/jquery.dataTables.min.js" />"></script> --%>
    <script src="<c:url value="/resources/plugins/toastr/toastr.min.js" />"></script>
    
    
  <title></title>
  <style type="text/css">
    #userAccessGrid {width: 100%; height: 100%;}
    #userAccessGrid .aw-grid-row {border-bottom: 1px solid threedlightshadow;}
    #userAccessGrid .aw-mouseover-row {background: #ccc}
    #userAccessGrid .aw-column-0 {text-align: left; width: 400px;}
    #userAccessGrid .aw-column-1 {text-align: center; width: 100px;}
    #userAccessGrid .aw-column-2 {text-align: center; width: 100px;}
  </style>
  <script type="text/javascript">

	function getSystemTree(){
		userAccConGrid.loading();
	    var data = {}
		$.post({
			type: "GET",
            contentType: "application/json",
            url: contextPath+"/access/getSystemTree",
           // data: JSON.stringify(data),
            dataType: 'json',
            timeout: 600000,
		}, function(data2) {
			if(data2["code"]=="success"){
				console.log("test1");
				setGridData(userAccConGrid, data2["object"]);
				console.log("test2");
            	userAccConGrid.loadingCompleted();
            	console.log("test3");
            	for(i=0; i<userAccConGrid.getRowCount(); i++){
            		console.log("test4");
            		userAccConGrid.setCellValue(false, 0, i);
            	}
			}
			//console.log(data2["object"]);
		}).done(function() {
			console.log("1");
		}).fail(function(xhr, textStatus, errorThrown) {
			console.log("2");
		}).always(function() {
			console.log("3");
		});
	}

	function getAllUserTypes(){
	    var data = {}
		$.post({
			type: "GET",
            contentType: "application/json",
            url: contextPath+"/access/getUserTypes",
           // data: JSON.stringify(data),
            dataType: 'json',
            timeout: 600000,
		}, function(data2) {
			if(data2["code"]=="success"){
				 document.getElementById("userTypeCode").options.length = 0;
				 var obj = document.getElementById("userTypeCode");
				 var arr=data2["object"];

				var opt = document.createElement("option");
			    opt.text='--Select--';
			    opt.value=0;	
			    obj.appendChild(opt); 
				 
				 for (var x = 0; x < arr.length; x++) {
					var opt = document.createElement("option");
				    opt.text=arr[x]['description'];
				    opt.value=arr[x]['userTypeId'];	
				    obj.appendChild(opt); 
				} 
			}
		}).done(function() {
			console.log("1");
		}).fail(function(xhr, textStatus, errorThrown) {
			console.log("2");
		})
	}
	
	function getUserAccess(){
		userAccConGrid.loading();
	    var data = {}
		$.post({
			type: "GET",
            contentType: "application/json",
            url: contextPath+"/access/getUserAccess?userTypeId="+document.getElementById("userTypeCode").value,
           // data: JSON.stringify(data),
            dataType: 'json',
            timeout: 600000,
		}, function(data2) {
			if(data2["code"]=="SUCCESS"){
				var message = data2["object"];
				for(i=0; i<userAccConGrid.getRowCount(); i++){
            		userAccConGrid.setCellValue(false, 0, i);
            	}
            	for(i=0; i<userAccConGrid.getRowCount(); i++){
            		for (var x = 0; x < message.length; x++) {
            			if(userAccConGrid.getCellText(2,i) == message[x][0] && userAccConGrid.getCellText(1,i) == message[x][1]){
							userAccConGrid.setCellValue(true, 0, i);
						}
					}
            	}
            	userAccConGrid.loadingCompleted();
			}
		}).done(function() {
			console.log("1");
		}).fail(function(xhr, textStatus, errorThrown) {
			console.log("2");
		}).always(function() {
			console.log("3");
		});
	}

	function createUserAccess(){
	    var data = {}
		$.post({
			type: "POST",
            contentType: "application/json",
            url: contextPath+"/access/createUserAccess?userTypeId="+document.getElementById("userTypeCode").value+getProgramRights(),
           // data: JSON.stringify(data),
            dataType: 'json',
            timeout: 600000,
		}, function(data2) {
			if(data2["code"]=="SUCCESS"){
				userAccConGrid.loadingCompleted();
				Command: toastr["success"](data2["description"]);
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

	function getProgramRights(){
		var events = "";
		var programs = "";
		for(i=0; i<userAccConGrid.getRowCount(); i++){
			if(userAccConGrid.getCellValue(0,i)==true){
				if(userAccConGrid.getCellText(3,i)==1){
					programs=programs+userAccConGrid.getCellText(1,i)+"<ROW>";
				}else if(userAccConGrid.getCellText(3,i)==0){
					events=events+userAccConGrid.getCellText(1,i)+"<@>"+userAccConGrid.getCellText(2,i)+"<ROW>";
				}
			}
		}
		return "&programs="+programs+"&events="+events;
	}

	function clearGrid(){
		for(i=0; i<userAccConGrid.getRowCount(); i++){
			userAccConGrid.setCellValue(false, 0, i);
		}
	}

	function validateCreate(){
		if($("#userTypeId").val()==null || $("#userTypeId").val()==""){
			$("#err").html("User type is required");
			resetCreate();
			return false;
		}else{
			createUserAccess();
			resetCreate();
		}
	}

	var contextPath;
	$( document ).ready(function() {
		contextPath = $('#contextPath').val();
		getSystemTree();
		getAllUserTypes();
	});
  </script>
</head>
<body>
	<section class="content">
      <div class="container-fluid">
      	  <br>
	      <div class="row">
	          <!-- left column -->
	          <div class="col-md-4 offset-md-4">
       			<input type="hidden" id="userTypeId">
			     <input type="hidden" id="contextPath" value="<%=request.getContextPath()%>" readonly></input>
				     <div class="form-group">
                       <label>User Type</label>
                       <select class="form-control" id="userTypeCode" onchange="getUserAccess()">
                         <option>option 1</option>
                       </select>
                     </div>
          	  </div>
          </div>
        <div class="row">
          <!-- left column -->
          <div class="col-md-12">
            <!-- general form elements -->
            <div class="card card-primary">
              <!-- <div class="card-header">
                <h3 class="card-title">Quick Example</h3>
              </div> -->
              <!-- /.card-header -->
                <div class="card-body" style="height:570px">
                  <script type="text/javascript">
					var myHeaders = ["Description"];//"programId", "parentid","is program"
					var userAccConGrid = createGrid('userAccessGrid', myHeaders, []);
					userAccConGrid.setHeaderVisible(false);
					userAccConGrid.setSelectorVisible(false);
					userAccConGrid.setSelectionMode("none");
					userAccConGrid.setCellTemplate(new AW.Templates.Checkbox, 0);
					userAccConGrid.onCellValueChanged = function(value, column, row){
						if (value==false) {
					        var programId = this.getCellText(1, row);
					        for(var i=0; i<userAccConGrid.getRowCount(); i++){
					            var parentId = this.getCellText(2, i);
					            if(programId == parentId){
					                if(value == true){
					                    userAccConGrid.setCellValue(true, 0, i);
					                }else{
					                    userAccConGrid.setCellValue(false, 0, i);
					                }
					            }
					        }
					    }
		
					    if (value == true) {
					        var prntId = this.getCellText(2, row);
					        for(var x=0; x<userAccConGrid.getRowCount(); x++){
					            var progId = this.getCellText(1, x);
					            if(prntId == progId){
					                if(value == true){
					                    userAccConGrid.setCellValue(true, 0, x);
					                }else{
					                    userAccConGrid.setCellValue(false, 0, x);
					                }
					            }
					        }
					    }
					}
					 document.write(userAccConGrid);
				</script>
                </div>
                <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!--/.col (right) -->
        </div>
        <!-- /.row -->
        <div class="row">
        	<div class="col-md-2 offset-md-10">
        		<button type="button" class="btn btn-block bg-gradient-primary" onclick="createUserAccess()">Save</button>
        	</div>
        </div>
      </div><!-- /.container-fluid -->
    </section>
</body>
</html>
