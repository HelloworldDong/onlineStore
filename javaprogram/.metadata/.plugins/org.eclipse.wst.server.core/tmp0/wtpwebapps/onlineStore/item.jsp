
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.onlineStore.entity.Goods"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="utf-8">
<title>趣分期</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">


<!-- Global styles START -->
<link
	href="${ctx }/assets/plugins/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link href="${ctx }/assets/plugins/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<!-- Global styles END -->

<!-- Page level plugin styles START -->
<link href="${ctx }/assets/plugins/fancybox/source/jquery.fancybox.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
<!-- for slider-range -->
<link href="${ctx }/assets/plugins/bxslider/jquery.bxslider.css"
	rel="stylesheet">
<link href="${ctx }/assets/plugins/rateit/src/rateit.css"
	rel="stylesheet" type="text/css">
<link href="${ctx }/assets/plugins/uniform/css/uniform.default.css"
	rel="stylesheet" type="text/css">
<!-- Page level plugin styles END -->
<!-- Theme styles START -->
<link href="${ctx }/assets/css/style-metronic.css" rel="stylesheet"
	type="text/css">
<link href="${ctx }/assets/css/style.css" rel="stylesheet"
	type="text/css">
<link href="${ctx }/assets/css/style-responsive.css" rel="stylesheet"
	type="text/css">
<link href="${ctx }/assets/css/custom.css" rel="stylesheet"
	type="text/css">
