function upperCase(object){
	var value = object.value;
	var res = value.toUpperCase();
	object.value=res;
}

function clearField(object){
	document.getElementById(object).innerHTML="";
}

function commonSearch(action,dispatch,idElement,codeElement,desElement,errElement,param,fireFunction,errFunction){
	var code = document.getElementById(codeElement).value;
    if(code!=null && code!=""){
    	var data = "dispatch="+dispatch+"&code="+code+param;
        var ajax = new ajaxObject(action);
        ajax.callback = function(responseText, responseStatus, responseXML) {
            if (responseStatus == 200) {
                var message = eval('(' + responseText + ')');
                if(message['error']){
                    document.getElementById(idElement).value = message["id"];
                    document.getElementById(desElement).value=message["description"];
                    code.value=message["code"];
                    document.getElementById(errElement).innerHTML=message["error"];
                    if(errFunction!=undefined && errFunction!=""){
            			setTimeout (errFunction, 1);
            		}
                }else{
                	 document.getElementById(idElement).value = message["id"];
                     document.getElementById(desElement).value=message["description"];
                     document.getElementById(errElement).innerHTML=message["error"];
                	if(fireFunction!=undefined && fireFunction!=""){
            			setTimeout (fireFunction, 1);
            		}
                }
            }
        }
        ajax.update(data, "POST");
    }else{
    	 document.getElementById(idElement).value = "0";
    }
}

function unformatNumber(num) { 
	num=num+''; num=num.replace(/([^0-9\.])/g,'');
	return (num=='')?"":num 
}

function formatNumber(num,prefix){ 
	prefix = prefix || ''; 
	num += ''; 
	var splitStr = num.split('.'); 
	var splitLeft = splitStr[0]; 
	var splitRight = splitStr.length > 1 ? '.' + splitStr[1] : ''; 
	var regx = /(\d+)(\d{3})/; while (regx.test(splitLeft)) { splitLeft = splitLeft.replace(regx, '$1' + ',' + '$2'); }
	return prefix + splitLeft + splitRight;	
}

function compareDate(first, second) {
	var firstDateParts = first.split("/");
	console.log(firstDateParts);
	var firstDateObject = new Date(firstDateParts[2], firstDateParts[1], firstDateParts[0]);//year month day 
	console.log(firstDateParts[2]+" , "+ firstDateParts[1] +" , "+ firstDateParts[0]);
	var secondDateParts = second.split("/");
	var secondDbject = new Date(secondDateParts[2], secondDateParts[1], secondDateParts[0]); 
	console.log(firstDateObject.getTime() +" <= "+ secondDbject.getTime());
	return (firstDateObject.getTime() <= secondDbject.getTime());
}

/*function compareDate(first, second) {
	var firstDateParts = first.split("/");
	var firstDateObject = new Date(firstDateParts[2], firstDateParts[1] - 1, firstDateParts[0]); 
	
	var secondDateParts = second.split("/");
	var secondDbject = new Date(secondDateParts[2], secondDateParts[1] - 1, secondDateParts[0]); 
	return (firstDateObject.getTime() <= secondDbject.getTime());
}*/

function compareWithSystemDate(first) {
	var second = getCookie('systemDate');
	return (new Date(first).getTime() <= new Date(second).getTime());
}

function checkDate(strDate){
	var rgexp = /(^(((0[1-9]|[12][0-8])[/](0[1-9]|1[012]))|((29|30|31)[/](0[13578]|1[02]))|((29|30)[/](0[4,6,9]|11)))[/](19|[2-9][0-9])\d\d$)|(^29[/]02[/](19|[2-9][0-9])(00|04|08|12|16|20|24|28|32|36|40|44|48|52|56|60|64|68|72|76|80|84|88|92|96)$)/;
	return rgexp.test(strDate);
}

function setCookie(cname, cvalue) {
	var d = new Date();
    d.setTime(d.getTime() + (24*60*60*1000));
    var expires = "expires="+d.toUTCString();
    document.cookie = cname + "=" + cvalue + "; " + expires;
}

function getCookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for(var i=0; i<ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0)==' ') c = c.substring(1);
        if (c.indexOf(name) == 0) return c.substring(name.length, c.length);
    }
    return "";
}

function GE(element){
	return document.getElementById(element);
}

function setDropDown(element,arr){
	 document.getElementById(element).options.length = 0;
	 var obj = document.getElementById(element);
	 for (var x = 0; x < arr.length; x++) {
		 var opt = document.createElement("option");
	    opt.text=arr[x][1];
	    opt.value=arr[x][0];	
	    obj.appendChild(opt); 
	} 
}

function setDropDownV2(element, arr, idField, descField){
	 console.log("setDropDownV2");
	 document.getElementById(element).options.length = 0;
	 var obj = document.getElementById(element);
	 
	 var opt = document.createElement("option");
	    opt.text="--Select--";
	    opt.value="0";	
	    obj.appendChild(opt); 
	    
	    obj.value="0";
	 
	    for (var x = 0; x < arr.length; x++) {
		opt = document.createElement("option");
	    opt.text=arr[x][descField];
	    opt.value=arr[x][idField];	
	    obj.appendChild(opt); 
	} 
	 
}

function loading(){
	$("#loadingBlurDiv").addClass("loadingBlurDivShow");
	$("#loadingBlurDiv").removeClass("loadingBlurDivHide");
}

function hideLoading(){
	 $("#loadingBlurDiv").removeClass("loadingBlurDivShow");
	 $("#loadingBlurDiv").addClass("loadingBlurDivHide");
}


