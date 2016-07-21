<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="js/jquery-3.0.0.js"></script>
<title>View Books</title>
</head>
<body>

<center>
<button  id="bbutton" type="button"  onclick="ajaxRequest()">Show Book</button>
<table width="50%" id="btable" border=1 align='center'>
    <thead>
        <tr>
           <td>Book ID</td>
			<td>Book Name</td>
			<td>Author</td>
			<td>Price</td>
        </tr>
    </thead>
</table>

</center>
<script>
$(document).ready(function() {
    $('#bbutton').click();
});
</script>
<script type="text/javascript">
var xmlhttp=null;
function ajaxRequest(){
	if(window.XMLHttpRequest){
		xmlhttp=new XMLHttpRequest();
	}else if(window.ActiveXObject){
		xmlhttp=new ActionXObject("Microsoft.XMLHTTP");
	}
	if(xmlhttp!=null){
	xmlhttp.open("GET","listBook",true);
	xmlhttp.onreadystatechange=ajaxCall;
	xmlhttp.send();
	}
}

function ajaxCall(){

	if(xmlhttp.readyState==4){
		if(xmlhttp.status==200){
			var json = eval( '('+ xmlhttp.responseText +')'); 
			 var str = " <tr> <td>Book ID</td><td>Book Name</td><td>Author</td><td>Price</td> </tr>";
             for (i in json) {
                 str += "<tr><td>" + json[i].book_id + "</td><td>" + json[i].name + "</td><td>" + json[i].author+ "</td><td>" + json[i].price+ "</td></tr>";
             }
            document.getElementById("btable").innerHTML=str;
		}
	}
}
</script> 


</body>
</html>