<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="utf-8">
<title>OnlineShop</title>
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


	<!-- BEGIN TOP SEARCH -->

	<center>
		<br> <br>
		<form>
			<div class="input-group">
				<input id="search" type="text" size="35"
					style="height: 32px">

				<button id="btn" class="btn btn-primary" type="button">搜索</button>

			</div>
		</form>
		<br> <br>
	</center>
	<!-- END TOP SEARCH -->

	<!-- END HEADER -->

	<!-- BEGIN SIDEBAR & CONTENT -->
	<div class="row margin-bottom-40">
		<!-- BEGIN SIDEBAR -->
		<div class="sidebar col-md-3 col-sm-5">
			<ul class="list-group margin-bottom-25 sidebar-menu">
				<li class="list-group-item clearfix"><a href="#" id="a1"><i
						class="fa fa-angle-right"></i> 手机</a></li>
				<li class="list-group-item clearfix"><a href="#" id="a2"><i
						class="fa fa-angle-right"></i> 电脑</a></li>
				<li class="list-group-item clearfix"><a href="#" id="a3"><i
						class="fa fa-angle-right"></i> 服装</a></li>
				<li class="list-group-item clearfix"><a href="#" id="a4"><i
						class="fa fa-angle-right"></i> 图书</a></li>
				<li class="list-group-item clearfix"><a href="#" id="a5"><i
						class="fa fa-angle-right"></i> 食品</a></li>
			</ul>
		</div>
		<!-- END SIDEBAR -->
		<script type="text/javascript">
              $(function(){
            	  var para={"category":"phone"};
                      $.ajax({                           	  
                          url: ' ${ctx}/base/showgoods',                      
                          type: 'POST',                  
                          data: para,                  
                          success: function (goods) {
                        	
                        	var products="";
                        	for(i in goods){
                        		var product='<div class="col-md-4 col-sm-6 col-xs-12"><div class="product-item"><div class="pi-img-wrapper">  <img  src="${ctx }/assets/img/'+goods[i].photo+'" width="200px" height="200px" class="img-responsive" ></div> <h3>'+goods[i].name+'</h3><div class="pi-price">'+goods[i].price+'</div> <a href="${ctx}/base/detail?goodsID='+goods[i].goodsId+'" class="btn btn-default add2cart">查看</a></div> </div>';
                        		products=products+product;
                        	}
                        	document.getElementById("productlist").innerHTML=products;
                        	}              
                       });    
                      $("#a1").click(function(){
                    	  var para={"category":"phone"};
                    	  $.ajax({                           	  
                              url: ' ${ctx}/base/showgoods',                      
                              type: 'POST',                  
                              data: para,                  
                              success: function (goods) {
                            	
                            	var products="";
                            	for(i in goods){
                            		var product='<div class="col-md-4 col-sm-6 col-xs-12"><div class="product-item"><div class="pi-img-wrapper">  <img  src="${ctx }/assets/img/'+goods[i].photo+'" width="200px" height="200px" class="img-responsive" ></div> <h3>'+goods[i].name+'</h3><div class="pi-price">'+goods[i].price+'</div> <a href="${ctx}/base/detail?goodsID='+goods[i].goodsId+'" class="btn btn-default add2cart">查看</a></div> </div>';
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
                            		var product='<div class="col-md-4 col-sm-6 col-xs-12"><div class="product-item"><div class="pi-img-wrapper">  <img  src="${ctx }/assets/img/'+goods[i].photo+'" width="200px" height="200px" class="img-responsive" ></div> <h3>'+goods[i].name+'</h3><div class="pi-price">'+goods[i].price+'</div> <a href="${ctx}/base/detail?goodsID='+goods[i].goodsId+'" class="btn btn-default add2cart">查看</a></div> </div>';
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
                            		var product='<div class="col-md-4 col-sm-6 col-xs-12"><div class="product-item"><div class="pi-img-wrapper">  <img src="${ctx }/assets/img/'+goods[i].photo+'" width="200px" height="200px" class="img-responsive" ></div> <h3>'+goods[i].name+'</h3><div class="pi-price">'+goods[i].price+'</div> <a href="${ctx}/base/detail?goodsID='+goods[i].goodsId+'" class="btn btn-default add2cart">查看</a></div> </div>';
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
                            		var product='<div class="col-md-4 col-sm-6 col-xs-12"><div class="product-item"><div class="pi-img-wrapper">  <img  src="${ctx }/assets/img/'+goods[i].photo+'"  width="200px" height="200px" class="img-responsive" ></div> <h3>'+goods[i].name+'</h3><div class="pi-price">'+goods[i].price+'</div> <a href="${ctx}/base/detail?goodsID='+goods[i].goodsId+'" class="btn btn-default add2cart">查看</a></div> </div>';
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
                            		var product='<div class="col-md-4 col-sm-6 col-xs-12"><div class="product-item"><div class="pi-img-wrapper">  <img  src="${ctx }/assets/img/'+goods[i].photo+'" width="200px" height="200px" class="img-responsive" ></div> <h3>'+goods[i].name+'</h3><div class="pi-price">'+goods[i].price+'</div> <a href="${ctx}/base/detail?goodsID='+goods[i].goodsId+'" class="btn btn-default add2cart">查看</a></div> </div>';
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
                            		var product='<div class="col-md-4 col-sm-6 col-xs-12"><div class="product-item"><div class="pi-img-wrapper">  <img  src="${ctx }/assets/img/'+goods[i].photo+'" width="200px" height="200px" class="img-responsive" ></div> <h3>'+goods[i].name+'</h3><div class="pi-price">'+goods[i].price+'</div> <a href="${ctx}/base/detail?goodsID='+goods[i].goodsId+'" class="btn btn-default add2cart">查看</a></div> </div>';
                            		products=products+product;
                            	}
                            	document.getElementById("productlist").innerHTML=products;
                            	}              
                      });
                    	  
                      });
                      
            	  });
            
            </script>

		<!-- BEGIN CONTENT -->
		<div class="col-md-9 col-sm-7">
			<!-- BEGIN PRODUCT LIST -->
			<div id="productlist" class="row product-list"></div>
			<!-- END PRODUCT LIST -->

		</div>
		<!-- END CONTENT -->
	</div>
	<!-- END SIDEBAR & CONTENT -->



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
<!-- BEGIN PRE-FOOTER -->
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