<!-- Theme styles END -->
<script src="${ctx }/assets/js/jquery.min.js"></script>
<script src="${ctx }/assets/js/jquery.js"></script>
</head>
<!-- Head END -->
<!-- Body BEGIN -->
<c:if test="${sessionScope==null || sessionScope.userName==null}">
<c:redirect url="/login.jsp" /> 
</c:if>
<body>
	<!-- BEGIN TOP BAR -->
	<div class="pre-header">
		<div class="container">
			<div class="row">
				<!-- BEGIN TOP BAR LEFT PART -->
				<div class="col-md-6 col-sm-6 additional-shop-info">
					<ul class="list-unstyled list-inline pull-left">
						<li><a href="${ctx}/index.jsp"><img src="${ctx }/assets/img/logo.jpg" width="100px" height="60px"/></a></li>
					</ul>
				</div>
				<!-- END TOP BAR LEFT PART -->
				<!-- BEGIN TOP BAR MENU -->
				<div class="col-md-6 col-sm-6 additional-nav">
					<ul class="list-unstyled list-inline pull-right">


						<c:if test="${sessionScope!=null && sessionScope.userName!=null}">
							<li>欢迎，${sessionScope.userName}</li>
							<li><a href='${ctx }/base/logout'>退出</a></li>
						</c:if>
						<c:if test="${sessionScope==null ||sessionScope.userName==null }">
							<li><a href='${ctx}/login.jsp'>登录</a></li>
						</c:if>



						<li><a href="${ctx }/order/showorder">我的订单</a></li>
						<li><a href="${ctx }/userpage.jsp">个人信息</a></li>
						<li><a href="${ctx }/order/showcart">购物车</a></li>
					</ul>
				</div>
				<!-- END TOP BAR MENU -->
			</div>
		</div>
	</div>

	<script type="text/javascript">
   
              $(function(){
            	 
                      $("#a1").click(function(){
                    	  var para={"category":"phone"};
                    	  $.ajax({                           	  
                              url: ' ${ctx}/base/showgoods',                      
                              type: 'POST',                  
                              data: para,                  
                              success: function (goods) {
                            	
                            	var products="";
                            	for(i in goods){
                            		var product='<div class="col-md-4 col-sm-6 col-xs-12"><div class="product-item"><div class="pi-img-wrapper">  <img src="${ctx }/assets/img/'+goods[i].photo+'" class="img-responsive" ></div> <h3>'+goods[i].name+'</h3><div class="pi-price">'+goods[i].price+'</div> <a href="${ctx}/base/detail?goodsID='+goods[i].goodsId+'" class="btn btn-default add2cart">View</a></div> </div>';
                            		products=products+product;
                            	}
                            	document.getElementById("productlist").innerHTML=products;
                            	}              
                      });	  
                      });
                      
                      $("#a2").click(function(){
                    	 
                    	  var para={"category":"computer"};
                    	  $.ajax({                           	  
                              url: ' ${ctx}/base/showgoods',                      
                              type: 'POST',                  
                              data: para,                  
                              success: function (goods) {
                            	
                            	var products="";
                            	for(i in goods){
                            		var product='<div class="col-md-4 col-sm-6 col-xs-12"><div class="product-item"><div class="pi-img-wrapper">  <img src="${ctx }/assets/img/'+goods[i].photo+'" class="img-responsive" ></div> <h3>'+goods[i].name+'</h3><div class="pi-price">'+goods[i].price+'</div> <a href="${ctx}/base/detail?goodsID='+goods[i].goodsId+'" class="btn btn-default add2cart">View</a></div> </div>';
                            		products=products+product;
                            	}
                            	document.getElementById("productlist").innerHTML=products;
                            	}              
                      });
                    	  
                      });
                      
                      $("#a3").click(function(){
                    	  var para={"category":"clothes"};
                    	  $.ajax({                           	  
                              url: ' ${ctx}/base/showgoods',                      
                              type: 'POST',                  
                              data: para,                  
                              success: function (goods) {
                            	
                            	var products="";
                            	for(i in goods){
                            		var product='<div class="col-md-4 col-sm-6 col-xs-12"><div class="product-item"><div class="pi-img-wrapper">  <img src="${ctx }/assets/img/'+goods[i].photo+'" class="img-responsive" ></div> <h3>'+goods[i].name+'</h3><div class="pi-price">'+goods[i].price+'</div> <a href="${ctx}/base/detail?goodsID='+goods[i].goodsId+'" class="btn btn-default add2cart">View</a></div> </div>';
                            		products=products+product;
                            	}
                            	document.getElementById("productlist").innerHTML=products;
                            	}              
                      });
                    	  
                      });
                      
                      $("#a4").click(function(){
                    	  var para={"category":"book"};
                    	  $.ajax({                           	  
                              url: ' ${ctx}/base/showgoods',                      
                              type: 'POST',                  
                              data: para,                  
                              success: function (goods) {
                            	
                            	var products="";
                            	for(i in goods){
                            		var product='<div class="col-md-4 col-sm-6 col-xs-12"><div class="product-item"><div class="pi-img-wrapper">  <img src="${ctx }/assets/img/'+goods[i].photo+'" class="img-responsive" ></div> <h3>'+goods[i].name+'</h3><div class="pi-price">'+goods[i].price+'</div> <a href="${ctx}/base/detail?goodsID='+goods[i].goodsId+'" class="btn btn-default add2cart">View</a></div> </div>';
                            		products=products+product;
                            	}
                            	document.getElementById("productlist").innerHTML=products;
                            	}              
                      });
                    	  
                      });
                      
                      $("#a5").click(function(){
                    	  var para={"category":"food"};
                    	  $.ajax({                           	  
                              url: ' ${ctx}/base/showgoods',                      
                              type: 'POST',                  
                              data: para,                  
                              success: function (goods) {
                            	
                            	var products="";
                            	for(i in goods){
                            		var product='<div class="col-md-4 col-sm-6 col-xs-12"><div class="product-item"><div class="pi-img-wrapper">  <img src="${ctx }/assets/img/'+goods[i].photo+'" class="img-responsive" ></div> <h3>'+goods[i].name+'</h3><div class="pi-price">'+goods[i].price+'</div> <a href="${ctx}/base/detail?goodsID='+goods[i].goodsId+'" class="btn btn-default add2cart">View</a></div> </div>';
                            		products=products+product;
                            	}
                            	document.getElementById("productlist").innerHTML=products;
                            	}              
                      });
                    	  
                      });
                      
                      $("#btn").click(function(){
                    	  
                    	  var para={"name":document.getElementById('search').value};
                    	 
                    	  $.ajax({                           	  
                              url: ' ${ctx}/base/search',                      
                              type: 'POST',                  
                              data: para,                  
                              success: function (goods) {
                            	
                            	var products="";
                            	for(i in goods){
                            		var product='<div class="col-md-4 col-sm-6 col-xs-12"><div class="product-item"><div class="pi-img-wrapper">  <img src="${ctx }/assets/img/'+goods[i].photo+'" class="img-responsive" ></div> <h3>'+goods[i].name+'</h3><div class="pi-price">'+goods[i].price+'</div> <a href="${ctx}/base/detail?goodsID='+goods[i].goodsId+'" class="btn btn-default add2cart">View</a></div> </div>';
                            		products=products+product;
                            	}
                            	document.getElementById("productlist").innerHTML=products;
                            	}              
                      });
                    	  
                      });
                      
                    $("#cartbtn").click(function(){
                       	  var num=	$("#product-quantity").val();
                    	  var para={"goodsID":'${item.goodsId}',"number":num,"installment":$("#sel ").val()};
                    	  $.ajax({       
                              url: ' ${ctx}/order/cart',                      
                              type: 'POST',                  
                              data: para,                  
                              success: function (msg) {
                            	if(msg=="ok"){
                            		$("#modalbtn").click();
                            	}
                            	
                            	}              
                      });
                    	  
                      });
            	  });
            
            </script>
            
    
	
	<!-- BEGIN HEADER -->
 <button id="modalbtn" class="btn btn-primary btn-lg" data-toggle="modal" 
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
            添加成功
            </h4>
         </div>
         <div class="modal-body">
            添加商品到购物车成功！
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-primary" 
               data-dismiss="modal">关闭
            </button>
         </div>
      </div><!-- /.modal-content -->
   </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
	<!-- BEGIN TOP SEARCH -->

	<center>
		<br> <br>
		<form>
			<div class="input-group">
				<input id="search" type="text"  size="35"
					style="height: 32px">

				<button id="btn" class="btn btn-primary" type="button">搜索</button>

			</div>
		</form>
		<br> <br>
	</center>
	<!-- END TOP SEARCH -->
	</div>
	<!-- END HEADER -->

	<!-- BEGIN SIDEBAR & CONTENT -->
	<div class="row margin-bottom-40">
		<!-- BEGIN SIDEBAR -->
		<div class="sidebar col-md-3 col-sm-5">
			<ul class="list-group margin-bottom-25 sidebar-menu">
				<li class="list-group-item clearfix"><a id="a1"><i
						class="fa fa-angle-right"></i> 手机</a></li>
				<li class="list-group-item clearfix"><a id="a2"><i
						class="fa fa-angle-right"></i> 电脑</a></li>
				<li class="list-group-item clearfix"><a id="a3"><i
						class="fa fa-angle-right"></i> 服装</a></li>
				<li class="list-group-item clearfix"><a id="a4"><i
						class="fa fa-angle-right"></i> 图书</a></li>
				<li class="list-group-item clearfix"><a id="a5"><i
						class="fa fa-angle-right"></i> 食品</a></li>
			</ul>
		</div>
		<!-- END SIDEBAR -->




		<!-- BEGIN CONTENT -->
		<div class="col-md-9 col-sm-7" id="productlist">
			<div class="product-page">
				<div class="row">
					<div class="col-md-6 col-sm-6">
						<div class="product-main-image">

							<img src="${ctx}/assets/img/${item.photo}" width="320px" height="240px" class="img-responsive" data-BigImgSrc="${ctx }/assets/img/${item.photo}">
						</div>

					</div>
					<div class="col-md-6 col-sm-6">
						<h1>${item.name}</h1>
						<div class="price-availability-block clearfix">
							<div class="price">
								<strong><span>￥</span>${item.price}</strong>

							</div>
						</div>
						<div class="description">
							<p>${item.description}</p>
						</div>

						<div class="product-page-cart">
							<div class="product-quantity">
								<input id="product-quantity" type="text" value="1" readonly
									class="form-control input-sm">
							</div>
							<select id="sel" style="height: 36px">
								<option value="3">分3期,利率1%，每期￥
									<fmt:formatNumber type="number"
										value="${(item.price*1.030301)/3.0}" pattern="0.00"
										maxFractionDigits="2" /></option>
								<option value="6">分6期,利率1%，每期￥
									<fmt:formatNumber type="number"
										value="${(item.price*1.0615201506010001)/6.0}" pattern="0.00"
										maxFractionDigits="2" /></option>
								<option value="9">分9期,利率1%，每期￥
									<fmt:formatNumber type="number"
										value="${(item.price*1.093685272684361)/9.0}" pattern="0.00"
										maxFractionDigits="2" /></option>
								<option value="12">分12期,利率1%，每期￥
									<fmt:formatNumber type="number"
										value="${(item.price*1.1268250301319698)/12.0}" pattern="0.00"
										maxFractionDigits="2" /></option>
								<option value="24">分24期,利率1%，每期￥
									<fmt:formatNumber type="number"
										value="${(item.price*1.269734648531915)/24.0}" pattern="0.00"
										maxFractionDigits="2" /></option>
							</select><br> <br> <br>
							<button id="cartbtn" class="btn btn-primary" type="button">添加到购物车</button>
						</div>

					</div>
					<div class="product-page-content">
						<ul id="myTab" class="nav nav-tabs">
							<li><a href="#Description" data-toggle="tab">描述</a></li>
							<li><a href="#Information" data-toggle="tab">详情</a></li>
						</ul>
						<div id="myTabContent" class="tab-content">
							<div class="tab-pane fade" id="Description">
								<p>${item.description}</p>
							</div>
							<div class="tab-pane fade" id="Information">
								<table class="datasheet">
									<tr>
										<th colspan="2">商品信息</th>
									</tr>
									<tr>
										<td class="datasheet-features-type">商品名</td>
										<td>${item.name}</td>
									</tr>
									<tr>
										<td class="datasheet-features-type">价格</td>
										<td>￥${item.price}</td>
									</tr>
									<tr>
										<td class="datasheet-features-type">库存</td>
										<td>${item.stock}</td>
									</tr>
									<tr>
										<td class="datasheet-features-type">类别</td>
										<td>${item.category}</td>
									</tr>

								</table>
							</div>

						</div>
					</div>
				</div>
				<div class="sticker sticker-sale"></div>
			</div>
		</div>
	</div>
	<!-- END CONTENT -->

	</div>
	<!-- END SIDEBAR & CONTENT -->
	</div>
	</div>

	<!-- BEGIN STEPS -->
	<div class="steps3 steps3red">
		<div class="container">
			<div class="row">
				<div class="col-md-4 steps3-col">
					<i class="fa fa-gift"></i>
					<div>
						<h2>选择商品</h2>
						<em>加入购物车</em>
					</div>
					<span>&nbsp;</span>
				</div>
				<div class="col-md-4 steps3-col">
					<i class="fa fa-gift"></i>
					<div>
						<h2>选择分期</h2>
						<em>0首付</em>
					</div>
					<span>&nbsp;</span>
				</div>
				<div class="col-md-4 steps3-col">
					<i class="fa fa-truck"></i>
					<div>
						<h2>送货上门</h2>
						<em>您的满意是我们最大的荣幸</em>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- END STEPS -->
	<div class="pre-footer">
	<div class="container">
		<div class="row">
			<!-- BEGIN BOTTOM ABOUT BLOCK -->
			<div class="col-md-3 col-sm-6 pre-footer-col" style="font-size:17px">
				<h2>关于我们</h2>
				<p>我们趣分期是以服务大学生、方便大学生购物为基本宗旨的 ，在这里你可以不花一分钱就买到自己心仪已久的宝贝，还在等什么呢</p>
			</div>
			<!-- END BOTTOM ABOUT BLOCK -->
			
			<!-- BEGIN BOTTOM CONTACTS -->
			<div class="col-md-3 col-sm-6 pre-footer-col" style="margin-left:450px">
				<h2>联系我们</h2>
				<address class="margin-bottom-40">
					上海市闵行区<br>
					东川路800号<br>
					电话: 021-12345555<br>
					邮箱: 12345678@163.com<br>
				</address>
			</div>
			<!-- END BOTTOM CONTACTS -->
		</div>
	</div>
