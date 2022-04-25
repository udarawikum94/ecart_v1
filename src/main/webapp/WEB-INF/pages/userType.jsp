<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
  <title></title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Re Order Level</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  	
  	<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <link rel="stylesheet" href="<c:url value="/resources/plugins/fontawesome-free/css/all.min.css" />">
    <%-- <link rel="stylesheet" href="<c:url value="/resources/bootstrap/css/bootstrap.css" />"> --%>
    <link rel="stylesheet" href="<c:url value="/resources/plugins/fontawesome-free/css/fontawesome.css" />">
    <link rel="stylesheet" href="<c:url value="/resources/dist/css/adminlte.css" />">
    <link rel="stylesheet" href="<c:url value="/resources/plugins/fontawesome-free/css/all.min.css" />">
    <link rel="stylesheet" href="<c:url value="/resources/css/aw/aw.css" />">
    <link rel="stylesheet" href="<c:url value="/resources/plugins/toastr/toastr.css" />">
    <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap4-toggle.min.css" />">
    
  	<!-- DataTables -->
  	<link rel="stylesheet" href="<c:url value="/resources/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css" />">
  	<link rel="stylesheet" href="<c:url value="/resources/plugins/datatables-responsive/css/responsive.bootstrap4.min.css" />">
  	<link rel="stylesheet" href="<c:url value="/resources/plugins/datatables-buttons/css/buttons.bootstrap4.min.css" />">
  	
	<!-- iCheck for checkboxes and radio inputs -->
	<link rel="stylesheet" href="<c:url value="/resources/plugins/icheck-bootstrap/icheck-bootstrap.min.css" />">
	
	<script src="<c:url value="/resources/js/aw/aw.js" />"></script>
    <script src="<c:url value="/resources/plugins/jquery/jquery.min.js" />"></script>
    <script src="<c:url value="/resources/plugins/bootstrap/js/bootstrap.min.js" />"></script>
    <script src="<c:url value="/resources/js/ajax.js" />"></script>
    <script src="<c:url value="/resources/js/Commonjs.js" />"></script>
    <script src="<c:url value="/resources/plugins/datatables/jquery.dataTables.min.js" />"></script>
    <script src="<c:url value="/resources/plugins/toastr/toastr.min.js" />"></script>
    <script src="<c:url value="/resources/js/bootstrap4-toggle.min.js" />"></script>
    <script src="<c:url value="/resources/js/sweetalert2.js" />"></script>
    
	<!-- DataTables  & Plugins -->
	<script src="<c:url value="/resources/plugins/datatables/jquery.dataTables.min.js" />"></script>
	<script src="<c:url value="/resources/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js" />"></script>
	<script src="<c:url value="/resources/plugins/datatables-responsive/js/dataTables.responsive.min.js" />"></script>
	<script src="<c:url value="/resources/plugins/datatables-responsive/js/responsive.bootstrap4.min.js" />"></script>
	<script src="<c:url value="/resources/plugins/datatables-buttons/js/dataTables.buttons.min.js" />"></script>
	<script src="<c:url value="/resources/plugins/datatables-buttons/js/buttons.bootstrap4.min.js" />"></script>
	<script src="<c:url value="/resources/plugins/jszip/jszip.min.js" />"></script>
	<script src="<c:url value="/resources/plugins/pdfmake/pdfmake.min.js" />"></script>
	<script src="<c:url value="/resources/plugins/pdfmake/vfs_fonts.js" />"></script>
	<script src="<c:url value="/resources/plugins/datatables-buttons/js/buttons.html5.min.js" />"></script>
	<script src="<c:url value="/resources/plugins/datatables-buttons/js/buttons.print.min.js" />"></script>
	<script src="<c:url value="/resources/plugins/datatables-buttons/js/buttons.colVis.min.js" />"></script>
    <script type="text/javascript">

    var userTypeTable;
	function createUserTypeTable(){
		userTypeTable = $('#itemTable').DataTable( {
			createdRow: function( row, data, dataIndex ) {
		      $(row).attr('id', 'row_'+data[0]);
		  },
			"dom": '<"toolbarOrdersTable">frtip',
			"bFilter":false,
			select: {
	            style: 'multi'
	        },
	 		"bPaginate": false,
	         data: [],
	         columns: [
	             { data: 'id', title: "Id" },
	             { data: 'code', title: "Code" },
	             { data: 'description', title: "Description" },
	             { data: null, title: "Action", defaultContent: getOperationButtons("updateBtn", "deleteBtn","viewBtn"), },
	         ],
	         
	         "columnDefs": [
             {
	             "targets": [ 0 ],
	             "visible": false,
	             "searchable": false
	         },{
	             "targets": [ 1 ],
	             "className": "dt-left",
	         },{
	             "targets": [ 2 ],
	             "className": "dt-left",
	         },]
	     } );

		/* $('#itemTable tbody').on( 'click', '.updateBtn', function () {
	        var data = userTypeTable.row($(this).parents('tr')).data();
	        createBtnAction = "UPDATE";
		    $('#id').val(data["userTypeId"]);
			$('#code').val(data["code"]);
			$('#desc').val(data["description"]);
			$('#myModal').modal('show');
	    } ); */
		
		 
	}
	
	$(function () {
	    /* $("#example1").DataTable({
	      "responsive": true, "lengthChange": false, "autoWidth": false,
	      "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
	    }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)'); */
	    userTypeTable = $('#itemTable').DataTable({
	      "paging": true,
	      "lengthChange": true,
	      "searching": true,
	      "ordering": true,
	      "info": true,
	      "autoWidth": false,
	      "responsive": true,
	      data: [],
          columns: [
             { data: 'id', title: "Id" },
             { data: 'code', title: "Code" },
             { data: 'description', title: "Description" },
             { data: 'status', title: "Status" },
             //{ data: 'createdUser', title: "Created User" },
            // { data: 'createdDate', title: "Created Date" },
            // { data: 'modifiedUser', title: "Modified User" },
             //{ data: 'modifiedDate', title: "Modified Date" },
             //{ data: 'version', title: "Version" },
             { data: null, title: "Action", defaultContent: getOperationButtons("updateBtn", "deleteBtn","viewBtn") },
          ],
          "columnDefs": [
      	 	 {
             "targets": [ 0 ],
             "visible": false,
             "searchable": false
          },{
             "targets": [ 1 ],
          },{
             "targets": [ 2 ],
          },{
             "targets": [ 3 ],
          }/*,{
             "targets": [ 4 ],
             "visible": false,
             "searchable": false
          },{
             "targets": [ 5 ],
             "visible": false,
             "searchable": false
          },{
             "targets": [ 6 ],
             "visible": false,
             "searchable": false
          },{
             "targets": [ 7 ],
             "visible": false,
             "searchable": false
          },{
             "targets": [ 8 ],
             "visible": false,
             "searchable": false
          }*/]
	    
	    });
	  });
	
	$('#itemTable tbody').on( 'click', 'updateBtn', function () {
		  alert("userTypeTable"+ userTypeTable);
	    } );
	
	$( document ).ready(function() {
		var contextPath = $('#contextPath').val();
		getData();

		var createBtnAction = "CREATE";
		$( "#getCreate" ).click(function() {
			createBtnAction = "CREATE";
			clearAll();
		});

		$( "#createBusiness" ).click(function() {
			if(validation()){
				if(createBtnAction == "CREATE"){
					create();
				}else{
					update();
				}
			};
		});
		
		$( "#clearBusiness" ).click(function() {
			clearAll();
		});

		function clearAll(){
			$("#id").val(0);
	    	$("#code").val("");
	    	$("#description").val("");
	    	$("#status").val("");
	    	$("#version").val("");
		}

		function validation(){
			if($("#code").val()==""){
				Command: toastr["error"]("Code is required !");
				return false;
			}
			if($("#description").val()==""){
				Command: toastr["error"]("Description is required !");
				return false;
			}
			return true;
		}

		function create(){
	    	var data = {};
	    	console.log("create data");
	    	
	    	if($("#code").val()!=""){
	    		data["code"] = $("#code").val();
	    	}
	    	
	    	if($("#description").val()!=""){
	    		data["description"] = $("#description").val();
	    	}
	    	
	    	if($("#status").val()!=""){
	    		data["status"] = $("#status").val();
	    	}
	    	
	    	console.log($("#code").val());
	    	console.log($("#description").val());
	    	console.log($("#status").val());
			$.post({
				type: "POST",
	            contentType: "application/json",
	            url: contextPath+"/userType/createUserType",
	            data: JSON.stringify(data),
	            dataType: 'json',
	            timeout: 600000,
			}, function(data2) {
				if(data2["code"]=="SUCCESS"){
					Command: toastr["success"](data2["description"]);
					getData();
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

		function update(){
	    	var data = {};
	    	data["id"] = $("#id").val();
			data["version"] = $("#version").val();
	    	data["description"] = $("#description").val();
	    	data["status"] = $("#status").val();
	    	
			$.post({
				type: "POST",
	            contentType: "application/json",
	            url: contextPath+"/userType/updateUserType",
	            data: JSON.stringify(data),
	            dataType: 'json',
	            timeout: 600000,
			}, function(data2) {
				if(data2["code"]=="SUCCESS"){
					Command: toastr["success"](data2["description"]);
					getData();
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

		function getData(){
		    var data = {}
			$.post({
				type: "GET",
	            contentType: "application/json",
	            url: contextPath+"/userType/getAlluserTypes",
	            dataType: 'json',
	            timeout: 600000,
			}, function(data2) {
				if(data2["code"]=="SUCCESS" && data2["object"]!="") {
					console.log("data2['object']="+data2["object"])
					$('#itemTable').dataTable().fnClearTable();
					$('#itemTable').dataTable().fnAddData(data2["object"]);
			    	
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
<body class="bodyClass">
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
	          <div class="col-12">
	            <div class="card">
	              <div class="card-header">
	                <!-- <h3 class="card-title">DataTable with minimal features & hover style</h3> -->
	              </div>
	              <!-- /.card-header -->
	              <div class="card-body">
	              <%@ include file="../resources/js/aw/actionButton.jsp" %>
	                <table id="itemTable" class="table table-bordered table-hover">
	                  <thead>
	                  <tr>
	                    <th>Id</th>
	                    <th>Code</th>
	                    <th>Description</th>
	                    <th>Status</th>
	                    <th>Action</th>
	                  </tr>
	                  </thead>
	                  <tfoot>
	                  <tr>
	                    <th>Id</th>
	                    <th>Code</th>
	                    <th>Description</th>
	                    <th>Status</th>
	                    <th>Action</th>
	                  </tr>
	                  </tfoot>
	                </table>
	              </div>
	              <!-- /.card-body -->
	            </div>
	            <!-- /.card -->
	           </div>
	        </div>
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
	                    <label for="code">Code</label>
	                    <input type="text" class="form-control" id="code" name="code">
	                  </div>
	                  <div class="form-group">
	                    <label for=description>Description</label>
	                    <input type="text" class="form-control" id="name" name="name">
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
	                  <div class="form-group">
	                    <label for="status">Status </label>
						<input type="checkbox" checked="true" data-toggle="toggle" data-on="Active" data-off="In-Active" data-onstyle="outline-success" data-offstyle="outline-danger">
	                  </div>
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
	<script>
	  
	  
	</script>
</body>
</html>
