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

<script type="text/javascript">
function del(id){
	$("#delconfirm").attr('href','${ctx }/manageGoods/delete?id='+id); 
	 $("#myModal").modal();
}



</script>
	<!--  ////////////////////////////////////////-->
	<div class="content" style="min-height: 580px;">
		<div class="main-content">
			<form action="${ctx }/manageGoods/searchGoods" method="POST">
				搜索商品<input type="text" id="id" name="id"
					style="width: 30%; height: 40px" placeholder="商品ID" /> 
					<input type="submit" style="display: inline-block" class="btn btn-primary"value="搜索" />
			</form>


			<p style="text-align: center; font-size: 25px">
				<B>商品列表</B>
			</p>

			<table class="table">
				<thead>
					<tr>
						<th>商品ID</th>
						<th>商品名</th>
						<th>图片</th>
						<th>库存</th>
						<th>价格</th>
						<th>分类</th>
						<th>详情</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="i" items="${goods}">
						<tr>
							<td>${i.goodsId }</td>
							<td>${i.name }</td>
							<td><img src="${ctx }/assets/img/${i.photo }" width="50px"
								height="50px"></td>
							<td>${i.stock }</td>
							<td>${i.price }</td>
							<td>${i.category }</td>
							<td>${i.description }</td>
							<th style="width: 3.5em;"></th>
							<td><a href="${ctx }/manageGoods/load?id=${i.goodsId }"><i class="fa fa-pencil"></i></a> 
							<a href="javascript:void(0)" onclick="del(${i.goodsId })" id="${i.goodsId }" role="button" data-toggle="modal"><i class="fa fa-trash-o"></i></a>							
							</td>

						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="btn-toolbar list-toolbar">
				<a href="${ctx }/addGoods.jsp"><button class="btn btn-primary">
						<i class="fa fa-plus"></i> 添加
					</button></a>

				<div class="btn-group"></div>
			</div>
			

		</div>
	</div>
	<div class="modal small fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h3 id="myModalLabel">确认删除</h3>
				</div>
				<div class="modal-body">
					<p class="error-text">
						<i class="fa fa-warning modal-icon"></i>确定要删除该商品？
					</p>
				</div>
				<div class="modal-footer">
					<button class="btn btn-default" data-dismiss="modal"
						aria-hidden="true">取消</button>
					<a id="delconfirm" href="#"><button class="btn btn-danger">确认删除</button></a>
				</div>
			</div>
		</div>
	</div>


	<footer style="margin-top:0px">

	<p style="text-align: center; font-weight: bold; font-size: 20px">Copyright
		@2016</p>
	</footer>

</body>
</html>
