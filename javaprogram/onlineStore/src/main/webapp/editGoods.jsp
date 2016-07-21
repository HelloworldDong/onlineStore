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
<link rel="stylesheet" href="${ctx }/assets/css/uploadify.css">
<script src="${ctx}/assets/js/jquery-1.11.1.min.js"
	type="text/javascript"></script>
<script src="${ctx }/assets/js/bootstrap/js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css"
	href="${ctx}/assets/css/theme.css">
<script src="${ctx }/assets/js/jquery.uploadify.js"></script>
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

<script type="text/javascript">

    $(function() {
    	
        $('#photo').uploadify({
            'swf'      : '${ctx}/assets/js/uploadify.swf',
            'uploader' : '${ctx}/manageGoods/modify',
            'height': 25,
            'whith' :120,
            'auto'  : false,
            'fileObjName':'file',
             'multi': false,
            'buttonText' : '选择图片...',
            'fileTypeExts' : '*.jpg',
            'method'   :'post',
            'formData' : {'name':$("#name").val(),'stock':$("#stock").val(),'price':$("#price").val(),'category':$("#category").val(),'description':$("#description").val()},

            'onUploadStart': function (file) {  
            	var para= {'goodsId':$("#goodsId").val(), 'name':$("#name").val(),'stock':$("#stock").val(),'price':$("#price").val(),'category':$("#category").val(),'description':$("#description").val(),'path':'${ctx}/assets/img'};
            	$("#photo").uploadify("settings", "formData",para);  
                
            }  ,
            'onUploadError' : function(file, errorCode, errorMsg, errorString) {
                alert('The file ' + file.name + ' could not be uploaded: ' + errorString);
               },
            'onQueueComplete' : function(queueData) {  
            	 $("#myModal").modal();
                }  
        });
    });

</script>


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
				<li class="dropdown hidden-xs"><a href="#"class="dropdown-toggle" data-toggle="dropdown"> <span
						class="glyphicon glyphicon-user padding-right-small"
						style="position: relative; top: 3px;"></span> ${sessionScope.userName}  <i
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
	<div class="content" stylt="min-height:580px">
		<div class="main-content">

			<div class="row">
				<div class="col-md-4">
					<br>
					<div id="myTabContent" class="tab-content">
						<div class="tab-pane active in" id="home">
							<h1>
								<b>修改商品信息</b>
							</h1>

							<form id="tab" enctype=”multipart/form-data”>
								<div class="form-group">
									<label>商品ID</label> <input id="goodsId" type="text"
										disabled="true" class="form-control" value=${goods.goodsId }>
								</div>
								<div class="form-group">
									<label>商品名</label> <input id="name" type="text"
										class="form-control" value=${goods.name }>
								</div>
								<div class="form-group">
									<label>图片</label> <input id="photo" type="file" name="photo">
										
								</div>
								<div class="form-group">
									<label>库存</label> <input id="stock" type="text"
										class="form-control" value=${goods.stock }>
								</div>
								<div class="form-group">
									<label>价格</label> <input id="price" type="text"
										class="form-control" value=${goods.price }>
								</div>

								<div class="form-group">
									<label>类别</label> <select id="category" name="DropDownTimezone"
										class="form-control">
										<option value="phone" <c:if test="${goods.category=='phone'}">selected="selected"</c:if>>手机</option>
										<option value="computer" <c:if test="${goods.category=='computer'}">selected="selected"</c:if>>电脑</option>
										<option value="clothes" <c:if test="${goods.category=='clothes'}">selected="selected"</c:if>>服装</option>
										<option value="book" <c:if test="${goods.category=='book'}">selected="selected"</c:if>>图书</option>
										<option value="food" <c:if test="${goods.category=='food'}">selected="selected"</c:if>>食品</option>
									</select>
								</div>

								<div class="form-group">
									<label>描述</label>
									<textarea id="description" rows="3" class="form-control">${goods.description }</textarea>
								</div>
							</form>
						</div>

					</div>

					<div class="btn-toolbar list-toolbar">
						<a href="javascript:$('#photo').uploadify('upload')"><button class="btn btn-primary"><i class="fa fa-save"></i> 保存</button></a>
					</div>
				</div>
			</div>

			<div class="modal small fade" id="myModal" tabindex="-1"
				role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">×</button>
							<h3 id="myModalLabel">修改成功</h3>
						</div>
						<div class="modal-body">

							<p class="error-text">修改商品信息成功</p>
						</div>
						<div class="modal-footer">
							<a href="${ctx }/manageGoods/findAll"><button class="btn btn-primary" 
								aria-hidden="true">关闭</button></a>

						</div>
					</div>
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
