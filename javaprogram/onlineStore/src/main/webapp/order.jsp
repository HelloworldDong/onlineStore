<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
<script src="${ctx }/assets/js/bootstrap/js/bootstrap.js"></script>
</head>
<c:if test="${sessionScope==null || sessionScope.userName==null}">
<c:redirect url="/login.jsp" /> 
</c:if>
<body
	style="background-image : url(${ctx}/assets/img/background2.jpg); ">
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
	function cancel(orderID){
		 $("#myModal").modal();
		 $("#delbtn").click(function(){
			 var para={"id":orderID};
			  $.ajax({                           	  
	                url: ' ${ctx}/order/cancel',                        
	                type: 'POST',    
	                data:para,
	                success: function (msg) {                      
	                if (msg == "ok"){ 
	                	 $("#myModal1").modal();
	                }    
	                else{
	                	 $("#myModal2").modal();
	                }
	                 }              
	             });          
			 
		 });
		
	}

	
	function pay(id){
		var para={"id":id};
		  $.ajax({                           	  
              url: ' ${ctx}/order/paydetaili',                      
              type: 'POST',                  
              data: para,                  
              success: function (order) {
            	  $("#maincontent").html("订单编号："+order.orderID+"; 每期应还：￥"+order.perIns+"<br><br>是否确认还款？");
              }
      });	  
		$("#payModal").modal();
	}
	
	
	
	</script>

	<div class="modal small fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h3 id="myModalLabel">取消订单</h3>
				</div>
				<div class="modal-body">
					<p class="error-text">
				
						<i class="fa fa-warning modal-icon"></i>确定要取消订单？还款中和还款已完成订单无法取消
					</p>
				</div>
				<div class="modal-footer">
					<button class="btn btn-default" data-dismiss="modal"
						aria-hidden="true">取消</button>
					<button class="btn btn-danger" id="delbtn" data-dismiss="modal">确认取消</button>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal small fade" id="myModal1" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h3 id="myModalLabel">成功</h3>
				</div>
				<div class="modal-body">
					<p class="error-text">
						取消订单成功
					</p>
				</div>
				<div class="modal-footer">
					
					<a href="${ctx }/order/showorder"><button class="btn btn-danger" id="delbtn">确定</button></a>
				</div>
			</div>
		</div>
	</div>
	
	
	<div class="modal small fade" id="myModal2" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h3 id="myModalLabel">取消订单失败</h3>
				</div>
				<div class="modal-body">
					<p class="error-text">
						<i class="fa fa-warning modal-icon"></i>还款中和还款已完成订单无法取消
					</p>
				</div>
				<div class="modal-footer">
					<button class="btn btn-danger" id="delbtn" data-dismiss="modal">确定</button>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal small fade" id="payModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h3 id="myModalLabel">还款</h3>
				</div>
				<div class="modal-body" >
					<p class="error-text" id="maincontent">
					
					</p>
				</div>
				<div class="modal-footer">
					<button class="btn btn-danger"  data-dismiss="modal" data-toggle="modal"  data-target="#lastModal">确定</button>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal small fade" id="lastModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h3 id="myModalLabel">还款</h3>
				</div>
				<div class="modal-body" >
					<p class="error-text" id="maincontent">
					成功！
					</p>
				</div>
				<div class="modal-footer">
					<button class="btn btn-danger"  data-dismiss="modal">确定</button>
				</div>
			</div>
		</div>
	</div>
	
	<div class="col-md-12 col-sm-12">
		<h1>历史订单</h1>
		<div class="shopping-cart-page">
			<div class="shopping-cart-data clearfix">

				<!-- BEGIN CONTENT -->

				<div class="table-wrapper-responsive">
					<table summary="Shopping cart">
						<tr>
							<th class="shopping-cart-ref-no">订单编号</th>
							<th class="shopping-cart-image">商品</th>
							<th class="shopping-cart-description">商品名称</th>
							<th class="shopping-cart-description">数量</th>
							<th class="shopping-cart-ref-no">分期</th>
							<th class="shopping-cart-price">每期应还</th>
							<th class="shopping-cart-description">下单时间</th>
							<th class="shopping-cart-total" >订单状态</th>
							<th class="shopping-cart-description" >收货地址</th>
							<th>还款</th>
							<th>取消订单</th>
						</tr>

						<c:forEach var="i" items="${order}">
							<tr>
								<td class="shopping-cart-ref-no">${i.orderID}</td>
								<td class="shopping-cart-image"><img
									src="${ctx}/assets/img/${i.photo}" height="80px" width="100px">
								</td>
								<td class="shopping-cart-description">${i.name}</td>
								<td class="shopping-cart-quantity">${i.number }</td>
								<td class="shopping-cart-ref-no">${i.installment }期</td>
								<td class="shopping-cart-price"><strong><span>￥</span>${i.perIns}</strong>
								</td>
								<td class="shopping-cart-description">${i.orderTime }</td>
								<td class="shopping-cart-total">
								<c:if test="${i.status ==0}">
								订单已取消
								</c:if>
								<c:if test="${i.status==1}">
								已下单未审核
								</c:if>
								<c:if test="${i.status==2}">
								已下单已审核
								</c:if>
								<c:if test="${i.status ==3}">
								审核未通过
								</c:if>
								<c:if test="${i.status==4}">
								还款中
								</c:if>
								<c:if test="${i.status ==5}">
								还款完成
								</c:if>
								<td class="shopping-cart-description">${i.address }</td>
								
								<td class="del-goods-col"><button class="btn btn-default" onclick="pay(${i.orderID})" type="button" <c:if test="${i.status==0}">disabled="true"</c:if>>还款</button></td>
									<td class="del-goods-col"><button onclick="cancel(${i.orderID})" class="btn btn-default"
										type="button">取消</button></td>
							</tr>
						</c:forEach>
					</table>
				</div>




			</div>
		</div>
		<!-- END CONTENT -->
</body>
</html>