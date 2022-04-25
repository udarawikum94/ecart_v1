
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<style type="text/css">
	.rowFunButtons{
		margin-right: 5px;
		cursor:pointer;
	}
	.optionClass{
		background-color: #3498db;
	}
</style>
<script type="text/javascript">
function getCreateEditButtons(id){
	var actionButtons = ""+<c:if test="${DELETE=='TRUE'}"> "<i class='fa fa-fw fa-trash-o deleteIcon' onclick=deleteRecord("+id+")></i>  "+ </c:if>""+
						<c:if test="${UPDATE=='TRUE'}"> "<i class='fa fa-fw fa-edit editIcon' onclick=editRecord("+id+")></i>"+</c:if>"";
	return actionButtons;
};

function getOperationButtons(){
	var actionButtons = ""+<c:if test="${DELETE=='TRUE'}"> "<i class='rowDeleteBtn fa fa-fw fa-trash-o deleteIcon' ></i>  "+ </c:if>""+
						<c:if test="${UPDATE=='TRUE'}"> "<i class='rowEditBtn fa fa-fw fa-edit editIcon' ></i>"+</c:if>"";
	return actionButtons;
};

function getOperationButtons(updateClass, deleteClass, viewClass, cancleClass, optionClass){
	var viewBtn 	= "";
	var deleteBtn 	= "";
	var updateBtn 	= "";
	var cancleBtn 	= "";
	var optionBtn = "";
	
	if(updateClass != "" && updateClass != undefined){
		updateBtn = "<i class='rowFunButtons rowEditBtn fas fa-edit editIcon "+updateClass+"' ></i>  ";
	}
	if(deleteClass!="" && deleteClass != undefined){
		deleteBtn = "<i class='rowFunButtons rowDeleteBtn fas fa-trash deleteIcon "+deleteClass+"' ></i>";
	}
	if(viewClass!="" && viewClass != undefined){
		viewBtn = "<i class='rowFunButtons rowEditBtn fa fa-fw fa-eye editIcon "+viewClass+"' ></i>";
	}
	if(cancleClass!="" && cancleClass != undefined){
		cancleBtn = "<span class='rowFunButtons label label-warning "+cancleClass+"'>Cancel</span>";
	}
	if(optionClass != "" && optionClass != undefined){
		optionBtn = "<span class='rowFunButtons label label-warning "+optionClass+"'><i class='fa fa-ellipsis-v' ></i></span>";
	}
	var actionButtons = ""+<c:if test="${UPDATE=='TRUE'}"> updateBtn +</c:if>""+
						<c:if test="${DELETE=='TRUE'}"> deleteBtn + </c:if>""+
						<c:if test="${VIEW=='TRUE'}"> viewBtn +</c:if>""+
						<c:if test="${CANCEL=='TRUE'}"> cancleBtn +</c:if>""+
						<c:if test="${CANCEL=='TRUE'}"> optionBtn +</c:if>"";
	return updateBtn;
};



/* function getOperationButtonsForOrderCreaton(row, updateClass, deleteClass, viewClass, readyToShipClass, optionClass){
	var viewBtn 		= "";
	var deleteBtn 		= "";
	var updateBtn 		= "";
	var readyToShipBtn 	= "";
	var optionBtn 		= "";
	
	if(updateClass != "" && updateClass != undefined)
		updateBtn = "<i class='rowFunButtons rowEditBtn fa fa-fw fa-edit editIcon "+updateClass+"' id='"+updateClass+"_"+row[0]+"'></i>  ";
	if(deleteClass!="" && deleteClass != undefined)
		deleteBtn = "<i class='rowFunButtons rowDeleteBtn fa fa-fw fa-trash-o deleteIcon "+deleteClass+"' id='"+deleteClass+"_"+row[0]+"'></i>";
	if(viewClass!="" && viewClass != undefined)
		viewBtn = "<i class='rowFunButtons rowEditBtn fa fa-fw fa-eye editIcon "+viewClass+"' id='"+viewClass+"_"+row[0]+"'></i>";
	if(readyToShipClass!="" && readyToShipClass != undefined){
		var status = row[9];
		var disabled = "";
		if(status=="H")
			disabled = "";
		else if(status=="O")
			disabled = "";
        else if(status=="S")
        	disabled = " disabled";
        else if(status=="P")
        	disabled = ""; 
        else
        	disabled = " disabled";
        
		readyToShipBtn = "<button type='button' class='rowFunButtons btn btn-primary btn-sm "+readyToShipClass+"' id='"+readyToShipClass+"_"+row[0]+"' "+disabled+">Ready to ship</button>";
	}
	
	if(optionClass != "" && optionClass != undefined)
		optionBtn = "<span class='btn-sm btn-default "+optionClass+"'><i class='fa fa-ellipsis-v' id='"+optionClass+"_"+row[0]+"'></i></span>";
	
	var actionButtons = ""+<c:if test="${UPDATE=='TRUE'}"> updateBtn +</c:if>""+
						<c:if test="${DELETE=='TRUE'}"> deleteBtn + </c:if>""+
						<c:if test="${VIEW=='TRUE'}"> viewBtn +</c:if>""+
						readyToShipBtn +""+
						<c:if test="${CANCEL=='TRUE'}"> optionBtn +</c:if>"";
	return actionButtons;
}; */
</script>
</head>
<body>

</body>
</html>