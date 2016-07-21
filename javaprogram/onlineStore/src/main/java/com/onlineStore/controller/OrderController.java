package com.onlineStore.controller;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.onlineStore.entity.Cart;
import com.onlineStore.entity.Orders;
import com.onlineStore.entity.Showcart;
import com.onlineStore.entity.Showorder;
import com.onlineStore.entity.User;
import com.onlineStore.service.CartService;
import com.onlineStore.service.OrderService;
import com.onlineStore.service.UserService;

import  java.lang.Math;
import java.text.*;

@Controller
@RequestMapping(value="/order")
public class OrderController {


	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/cart")
	@ResponseBody
	public String addToCart(@RequestParam(value="goodsID",required=true) int goodsID,
			@RequestParam(value="number",required=true) int number,
			@RequestParam(value="installment",required=true) int installment,
			HttpSession session){
		Cart cart=new Cart();
		int userID=(Integer)session.getAttribute("userID");
		cart.setUserID(userID);
		cart.setGoodsID(goodsID);
		cart.setNumber(number);
		cart.setInstallment(installment);
		Cart scart=cartService.search(cart);
		if(scart!=null)
			cartService.update(cart);
		else
			cartService.add(cart);
		return "ok";
	}
	
	@RequestMapping(value = "/showcart")
	public String showcart(HttpSession session,Map<String, Object> map){
		if(session==null||session.getAttribute("userID")==null)
			return "redirect:/login.jsp";
		int userid=(Integer) session.getAttribute("userID");
		List<Showcart> showcart=cartService.show(userid);
		map.put("cart",showcart);
		
		return "pay";
	}
	
	@RequestMapping(value = "/delete")
	public String delete(@RequestParam(value="goodsID",required=true) int goodsID,HttpSession session,Map<String, Object> map){
		cartService.delete(goodsID);
		return showcart(session, map);
	}
	
	
	@RequestMapping(value = "/neworder")
	@ResponseBody
	public String neworder(@RequestParam(value="password",required=true) String password,
			@RequestParam(value="address",required=true) String address,
			HttpSession session){
		int userID=(Integer) session.getAttribute("userID");
		User user=userService.findByID(userID);
		if(!password.equals(user.getPassword()))
			return "error";
		List<Showcart> Showcarts=cartService.show(userID);
		Showcart showcart=new Showcart();
		Orders orders=new Orders();
		DecimalFormat df = new DecimalFormat("#.00");
		for(int i=0;i<Showcarts.size();i++){
			showcart=Showcarts.get(i);
			orders.setUserID(userID);
			orders.setGoodsID(showcart.getGoodsID());
			orders.setNumber(showcart.getNumber());
			orders.setInstallment(showcart.getInstallment());
			orders.setPerIns(Double.parseDouble(df.format(showcart.getNumber()*showcart.getPrice()*Math.pow(1.01,showcart.getInstallment())/showcart.getInstallment())));
			Timestamp curtime=new Timestamp(System.currentTimeMillis());
			orders.setOrderTime(curtime);
			orders.setStatus(1);
			orders.setAddress(address);
			orderService.add(orders);
		}
		cartService.clear(userID);
		return "ok";
	}
	
	@RequestMapping(value = "/showorder")
	public String showorder(HttpSession session,Map<String, Object> map){
		if(session==null||session.getAttribute("userID")==null)
			return "redirect:/login.jsp";
		int userid=(Integer) session.getAttribute("userID");
		List<Showorder> showorder=orderService.show(userid);
		map.put("order",showorder);
		return "order";
	}
	
	@RequestMapping(value = "/searchOrder")
	public String searchOrder(@RequestParam(value="id",required=true) int orderID,Map<String, Object> map){
		Orders order=orderService.search(orderID);
		List<Orders> orders= new java.util.ArrayList<Orders>();
		orders.add(order);
		map.put("orders", orders);
		return "orders";
	}
	
	@RequestMapping(value = "/cancel")
	@ResponseBody
	public String cancel(@RequestParam(value="id",required=true) int orderID){
		Orders orders=orderService.search(orderID);
		if(orders.getStatus()==1||orders.getStatus()==2){
			orderService.cancel(orderID);
			return "ok";
			
		}
		else {
			return "error";
		}
		
	}
	
	
	@RequestMapping(value = "/paydetaili")
	@ResponseBody
	public Orders paydetaili(@RequestParam(value="id",required=true) int orderID){
		Orders order=orderService.search(orderID);
		return order;
	}
	
}
