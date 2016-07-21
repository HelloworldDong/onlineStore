package com.onlineStore.controller;

import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.onlineStore.entity.Orders;
import com.onlineStore.entity.User;
import com.onlineStore.page.Page;
import com.onlineStore.service.OrderService;
import com.onlineStore.service.UserService;

@Controller
@RequestMapping(value="/validate")
public class ValidateController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private OrderService orderService;
	
	@RequestMapping(value = "/showuser",method={RequestMethod.GET,RequestMethod.POST})
	public String showuser(Page<User> pageModel,Map<String, Object> map){
		
		Page<User> users = userService.findPage(pageModel);
		map.put("users",users);
		return "users";
	}
	
	@RequestMapping(value = "/validateUser")
	@ResponseBody
	public String validateUser(@RequestParam(value="userID",required=true)int[] userID){
		for(int id:userID){
			userService.validate(id);
		}
		return "ok";
		
	}
	
	@RequestMapping(value = "/rejectUser")
	@ResponseBody
	public String rejectUser(@RequestParam(value="userID",required=true)int[] userID){
		for(int id:userID){
			userService.reject(id);
		}
		return "ok";	
	}
	
	@RequestMapping(value = "/showorder")
	public String showorder(Map<String, Object> map){
		List<Orders> orders=orderService.findAll();
		map.put("orders",orders);
		return "orders";
	}
	
	
	@RequestMapping(value = "/validateOrder")
	@ResponseBody
	public String validateOrder(@RequestParam(value="orderID",required=true)int[] orderID){
		for(int id:orderID){
			orderService.validate(id);
		}
		return "ok";
		
	}
	
	@RequestMapping(value = "/rejectOrder")
	@ResponseBody
	public String rejectOrder(@RequestParam(value="orderID",required=true)int[] orderID){
		for(int id:orderID){
			orderService.reject(id);
		}
		return "ok";	
	}
}
