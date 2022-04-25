function CreateXHR() {
	var request = false;
    try {
    	request = new ActiveXObject('Msxml2.XMLHTTP');
	}catch (err2) {
    	try {
			request = new ActiveXObject('Microsoft.XMLHTTP');
      	}catch (err3) {
			try {
				request = new XMLHttpRequest();
			}catch (err1){
				request = false;
			}
		}
	}
	return request;
}

function clearScreen(id){
	window.parent.frames['mainbody'].document.getElementById(id).innerHTML = "";              	
}

function upperCase(id){
	window.parent.frames['mainbody'].document.getElementById(id).value = window.parent.frames['mainbody'].document.getElementById(id).value.toUpperCase();	
}

function ajaxObject(url, callbackFunction) {
	var that=this;      
  	this.updating = false;
  	this.abort = function() {
   		if (that.updating) {
      		that.updating=false;
      		that.AJAX.abort();
      		that.AJAX=null;
    	}
  	}
  	
	this.update = function(passData,postMethod) { 
    	if (that.updating) { 
    		return false;
    	}
    	that.AJAX = null;                          
   		if (window.XMLHttpRequest) {              
     			that.AJAX=new XMLHttpRequest();              
   		} else {
   				try {                                  
     				that.AJAX=new ActiveXObject("Microsoft.XMLHTTP");
     			}catch (err2) {
     				that.AJAX=new ActiveXObject("Msxml2.XMLHTTP");
     			}
   		}                                             
   		if (that.AJAX==null) {                             
     			return false;                               
   		} else {
     		that.AJAX.onreadystatechange = function() {  
	       		if (that.AJAX.readyState==4) {
					try{
						var ar=eval('(' + that.AJAX.responseText + ')');
						if(ar['error'] && ar['error']=='Your Session is expired, Please login again.'){
							alert(ar['error']);
						    onSessionError();
							return;
						}
					}catch(error){}
         			that.updating=false;                
         			that.callback(that.AJAX.responseText,that.AJAX.status,that.AJAX.responseXML);        
         			that.AJAX=null;                                         
    	   		}                                                      
     		}
	   		that.updating = new Date();
			if (/post/i.test(postMethod)) {
	       		var uri=urlCall+'?rand='+that.updating.getTime();
		        that.AJAX.open("POST", uri, true);
	       		that.AJAX.setRequestHeader("Content-type", "application/x-www-form-urlencoded; charset=UTF-8");
		        that.AJAX.setRequestHeader("Content-Length", passData.length);
				that.AJAX.setRequestHeader("From","true");
				that.AJAX.send(passData);
			} else {
				var uri=urlCall+'?'+passData+'&timestamp='+(that.updating.getTime()); 
				that.AJAX.setRequestHeader("From","true");
			    that.AJAX.open("GET", uri, true);                             
		        that.AJAX.send(null);                                         
			}              
			return true;                                             
		}                                                                           
  	}
	var urlCall = url;        
  	this.callback = callbackFunction || function () { };

}