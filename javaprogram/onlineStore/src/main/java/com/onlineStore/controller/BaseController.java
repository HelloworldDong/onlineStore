package com.onlineStore.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.onlineStore.entity.User;
import com.onlineStore.service.GoodsService;
import com.onlineStore.service.UserService;
import com.onlineStore.entity.Goods;
@Controller
@RequestMapping(value="/base")
public class BaseController {
	@Autowired
	private UserService userService;

	@Autowired
	private GoodsService goodsService;
	/**
     * 用户登录
     * @param username,password
     * @return
     */
	
	@RequestMapping(value = "/login")
	public String login(@RequestParam(value="userName",required=true) String userName,@RequestParam(value="password",required=true)String password,
			HttpSession session,
			Map<String, Object> map){
		String msg="";
		User user=userService.findByName(userName);
		if(user!=null && user.getPassword().equals(password)){
			session.setAttribute("userName", userName);
			session.setAttribute("userID",user.getUserID() );
			
			if(user.getIsAdmin()==1){
				session.setAttribute("isAdmin",1 );
				msg= "admin";
			}
			else{
				session.setAttribute("isAdmin",0 );
				msg= "ok";
			}
		}
		else{
		session.setAttribute("userName",null);
		session.setAttribute("userID",null);
		session.setAttribute("isAdmin",null );
		msg= "error";
		}
		map.put("msg", msg);
		return "redirect:/login.jsp";
	}
	
	@RequestMapping(value = "/logout")
	public String logout(HttpSession session){
		session.setAttribute("userName",null);
		session.setAttribute("userID",null);
		session.setAttribute("isAdmin",0 );
		return "redirect:/index.jsp";
	}
	
	@RequestMapping(value = "/register")
	public String register(@RequestParam(value="userName",required=true) String userName,
			@RequestParam(value="password",required=true)String password,
			@RequestParam(value="realName",required=true)String realName,
			@RequestParam(value="telephone",required=true)String telephone,
			@RequestParam(value="address",required=true)String address,
			@RequestParam(value="email",required=true)String email,
			Map<String, Object> map){
		String result="";
		User iuser=userService.findByName(userName);
		if(iuser!=null)
			result="exist";
		else{
		User user=new User();
		user.setUserName(userName);
		user.setPassword(password);
		user.setRealName(realName);
		user.setTelephone(telephone);
		user.setAddress(address);
		user.setEmail(email);
		userService.add(user);
		result= "success";
		}
		map.put("result", result);
		return "redirect:/register.jsp";
	}
	
	@RequestMapping(value = "/update")
	@ResponseBody
	public String update(
			@RequestParam(value="password",required=true)String password,
			@RequestParam(value="realName",required=true)String realName,
			@RequestParam(value="telephone",required=true)String telephone,
			@RequestParam(value="address",required=true)String address,
			@RequestParam(value="email",required=true)String email,
			HttpSession session){
		int userID=(Integer) session.getAttribute("userID");
		User user=userService.findByID(userID);
		user.setPassword(password);
		user.setRealName(realName);
		user.setTelephone(telephone);
		user.setAddress(address);
		user.setEmail(email);

		userService.update(user);
		return "success";
	}
	@RequestMapping(value = "/load")
	@ResponseBody
	public User load(HttpSession session){
		int userID=(Integer) session.getAttribute("userID");
		User user=userService.findByID(userID);
		  return user;
	}
	
	@RequestMapping(value = "/showgoods")
	@ResponseBody
	public  List<Goods> showgoods(@RequestParam(value="category",required=true)String category){
		return goodsService.show(category);
	}
	

	@RequestMapping(value = "/search")
	@ResponseBody
	public  List<Goods> search(@RequestParam(value="name",required=true)String name){
		return goodsService.search('%'+name+'%');
		
	}
	
	@RequestMapping(value = "/detail")
	public String goodsDetail(@RequestParam(value="goodsID",required=true)int goodsID,Map<String, Object> map){
		Goods goods=goodsService.searchById(goodsID);
		map.put("item", goods);
		return "item";
		
	}

	@RequestMapping(value = "/searchUser")
	public String searchUser(@RequestParam(value="id",required=true) int userID,Map<String, Object> map){
		User user=userService.search(userID);
		map.put("user", user);
		return "userResult";
	}
}

