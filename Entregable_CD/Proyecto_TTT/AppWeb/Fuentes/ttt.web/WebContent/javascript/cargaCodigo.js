// JavaScript Document
	function load(id, url){
		var xmlHttp;
		try {// Firefox, Opera 8.0+, Safari
			xmlHttp = new XMLHttpRequest();		
		} catch (e) {// Internet Explorer
			try {
				xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
				try {
					xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e) {
					alert("Your browser does not support AJAX!");
					return false;
				}
			}
		}
		
		
		xmlHttp.onreadystatechange = function(){
			if (xmlHttp.readyState == 4) {
				//Get the response from the server and extract the section that comes in the body section of the second html page avoid inserting the header part of the second page in your first page's element
				var respText = xmlHttp.responseText.split('<body>');
				elem.innerHTML = respText[0].split('</body>')[0];
			}
		}

		var elem = document.getElementById(id);
		if (!elem) {
			alert('The element with the passed ID doesn\'t exists in your page');
			return;
		}
		elem.innerHTML = "<div id='titulodetalle'><h1 style='width: 210px;'>" +
				"Cargando...</h1></div>";
	
		xmlHttp.open("GET", url, true);
		xmlHttp.send(null);
	}
