<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<c:if test="${sessionScope==null || sessionScope.userName==null}">
<c:redirect url="/login.jsp" /> 
</c:if>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="utf-8">
<title>个人信息</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- CSS -->
<link rel="stylesheet" href="${ctx }/assets/css/reset.css">
<link rel="stylesheet" href="${ctx }/assets/css/supersized.css">
<link rel="stylesheet" href="${ctx }/assets/css/login.css">

<script src="${ctx }/assets/js/jquery-1.8.2.min.js"></script>
<script src="${ctx }/assets/js/supersized.3.2.7.min.js"></script>
<script src="${ctx }/assets/js/supersized-init.js"></script>
<script src="${ctx }/assets/js/scripts.js"></script>
<script src="${ctx }/assets/js/jquery.min.js"></script>
<script src="${ctx }/assets/js/jquery.js"></script>


<script type="text/javascript">
              $(function(){
            	  
         $.ajax({                           	  
                      url: ' ${ctx}/base/load',                       
                      type: 'GET',  
                      dataType:'json',
                      success: function (user) {                      
                    	  document.getElementById('userName').value=user["userName"];
                    	  document.getElementById('password').value=user["password"];
                    	  document.getElementById('realName').value=user["realName"];
                    	  document.getElementById('telephone').value=user["telephone"];
                    	  document.getElementById('address').value=user["address"];
                    	  document.getElementById('email').value=user["email"];
                    	 
                       }              
                   }); 
            	  
            	  
            	  
            	  /////////////////////////////////////////////////
            	  $("#button").click(function(){
            		  var user={'userName':document.getElementById('userName').value,
            				  'password':document.getElementById('password').value,
            				  'realName':document.getElementById('realName').value,
            				  'telephone':document.getElementById('telephone').value,
            				  'address':document.getElementById('address').value,
            				  'email':document.getElementById('email').value};
                      $.ajax({                           	  
                          url: ' ${ctx}/base/update',                       
                          type: 'POST',                  
                          data: user,                  
                          success: function (msg) {                      
                          if (msg == "success"){ 
                        	  alert("修改成功");
                        	  location.href="index.jsp";
                          }    
                          else{
                        	  alert("修改失败！");
                          }
                           }              
                       });          
            		  
            	  });
            	  
              });
                      
           
            </script>
<!-- Javascript -->

</head>

<body>

	<div class="page-container">
		<h1>修改个人信息</h1>
		<form id="form">

			用户名<input type="text" id="userName" name="userName" class="userName"
				disabled="disabled"><br> 密码 <input type="text"
				id="password" name="password" class="password"><br>
			真实姓名 <input type="text" id="realName" name="realName"
				class="realName"><br> 手机 <input type="text"
				id="telephone" name="telephone" class="telephone"><br>
			地址 <input type="text" id="address" name="address" class="address"><br>
			邮箱 <input type="email" id="email" name="email" class="email"><br>
			<button id="button" type="button">修改</button>
			<div class="error">
				<span>+</span>
			</div>
		</form>
	</div>
</body>

</html>


