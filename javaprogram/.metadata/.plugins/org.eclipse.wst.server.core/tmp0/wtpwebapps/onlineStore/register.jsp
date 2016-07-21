<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
  
  
<title>注册</title>
 <link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
 <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
 <script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>

 <script src="${ctx }/assets/js/jquery.validate.min.js"></script>
<script src="${ctx}/assets/js/messages_zh.js"></script> 

 <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script> 
  <style type="text/css">
html,body {
	height: 105%;
}
.box {
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#6699FF', endColorstr='#6699FF'); /*  IE */
	background-image:linear-gradient(bottom, #6699FF 0%, #6699FF 100%);
	background-image:-o-linear-gradient(bottom, #6699FF 0%, #6699FF 100%);
	background-image:-moz-linear-gradient(bottom, #6699FF 0%, #6699FF 100%);
	background-image:-webkit-linear-gradient(bottom, #6699FF 0%, #6699FF 100%);
	background-image:-ms-linear-gradient(bottom, #6699FF 0%, #6699FF 100%);
	
	margin: 0 auto;
	position: relative;
	width: 100%;
	height: 100%;
}
.login-box {
	width: 100%;
	max-width:500px;
	height: 600px;
	position: absolute;
	top: 30%;

	margin-top: -200px;
	/*设置负值，为要定位子盒子的一半高度*/
	
}
@media screen and (min-width:500px){
	.login-box {
		left: 50%;
		/*设置负值，为要定位子盒子的一半宽度*/
		margin-left: -250px;
	}
}	

.form {
	width: 100%;
	max-width:500px;
	height: 400px;
	margin: 25px auto 0px auto;
	padding-top: 25px;
}	
.login-content {
	height: 650px;
	width: 100%;
	max-width:500px;
	background-color: rgba(255, 250, 2550, .6);
	float: left;
}		
	
	
.input-group {
	margin: 0px 0px 30px 0px !important;
}
.form-control,
.input-group {
	height: 35px;
}

.form-group {
	margin-bottom: 0px !important;
}
.login-title {
	padding: 20px 10px;
	background-color: rgba(0, 0, 0, .6);
}
.login-title h1 {
	margin-top: 10px !important;
}
.login-title small {
	color: #fff;
}

.link p {
	line-height: 20px;
	margin-top: 30px;
}
.btn-sm {
	padding: 8px 24px !important;
	font-size: 16px !important;
}
</style> 
</head>


 <script type="text/javascript">

 function GetQueryString(name)
 {
      var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
      var r = window.location.search.substr(1).match(reg);
      if(r!=null)return  unescape(r[2]); return null;
 }
 
$(function(){
  $("#form").validate({ errorPlacement: function (error, element) {
	                     if (element.parent().hasClass("input-group")) {
		                           element.parent().after(error);
		                      }
		                     else
		                          element.after(error)
		                  }
		               });
  if(GetQueryString("result")!=null && GetQueryString("result")!="") {
	  var str=GetQueryString("result");
	if(str=="success"){
		$("#btn1").click();
	}
		else {
			$("#btn2").click();
			 
		}
  }   
     
    

});
</script> 

            




<body>
<button id="btn2" class="btn btn-primary btn-lg" data-toggle="modal"  data-target="#myModal" style="display:none;"></button>
<button id="btn1" class="btn btn-primary btn-lg" data-toggle="modal"  data-target="#myModal2" style="display:none;"></button>
 <div class="box">
		<div class="login-box">
			<div class="login-title text-center">
				<h1><small>注册</small></h1>
			</div>
			<div class="login-content ">
			<div class="form">
			<form id="form" action="${ctx }/base/register" method="post">
				<div class="form-group">
					<div class="col-xs-12  ">
						<div class="input-group">
							<span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
							<input type="text" id="userName" name="userName" class="form-control" placeholder="用户名" required=true>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-12  ">
						<div class="input-group">
							<span  class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
							<input type="password" id="password" name="password" class="form-control" placeholder="密码" required=true>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-12  ">
						<div class="input-group">
							<span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
							<input type="text" id="realName" name="realName" class="form-control" placeholder="真实姓名" required=true>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-xs-12  ">
						<div class="input-group">
							<span class="input-group-addon"><span class="glyphicon glyphicon-phone"></span></span>
							<input type="text" id="telephone" name="telephone" class="form-control" placeholder="电话" required=true digits=true ">
						</div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="col-xs-12  ">
						<div class="input-group">
							<span class="input-group-addon"><span class="glyphicon glyphicon-home"></span></span>
							<input type="text" id="address" name="address" class="form-control" placeholder="地址" required=true  >
						</div>
					</div>
				</div>
				
					<div class="form-group">
					<div class="col-xs-12  ">
						<div class="input-group">
							<span class="input-group-addon"><span class="glyphicon glyphicon-envelope"></span></span>
							<input type="text" id="email" name="email" class="form-control" placeholder="邮箱" required=true email=true>
						</div>
					</div>
				</div>
				
				<div class="form-group form-actions">
					<div class="col-xs-4 col-xs-offset-4 ">
						<button type="submit" class="btn btn-sm btn-info"><span class="glyphicon glyphicon-off"></span> 注册</button>
					</div>
				</div>
			</form>
			</div>
		</div>
	</div>
</div>


<div class="modal fade" id="myModal"  tabindex="-1" role="dialog" 
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content" style="margin-top:200px">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" 
               aria-hidden="true">×
            </button>
            <h4 class="modal-title" id="myModalLabel">
            注册失败
            </h4>
         </div>
         <div class="modal-body">
           用户已存在!
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-primary" 
               data-dismiss="modal">关闭
            </button>
         </div>
      </div><!-- /.modal-content -->
   </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div class="modal fade" id="myModal2"  tabindex="-1" role="dialog" 
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content" style="margin-top:200px">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" 
               aria-hidden="true">×
            </button>
            <h4 class="modal-title" id="myModalLabel">
            注册成功
            </h4>
         </div>
         <div class="modal-body">
           注册成功！请返回登录！
         </div>
         <div class="modal-footer">
           <a href="${ctx }/index.jsp"> <button type="button" class="btn btn-primary">确定  </button></a>
         </div>
      </div><!-- /.modal-content -->
   </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

</body>

</html>


