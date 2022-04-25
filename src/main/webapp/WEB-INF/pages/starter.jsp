<%@ page isELIgnored="false"%>
<%@ taglib prefix="d" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->



<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="x-ua-compatible" content="ie=edge">

  <title>E cart | My Dashboard</title>

  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="resources/plugins/fontawesome-free/css/all.min.css">
  
  
  <!-- Theme style -->
  <link rel="stylesheet" href="<c:url value="/resources/dist/css/adminlte.min.css" />">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
  <!-- jQuery -->
  <script src="<c:url value="/resources/plugins/jquery/jquery.min.js" />"></script>
  
  <script type="text/javascript">
	  function loadPage(page,titel,jsFile){
	  	$("#div-loading").show();
	  	var element = document.getElementById("test");
	  	
	  	element.src = "load/"+page;
	  	document.getElementById("pageName").innerHTML = titel;
	  	document.getElementById("activePageName").innerHTML = titel;
	  }
  	
	  var contextPath = "";
  	function loadingComplete(){
  		$("#div-loading").hide(); 
  		contextPath = $('#contextPath').val();
  		console.log("queue called")
  		//setTimeout(validateSession(), 10000);
	}
  	
  	function nonstopFunc() {
  		console.log("calling as queue 3");
  		setTimeout(validateSession(), 60000);
  		//getItems();
  	}
  	
  	function validateSession(){
	    var data = {}
		$.post({
			type: "GET",
            contentType: "application/json",
            url: contextPath+"/item/getAllItem",
            dataType: 'json',
            timeout: 600000,
		}, function(data2) {
			if(data2["code"]=="SUCCESS") {
				if (data2["description"]!="" && data2["description"]=="VALID_SESSION") {
					console.log("queue response called")
					nonstopFunc();
				} else {
					alert(data2["description"]);
					console.log("queue response stoped");
				}
			}
		}).done(function() {
			console.log("1");
		}).fail(function(xhr, textStatus, errorThrown) {
			console.log("2");
		})
	}
  	
  	function logOut(){
	    var data = {}
		$.post({
			type: "GET",
            contentType: "application/json",
            url: contextPath+"/logout",
            dataType: 'json',
            timeout: 600000,
		}, function(data2) {
			/* if(data2["code"]=="SUCCESS" && data2["object"]!="") {
				console.log("data2['object']="+data2["object"])
				$('#itemTable').dataTable().fnClearTable();
				$('#itemTable').dataTable().fnAddData(data2["object"]);
		    	
		    	createBtnAction = "UPDATE";
			} */
		}).done(function() {
			console.log("1");
		}).fail(function(xhr, textStatus, errorThrown) {
			console.log("2");
		})
	}
  </script>
  
  <style type="text/css">
		#test {
			width: 100%;
			margin-left: 0px;
			margin-top: 0px;
			background-color: rgb(241, 244, 245);
			min-height: 100%;
			overflow: scroll;
			/* width: 1349px; */
			height: 745px;
			/* border: 1px solid black */;
		}