</div>
<!-- END PRE-FOOTER -->
<!-- BEGIN FOOTER -->
<div class="footer padding-top-15">
	<div class="container">
		<div class="row">
			<!-- BEGIN COPYRIGHT -->
			<div class="col-md-6 col-sm-6 padding-top-10" style="text-align:center;margin-left:330px">
				2016 @Copyright Reserved
			</div>
			<!-- END COPYRIGHT -->
		</div>
	</div>
</div>
<!-- END FOOTER -->

	<!-- Load javascripts at bottom, this will reduce page load time -->
	<!-- BEGIN CORE PLUGINS(REQUIRED FOR ALL PAGES) -->
	<!--[if lt IE 9]>
<script src="${ctx }/assets/plugins/respond.min.js"></script>
<![endif]-->
	<script src="${ctx }/assets/plugins/jquery-1.10.2.min.js"
		type="text/javascript"></script>
	<script src="${ctx }/assets/plugins/jquery-migrate-1.2.1.min.js"
		type="text/javascript"></script>
	<script src="${ctx }/assets/plugins/bootstrap/js/bootstrap.min.js"
		type="text/javascript"></script>
	<script type="text/javascript"
		src="${ctx }/assets/plugins/back-to-top.js"></script>
	<script type="text/javascript"
		src="${ctx }/assets/plugins/jQuery-slimScroll/jquery.slimscroll.min.js"></script>
	<!-- END CORE PLUGINS -->
	<!-- BEGIN PAGE LEVEL JAVASCRIPTS(REQUIRED ONLY FOR CURRENT PAGE) -->
	<script type="text/javascript"
		src="${ctx }/assets/plugins/fancybox/source/jquery.fancybox.pack.js"></script>
	<script type="text/javascript"
		src="${ctx }/assets/plugins/bxslider/jquery.bxslider.min.js"></script>
	<!-- slider for products -->
	<script src="${ctx }/assets/plugins/rateit/src/jquery.rateit.js"
		type="text/javascript"></script>
	<script type="text/javascript"
		src='${ctx }/assets/plugins/zoom/jquery.zoom.min.js'></script>
	<!-- product zoom -->
	<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
	<!-- for slider-range -->
	<script src="${ctx }/assets/plugins/uniform/jquery.uniform.min.js"
		type="text/javascript"></script>
	<script
		src="${ctx }/assets/plugins/bootstrap-touchspin/bootstrap.touchspin.js"
		type="text/javascript"></script>
	<!-- Quantity -->
	<script type="text/javascript" src="${ctx }/assets/scripts/app.js"></script>
	<script type="text/javascript">
jQuery(document).ready(function() {
App.init();
App.initBxSlider();
App.initImageZoom();
App.initSliderRange();
App.initUniform();
App.initTouchspin();
});
</script>
	<!-- END PAGE LEVEL JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>
