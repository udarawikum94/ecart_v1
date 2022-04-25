function createUserType() {
	if(document.getElementById("company").value=="0" || document.getElementById("company").value==""){
		document.getElementById("divCompany").innerHTML = "Company is required";
		return false;
	}
    var r = confirm("Are you sure. you want to create a record!");
    if (r == true) {
        var code = document.getElementById("code").value;
        var description = document.getElementById("description").value;
        var CompanyId = document.getElementById("company").value;
        var data = "dispatch=createUserType&code=" + code + "&description=" + description +"&CompanyId="+CompanyId;
        var ajax = new ajaxObject("userTypeAction.do");
        ajax.callback = function(responseText, responseStatus, responseXML) {
            if (responseStatus == 200) {
                var message = eval('(' + responseText + ')');
                if (message['saveSuccess']) {                   
                    alert(message["saveSuccess"]);
                    clearErrFields();
                    clearFields();
                    getAllUserTypes()
                }else if(message['error']){
                    alert(message['error']);
                }else{
                    getErrors(message); 
                    
                }
                resetCreate();
            }
        }
        ajax.update(data, "POST");
    } else {
        return false;
    }
}

function updateUserType(){
	if(document.getElementById("company").value=="0" || document.getElementById("company").value==""){
		document.getElementById("divCompany").innerHTML = "Company is required";
		return false;
	}
    var r = confirm("Are you sure. you want to update a record!");
    if (r == true) {
        var id = document.getElementById("userTypeId").value;
        var code = document.getElementById("code").value;
        var description = document.getElementById("description").value;
        var CompanyId = document.getElementById("company").value;
        var data = "dispatch=updateUserType&code=" + code + "&description=" + description+ "&id="+id+"&CompanyId="+CompanyId;;
        var ajax = new ajaxObject("userTypeAction.do");
        ajax.callback = function(responseText, responseStatus, responseXML) {
            if (responseStatus == 200) {
                var message = eval('(' + responseText + ')');
                if (message['updateSuccess']) {                 
                    alert(message["updateSuccess"]);
                    clearErrFields();
                    clearFields();
                    getAllUserTypes();
                }else if(message['error']){
                    alert(message['error']);
                }else{
                    getErrors(message); 
                }
                resetModify();
            }
        }
        ajax.update(data, "POST");
    } else {
        return false;
    }
}

function deleteRecord(id){
    var r = confirm("Are you sure. you want to delete this record!");
    if (r == true) {
        var data = "dispatch=deleteUserType&code=" + "&id="+id;
        var ajax = new ajaxObject("userTypeAction.do");
        ajax.callback = function(responseText, responseStatus, responseXML) {
            if (responseStatus == 200) {
                var message = eval('(' + responseText + ')');
                if (message['deleteSuccess']) {                 
                    alert(message["deleteSuccess"]);
                    clearErrFields();
                    clearFields();
                    getAllUserTypes();
                }else if(message['error']){
                    alert(message['error']);
                }else{
                    getErrors(message); 
                }
            }
        };
        ajax.update(data, "POST");
    } else {
        return false;
    }
}

function getAllUserTypes() {
	obj.loading();
    var data = "dispatch=getAlluserTypes";
    var ajax = new ajaxObject("userTypeAction.do");
    ajax.callback = function(responseText, responseStatus, responseXML) {
        if (responseStatus == 200) {
            var message = eval('(' + responseText + ')');
            if(message['error']){
                alert(message['error']);
            }else{
                setButtonGridData(obj,message,4,4);
                obj.loadingCompleted();
            }
        }
    }
    ajax.update(data, "POST");
}

function getCreateModel(){
    clearErrFields();
    clearFields();
    buttonVisibility("save");
    $('#myModal').modal('show');
}

function editRecord(id){
    var index = obj.getCurrentRow();
    clearErrFields();
    $("#userTypeId").val(obj.getCellText(5,index));
    $("#code").val(obj.getCellText(0,index));
    $("#description").val(obj.getCellText(1,index));
    $("#company").val(obj.getCellText(3,index));
    buttonVisibility("edit");
    $('#myModal').modal('show');
}

function clearFields(){
    $("#userTypeId").val(0);
    $("#code").val("");
    $("#description").val("");
    document.getElementById("company").value = "0";
}

function validateCreate(){
    if ($("#divCode").html()=="" && $("#divDescription").html()==""){
        createUserType();
    }
    resetCreate();
}

function validateModify(){
    if ($("#divCode").html()=="" && $("#divDescription").html()==""){
        updateUserType();
    }
    	resetModify();
}

function getErrors(message){
    for (var i = 0; i < message.length; i++) {
        if(message[i]['code']){
            document.getElementById("divCode").innerHTML=message[i]['code'];
        }else if(message[i]['description']){
            document.getElementById("divDescription").innerHTML=message[i]['description'];
        }else if(message[i]['CompanyId']){
        	 document.getElementById("divCompany").innerHTML=message[i]['CompanyId'];
        }
    }
}

function clearErrFields(){
    $("#divCode").html('');
    $("#divDescription").html('');
    $("#divCompany").html('');
}

function closeModel(){
    clearErrFields();
    clearFields();    
}

$( document ).ready(function() {
    getAllUserTypes();
    getAllCompany()
});

function getAllCompany(){
	var data = "dispatch=getAllCompany";
    var ajax = new ajaxObject("userTypeAction.do");
    ajax.callback = function(responseText, responseStatus, responseXML) {
        if (responseStatus == 200) {
            var message = eval('(' + responseText + ')');
            if(message['error']){
                alert(message['error']);
            }else{
            	setDropDown("company",message);
            }
        }
    }
    ajax.update(data, "POST");
}

function onchangeCompany(){
	document.getElementById("divCompany").innerHTML="";
}
