<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<c:if test="${sessionScope==null || sessionScope.userName==null || sessionScope.isAdmin==null || sessionScope.isAdmin!=1}">
<c:redirect url="/index.jsp" /> 
</c:if>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset="utf-8">
<title>管理员</title>
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<link href="${ctx }/assets/css/font.css" rel='stylesheet'
	type='text/css'>
<link rel="stylesheet" type="text/css"
	href="${ctx}/assets/js/bootstrap/css/bootstrap.css">
<link rel="stylesheet"
	href="${ctx}/assets/js/font-awesome/css/font-awesome.css">
<link rel="stylesheet" href="${ctx }/assets/css/font-awesome.css">
<script src="${ctx}/assets/js/jquery-1.11.1.min.js"
	type="text/javascript"></script>
<script src="${ctx }/assets/js/jquery-3.0.0.js"></script>
<script src="${ctx }/assets/js/bootstrap/js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css"
	href="${ctx}/assets/css/theme.css">

</head>
<body class=" theme-blue">

	<style type="text/css">
#line-chart {
	height: 300px;
	width: 800px;
	margin: 0px auto;
	margin-top: 1em;
}

.navbar-default .navbar-brand, .navbar-default .navbar-brand:hover {
	color: #AEEEEE;
}
</style>




	<div class="navbar navbar-default" role="navigation">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target=".navbar-collapse">
				<span class="sr-only">navigation</span> <span class="icon-bar"></span>
				<span class="icon-bar"></span> <span class="icon-bar"></span>
			</button>
			<a class="" href="${ctx }/index.jsp"><span class="navbar-brand"><span
					class="fa fa-cart-plus" aria-hidden="true"></span>商城管理员后台界面</span></a>
		</div>

		<div class="navbar-collapse collapse" style="height: 1px;">
			<ul id="main-menu" class="nav navbar-nav navbar-right">
				<li class="dropdown hidden-xs"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown"> <span
						class="glyphicon glyphicon-user padding-right-small"
							style="position: relative; top: 3px;"></span>${sessionScope.userName}  <i
						class="fa fa-caret-down"></i>
				</a>

					<ul class="dropdown-menu">
						<li><a href="${ctx }/base/logout">退出</a></li>
					</ul></li>
			</ul>

		</div>
	</div>
	</div>

	<div class="sidebar-nav">
		<ul>
			<li><a href="#" data-target=".dashboard-menu" class="nav-header"
				data-toggle="collapse"><i class="fa  fa-certificate"></i> 用户信用审核<i
					class="fa fa-collapse"></i></a></li>
			<li><ul class="dashboard-menu nav nav-list collapse in">
					
					<li><a href="${ctx }/validate/showuser"><span
							class="fa fa-caret-right"></span> 所有用户 </a></li>
				</ul></li>



			<li><a href="#" data-target=".accounts-menu"
				class="nav-header collapsed" data-toggle="collapse"><i
					class="fa fa-fw fa-certificate"></i> 订单审核 <i class="fa fa-collapse"></i></a></li>
			<li><ul class="accounts-menu nav nav-list collapse">
					<li><a href="${ctx }/validate/showorder"><span
							class="fa fa-caret-right"></span> 所有订单</a></li>
				</ul></li>

			<li><a href="#" data-target=".legal-menu"
				class="nav-header collapsed" data-toggle="collapse"><i
					class="fa fa-fw fa-certificate"></i> 商品信息管理<i
					class="fa fa-collapse"></i></a></li>
			<li><ul class="legal-menu nav nav-list collapse">
					<li><a href="${ctx }/manageGoods/findAll"><span
							class="fa fa-caret-right"></span> 所有商品</a></li>
				</ul></li>

		</ul>
	</div>


	<!--  ////////////////////////////////////////-->
	<div class="content" style="height: 580px;">
		<div class="main-content">
	<form action="${ctx}/order/searchOrder" method="post">
             搜索订单:<input type="text" id="id" name="id" style="width: 30%; height: 40px" placeholder="订单ID"/>
             
             <input class="btn btn-primary" type="submit" style="display: inline-block" value="搜索"/>
            </form>
			<p style="text-align: center; font-size: 25px">
				<B>订单列表</B>
			</p>

			<table class="table">
				<thead>
					<tr>
						<th>#</th>
						<th>订单ID</th>
						<th>用户ID</th>
						<th>商品ID</th>
						<th>商品数量</th>
						<th>分期</th>
						<th>下单时间</th>
						<th>地址</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="i" items="${orders}">
						<tr>
							<td><input type="checkbox" name="orderID"
								value="${i.orderID }" /></td>
							<td>${i.orderID}</td>
							<td>${i.userID}</td>
							<td>${i.goodsID}</td>
							<td>${i.number}</td>
							<td>${i.installment}</td>
							<td>${i.orderTime}</td>
							<td>${i.address}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="btn-toolbar list-toolbar" style="text-align:center">
				<button id="btn1" class="btn btn-primary">
					<i class="fa fa-check"></i>通过
				</button>
				<button id="btn2" class="btn btn-danger">
					<i class="fa fa-circle"></i> 拒绝
				</button>

				<div class="btn-group"></div>
			</div>

		</div>
	</div>

	<script type="text/javascript">
              $(function(){
            	
            	  $("#btn1").click(function(){
						var para=$("input[name='orderID']:checked").serialize();
            		  $.ajax({                           	  
                          url: ' ${ctx}/validate/validateOrder',                       
                          type: 'POST',                  
                          data: para,                  
                          success: function (msg) {                      
                          if (msg == "ok"){ 
                        	  $("#btn3").click();
                          }    
                          else{
                        	 alert("失败");
                          }
                           }              
                       });          
            		  
            	  });
            	  
              	  $("#btn2").click(function(){
						var para=$("input[name='orderID']:checked").serialize();
          		  $.ajax({                           	  
                        url: ' ${ctx}/validate/rejectOrder',       //处理测试页面,注意返回内容，成功返回OK                  
                        type: 'POST',                  
                        data: para,                  
                        success: function (msg) {                      
                        if (msg == "ok"){ 
                        	 $("#btn3").click();
                        }    
                        else{
                      	 alert("失败");
                        }
                         }              
                     });          
          		  
          	  });
            	  
              });
            </script>

	<footer style="margin-top:0px">

	<p style="text-align: center; font-weight: bold; font-size: 20px">Copyright
		@2016</p>
	</footer>
<button id="btn3" class="btn btn-primary btn-lg" data-toggle="modal" 
   data-target="#myModal" style="display:none;"></button>
<div class="modal fade" id="myModal"  tabindex="-1" role="dialog" 
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content" style="margin-top:200px">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" 
               aria-hidden="true">×
            </button>
            <h4 class="modal-title" id="myModalLabel">
            操作成功
            </h4>
         </div>
         <div class="modal-body">
            成功！
         </div>
         <div class="modal-footer">
           <a href="${ctx }/validate/showorder"> <button type="button" class="btn btn-primary" 
               >确定
            </button></a>
         </div>
      </div><!-- /.modal-content -->
   </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</body>
</html>