</style>
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
<input type="hidden" id="contextPath" value="<%=request.getContextPath()%>" readonly></input>

  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#"><i class="fas fa-bars"></i></a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <!-- <a href="index3.html" class="nav-link">Home</a> -->
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <!-- <a href="#" class="nav-link">Contact</a> -->
      </li>
    </ul>

    <!-- SEARCH FORM -->

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
      <!-- Messages Dropdown Menu -->
      <li class="nav-item dropdown">
        <a class="nav-link" data-toggle="dropdown" href="#">
          <i class="far fa-comments"></i>
          <span class="badge badge-danger navbar-badge">3</span>
        </a>
        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
          <a href="#" class="dropdown-item">
            <!-- Message Start -->
            <div class="media">
              <img src="<c:url value="/resources/dist/img/user1-128x128.jpg" />" alt="User Avatar" class="img-size-50 mr-3 img-circle">
              <div class="media-body">
                <h3 class="dropdown-item-title">
                  Brad Diesel
                  <span class="float-right text-sm text-danger"><i class="fas fa-star"></i></span>
                </h3>
                <p class="text-sm">Call me whenever you can...</p>
                <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
              </div>
            </div>
            <!-- Message End -->
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item">
            <!-- Message Start -->
            <div class="media">
              <img src="<c:url value="/resources/dist/img/user8-128x128.jpg" />" alt="User Avatar" class="img-size-50 img-circle mr-3">
              <div class="media-body">
                <h3 class="dropdown-item-title">
                  John Pierce
                  <span class="float-right text-sm text-muted"><i class="fas fa-star"></i></span>
                </h3>
                <p class="text-sm">I got your message bro</p>
                <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
              </div>
            </div>
            <!-- Message End -->
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item">
            <!-- Message Start -->
            <div class="media">
              <img src="<c:url value="/resources/dist/img/user3-128x128.jpg" />" alt="User Avatar" class="img-size-50 img-circle mr-3">
              <div class="media-body">
                <h3 class="dropdown-item-title">
                  Nora Silvester
                  <span class="float-right text-sm text-warning"><i class="fas fa-star"></i></span>
                </h3>
                <p class="text-sm">The subject goes here</p>
                <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
              </div>
            </div>
            <!-- Message End -->
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item dropdown-footer">See All Messages</a>
        </div>
      </li>
      <!-- Notifications Dropdown Menu -->
      <li class="nav-item dropdown">
        <a class="nav-link" data-toggle="dropdown" href="#">
          <i class="far fa-bell"></i>
          <span class="badge badge-warning navbar-badge">15</span>
        </a>
        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
          <span class="dropdown-header">15 Notifications</span>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item">
            <i class="fas fa-envelope mr-2"></i> 4 new messages
            <span class="float-right text-muted text-sm">3 mins</span>
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item">
            <i class="fas fa-users mr-2"></i> 8 friend requests
            <span class="float-right text-muted text-sm">12 hours</span>
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item">
            <i class="fas fa-file mr-2"></i> 3 new reports
            <span class="float-right text-muted text-sm">2 days</span>
          </a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item dropdown-footer">See All Notifications</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#"><i
            class="fas fa-th-large"></i></a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link" data-toggle="dropdown" onclick="logOut();">
          <i class="fas fa-user-circle"></i>
          <!-- <span class="badge badge-danger navbar-badge">3</span> -->
        </a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link" data-toggle="dropdown" href="logOut();">
          <i class="fas fa-power-off"></i>
          <!-- <span class="badge badge-danger navbar-badge">3</span> -->
        </a>
      </li>
    </ul>
  </nav>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-light elevation-4">
    <!-- Brand Logo -->
    <a href="index3.html" class="brand-link">
      <img src="<c:url value="/resources/images/logo-001.jpg" />" alt="PvD Logo" class="brand-image img-circle elevation-3"
           style="opacity: .8">
      <span class="brand-text font-weight-light">E cart</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="<c:url value="/resources/dist/img/user2-160x160.jpg" />" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="#" class="d-block">Admin User</a>
        </div>
      </div>
      
      <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <!-- SidebarSearch Form -->
      <div class="form-inline">
        <div class="input-group" data-widget="sidebar-search">
          <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
          <div class="input-group-append">
            <button class="btn btn-sidebar">
              <i class="fas fa-search fa-fw"></i>
            </button>
          </div>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <li class="nav-item has-treeview menu-open">
           
            <c:forEach items="${menu}" var="levelOne">
              <c:set var="lv1program" value="${levelOne.program}"></c:set>
              <c:set var="lv1prgId" value="${lv1program.programId}"></c:set>
              <c:set var="lv1sId" value="${levelOne.url}"></c:set>
              <c:set var="lv1parentId" value="${lv1program.parentId}"></c:set>
              <c:set var="lv1icon" value="${lv1program.icon}"></c:set>
              <c:set var="lv1description" value="${lv1program.description}"></c:set>
              <c:set var="lv1isEndProgram" value="${lv1program.isEndProgram}"></c:set>
              <c:if test="${lv1parentId == 0}">
                 <li class="nav-item has-treeview">
		            <a href="#" class="nav-link">
		              <i class="nav-icon fas fa-copy"></i>
		              <p>
		                <c:out value="${lv1description}"/>
		                <i class="fas fa-angle-left right"></i>
		                <!-- <span class="badge badge-info right">6</span> -->
		              </p>
		            </a>
		            <c:if test="${lv1isEndProgram == 0}">
	                     <c:forEach items="${menu}" var="levelTwo">
	                        <c:set var="lv2program" value="${levelTwo.program}"></c:set>
	                        <c:set var="lv2prgId" value="${lv2program.programId}"></c:set>
	                        <c:set var="lv2parentId" value="${lv2program.parentId}"></c:set>
	                        <c:set var="lv2icon" value="${lv2program.icon}"></c:set>
	                        <c:if test="${lv1prgId==lv2parentId}">
	                          <%-- <li onclick="loadPage('<co:out value="${lv2program.sId}"/>','<co:out value="${lv2program.description}"/>','<co:out value="${lv2program.jsFile}"/>')"><a href="#"><i class="<co:out value="${lv2icon}"/>"></i><co:out value="${lv2program.description}"/></a></li>
		                       --%>
		                      <ul class="nav nav-treeview" style="display: none;">
				              <li class="nav-item" 
				              onclick="loadPage('<c:out value="${levelTwo.url}"/>','<c:out value="${lv2program.description}"/>','<c:out value="${lv2program.jspFile}"/>')">
				                <a href="#" class="nav-link">
				                  <i class="far fa-circle nav-icon"></i>
				                  <p><c:out value="${lv2program.description}"/></p>
				                </a>
				              </li>
				            </ul>
	                        </c:if>   
	                      </c:forEach>
	                </c:if>
		          </li>
              </c:if>
            </c:forEach>
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark" id="pageName">My Dashboard</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a onclick="loadPage('dashboard.do?even=1:&amp;prgId=50&amp;page=Dashboard','My Dashboard','Dashboard')">Home</a></li>
              <li class="breadcrumb-item active" id="activePageName">My Dashboard</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <iframe id="test" src="about:blank"  frameborder="0" scrolling="yes" onload="loadingComplete()"></iframe>
    <!-- <div class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-lg-6">
            <div class="card">
              <div class="card-body">
                <h5 class="card-title">Card title</h5>

                <p class="card-text">
                  Some quick example text to build on the card title and make up the bulk of the card's
                  content.
                </p>

                <a href="#" class="card-link">Card link</a>
                <a href="#" class="card-link">Another link</a>
              </div>
            </div>

            <div class="card card-primary card-outline">
              <div class="card-body">
                <h5 class="card-title">Card title</h5>

                <p class="card-text">
                  Some quick example text to build on the card title and make up the bulk of the card's
                  content.
                </p>
                <a href="#" class="card-link">Card link</a>
                <a href="#" class="card-link">Another link</a>
              </div>
            </div>/.card
          </div>
          /.col-md-6
          <div class="col-lg-6">
            <div class="card">
              <div class="card-header">
                <h5 class="m-0">Featured</h5>
              </div>
              <div class="card-body">
                <h6 class="card-title">Special title treatment</h6>

                <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                <a href="#" class="btn btn-primary">Go somewhere</a>
              </div>
            </div>

            <div class="card card-primary card-outline">
              <div class="card-header">
                <h5 class="m-0">Featured</h5>
              </div>
              <div class="card-body">
                <h6 class="card-title">Special title treatment</h6>

                <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                <a href="#" class="btn btn-primary">Go somewhere</a>
              </div>
            </div>
          </div>
          /.col-md-6
        </div>
        /.row
      </div>/.container-fluid
    </div> -->
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
    <div class="p-3">
      <h5>Title</h5>
      <p>Sidebar content</p>
    </div>
  </aside>
  <!-- /.control-sidebar -->

  <!-- Main Footer -->
  <footer class="main-footer">
    <!-- To the right -->
    <div class="float-right d-none d-sm-inline">
      Powered by Onenro Solutions.
    </div>
    <!-- Default to the left -->
    <strong>Copyright &copy; 2020 <a href="#">PVD Cablings</a>.</strong> All rights reserved.
  </footer>
</div>
<!-- ./wrapper -->

<!-- REQUIRED SCRIPTS -->

<!-- Bootstrap 4 -->
<script src="<c:url value="/resources/plugins/bootstrap/js/bootstrap.bundle.min.js" />"></script>
<!-- AdminLTE App -->
<script src="<c:url value="/resources/dist/js/adminlte.min.js" />"></script>
</body>
</html>
