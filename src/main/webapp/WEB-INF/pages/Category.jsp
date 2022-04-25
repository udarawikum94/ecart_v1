<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
  <title></title>
  <style type="text/css">
    #userTypeGrid {width: 100%; height: 500px;}
    #userTypeGrid .aw-grid-row {border-bottom: 1px solid threedlightshadow;}
    #userTypeGrid .aw-mouseover-row {background: #ccc}
    #userTypeGrid .aw-column-0 {text-align: left; width: 200px;}
    #userTypeGrid .aw-column-1 {text-align: left; width: 300px;}
    #userTypeGrid .aw-column-2 {text-align: left; width: 200px;}
    #userTypeGrid .aw-column-3 {text-align: center; width:100px;}
    #userTypeGrid .aw-column-5 {text-align: center; width:100px;}
  </style>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>User Type</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  
    <link rel="stylesheet" href="<c:url value="/resources/plugins/fontawesome-free/css/all.min.css" />">
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

    var userTable;
	function createuserTable(){
		userTable = $('#userTable').DataTable( {
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
	             { data: 'categoryId', title: "Id" },
	             { data: 'description', title: "Description" },
	             { data: null, title: "Action", defaultContent: getOperationButtons("updateBtn", "deleteBtn","viewBtn","",""), },
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

		$('#userTable tbody').on( 'click', '.updateBtn', function () {
	        var data = userTable.row($(this).parents('tr')).data();
	        createBtnAction = "UPDATE";
		    $('#id').val(data["categoryId"]);
			$('#description').val(data["description"]);
			$('#myModal').modal('show');
	    } );
	}

	
	
	$( document ).ready(function() {
		var contextPath = $('#contextPath').val();
		createuserTable();
		getAllCategories();

		function getUpdateModel(){
		
		}
		
		function getAllCategories(){
	    	var data = {}
			$.post({
				type: "GET",
	            contentType: "application/json",
	            url: contextPath+"/category/getAll",
	           // data: JSON.stringify(data),
	            dataType: 'json',
	            timeout: 600000,
			}, function(data2) {
				if(data2["code"]=="SUCCESS"){
					$('#userTable').dataTable().fnClearTable();
					if(data2["object"].length>0)
						$('#userTable').dataTable().fnAddData(data2["object"]);
				}
			}).done(function() {
				console.log("1");
			}).fail(function(xhr, textStatus, errorThrown) {
				console.log("2");
			}).always(function() {
				console.log("3");
			});
	    }

		var createBtnAction;
		$( "#getCreate" ).click(function() {
			createBtnAction = "CREATE";
			clearAll();
			$('#myModal').modal('show');
		});


		$( "#createButton" ).click(function() {
			if(validation()){
				if(createBtnAction == "CREATE"){
					createCategory();
				}else{
					updateUserTypes();
				}
			};
		});

		function clearAll(){
			$("#id").val(0);
			$("#description").val("");
		}

		function validation(){
			if($("#description").val()==""){
				Command: toastr["error"]("Description is required !");
				return false;
			}
			return true;
		}

		function createCategory(){
	    	var data = {};
	    	data["description"] = $("#description").val();	
		    	
			$.post({
				type: "POST",
	            contentType: "application/json",
	            url: contextPath+"/category/create",
	            data: JSON.stringify(data),
	            dataType: 'json',
	            timeout: 600000,
			}, function(data2) {
				if(data2["code"]=="SUCCESS"){
					Command: toastr["success"](data2["description"]);
					getAllCategories();
					$('#myModal').modal('hide');
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

		function updateUserTypes(){
	    	var data = {};
	    	data["categoryId"] = $("#id").val();
	    	data["description"] = $("#description").val();
	    	
			$.post({
				type: "POST",
	            contentType: "application/json",
	            url: contextPath+"/category/update",
	            data: JSON.stringify(data),
	            dataType: 'json',
	            timeout: 600000,
			}, function(data2) {
				
				//var json = JSON.parse(data2);
				if(data2["code"]=="SUCCESS"){
					$('#userTable').dataTable().fnAddData(data2["object"]);					
					getAllCategories();
					$('#myModal').modal('hide');
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

		function deleteCategory(dataArr){
		    var data = {};
	    	data["id"] = dataArr["categoryId"];	
			$.post({
				type: "POST",
	            contentType: "application/json",
	            url: contextPath+"/category/delete?id="+dataArr["categoryId"],
	            data: JSON.stringify(data),
	            dataType: 'json',
	            timeout: 600000,
			}, function(data2) {
				if(data2["code"]=="SUCCESS"){
					Command: toastr["success"](data2["description"]);
					getAllCategories();
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

		$('#userTable tbody').on( 'click', '.deleteBtn', function () {
	        var dataArr = userTable.row($(this).parents('tr')).data();
	        deleteCategory(dataArr);
	    } );
	    
	});

	</script>
</head>
<body class="bodyClass"><!-- onload="getAllUserTypes()"  -->
<input type="hidden" id="contextPath" value="<%=request.getContextPath()%>" readonly></input>
	
	</br>
	<section class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-1">
					<c:if test="${CREATE=='TRUE'}">
						<button type="button" class="btn btn-block bg-gradient-primary" data-toggle="modal" id="getCreate">Create</button>
					</c:if>	
				</div>
			</div></br>
			
			<div class="row">
				<!-- left column -->
				<div class="col-md-12">
					<!-- general form elements -->
					<div class="card card-primary card-outline">
						<!-- <div class="card-header">
							<h3 class="card-title">Quick Example</h3>
						</div> -->
						<!-- /.card-header -->
						<!-- form start -->
						<form role="form">
							<div class="card-body">
								<%@ include file="../resources/js/aw/actionButton.jsp" %>
								<table class="table table-hover text-nowrap" id="userTable" style="width:100%">
								</table>
							</div>
						</form>
					</div>
					<!-- /.card -->
				</div>
				<!--/.col (left) -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container-fluid -->
	</section>
	
	 <div class="modal fade" id="myModal">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">Category Creation</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <div role="form">
                <div class="card-body">
                  <div class="form-group">
                    <label for="exampleInputEmail1">Description</label>
                    <input type="hidden" class="form-control" id="id" placeholder="Enter userName">
                    <input type="text" class="form-control" id="description" placeholder="Enter Description">
                  </div>
                </div>
                <!-- /.card-body -->
              </div>
            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
              <button type="button" id="createButton" class="btn btn-primary">Save changes</button>
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->
</body>
</html>
