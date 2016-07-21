<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<c:if test="${sessionScope==null || sessionScope.userName==null}">
<c:redirect url="/login.jsp" /> 
</c:if>
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
 <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
 <script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
</head>
<body style="background-image : url(${ctx}/assets/img/background.jpg); ">
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
	<div class="col-md-12 col-sm-12">
		<h1 style="color: red">购物车</h1>
		<div class="shopping-cart-page">
			<div class="shopping-cart-data clearfix">
				<c:set var="sum" value="0"></c:set>
				<c:forEach var="i" items="${cart}">
					<c:set var="sum" value="${sum+i.price*i.number}"></c:set>
					<!-- BEGIN CONTENT -->

					<div class="table-wrapper-responsive">
						<table summary="Shopping cart">
							<tr>
								<th class="shopping-cart-image">商品图片</th>
								<th class="shopping-cart-description">描述</th>
								<th class="shopping-cart-ref-no">分期</th>
								<th class="shopping-cart-quantity">数量</th>
								<th class="shopping-cart-price">单价</th>
								<th class="shopping-cart-total" colspan="2">总价</th>
							</tr>
							<tr>
								<td class="shopping-cart-image"><img
									src="${ctx}/assets/img/${i.photo}" height="100px" width="150px">
								</td>
								<td class="shopping-cart-description">
									<h3>${i.name}</h3>
								</td>
								<td class="shopping-cart-ref-no">${i.installment}期</td>
								<td class="shopping-cart-quantity">
									<div class="product-quantity">
										<input id="product-quantity" type="text" value="${i.number }"
											readonly class="form-control input-sm">
									</div>
								</td>
								<td class="shopping-cart-price"><strong><span>￥</span>${i.price}</strong>
								</td>
								<td class="shopping-cart-total"><strong><span>￥</span>${i.price *i.number}</strong>
								</td>
								<td class="del-goods-col"><a class="del-goods"
									href="${ctx }/order/delete?goodsID=${i.goodsID}"><i
										class="fa fa-times"></i></a></td>
							</tr>

						</table>
					</div>
				</c:forEach>
				<script type="text/javascript">
    $(function(){
    	
  	  $("#btn").click(function(){
  		  var para={"password":$("#password").val(),"address":$("#address").val()};
            $.ajax({                           	  
                url: ' ${ctx}/order/neworder',                        
                type: 'POST',    
                data:para,
                success: function (msg) {                      
                if (msg == "ok"){ 
                	$("#btn1").click();
                }    
                else{
                	$("#btn2").click();
                }
                 }              
             });          
  		  
  	  });
  	  
    });
    
    
    
    </script>
				<div class="shopping-total">
					<ul>
						<li class="shopping-total-price"><em>总价</em> <strong
							class="price"><span>￥</span>${sum }</strong></li>
					</ul>
				</div>
			</div>
			<a href="${ctx }/index.jsp"><button class="btn btn-default"
					type="button">
					继续购物<i class="fa fa-shopping-cart"></i>
				</button> </a>
			 <button class="btn btn-primary"  data-toggle="modal" data-target="#myModal" >立即下单 <i class="fa fa-check"></i></button> 
		</div>
	</div>
	<!-- END CONTENT -->
	
<button id="btn1" class="btn btn-primary btn-lg" data-toggle="modal" 
   data-target="#myModal1" style="display:none;"></button>
   <button id="btn2" class="btn btn-primary btn-lg" data-toggle="modal" 
   data-target="#myModal2" style="display:none;"></button>	


<div class="modal fade" id="myModal1"  tabindex="-1" role="dialog" 
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content" style="margin-top:200px">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" 
               aria-hidden="true">×
            </button>
            <h4 class="modal-title" id="myModalLabel">
          下单成功
            </h4>
         </div>
         <div class="modal-body">
            您的订单已提交，请耐心等待审核
         </div>
         <div class="modal-footer">
           <a href="${ctx }/index.jsp"> <button type="button" class="btn btn-primary" >确定 </button></a>
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
            下单失败
            </h4>
         </div>
         <div class="modal-body">
            请检查密码是否输入正确!
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-primary" 
               data-dismiss="modal">关闭
            </button>
         </div>
      </div><!-- /.modal-content -->
   </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

	
<div class="modal fade" id="myModal"  tabindex="-1" role="dialog" 
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content" style="margin-top:200px">
         <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" 
               aria-hidden="true">×
            </button>
            <h4 class="modal-title" id="myModalLabel"> 确认下单</h4>
         </div>
         <div class="modal-body">
         请输入密码<br><input type="password" id="password"/><br><br><br>
         收货地址：<br><textarea id="address" rows="3" ></textarea>
         </div>
         <div class="modal-footer">
            <button type="button" id="btn" class="btn btn-primary" 
               data-dismiss="modal">确认
            </button>
         </div>
      </div><!-- /.modal-content -->
   </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</body>
</html>