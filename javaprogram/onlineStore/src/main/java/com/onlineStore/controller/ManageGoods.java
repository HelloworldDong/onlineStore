package com.onlineStore.controller;

import java.util.List;
import java.io.File;  
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.onlineStore.entity.Goods;
import com.onlineStore.service.GoodsService;

@Controller
@RequestMapping(value="/manageGoods")
public class ManageGoods {
	@Autowired
	private GoodsService goodsService;
	
	@RequestMapping(value = "/findAll")
	public String findAll(Map<String, Object> map){
		List<Goods> goods=goodsService.findAll();
		map.put("goods", goods);
		return "goods";
	}
	
	@RequestMapping(value = "/searchGoods")
	public String find(@RequestParam(value="id",required=true) int goodsID,Map<String, Object> map){
		List<Goods> goods=goodsService.find(goodsID);
		map.put("goods", goods);
		return "goods";
	}
	
	@RequestMapping(value = "/add")
	@ResponseBody
	public String add(Goods goods,@RequestParam(value = "file", required = false) MultipartFile file,HttpServletRequest request){
		String path = request.getServletContext().getRealPath("/assets/img");
		goodsService.add(goods);
		int id=goods.getGoodsId();
		String filename=id+".jpg";
		goods.setPhoto(filename);
		goodsService.photo(goods);
		File targetFile = new File(path, filename); 
		 if(!targetFile.exists()){  
	            targetFile.mkdirs();  
	        }  
		 try {  
	            file.transferTo(targetFile);  
	        } catch (Exception e) {  
	            e.printStackTrace();  
	        }  
		return "ok";
		
	}
	
	@RequestMapping(value = "/modify")
	@ResponseBody
	public String modify(Goods goods,@RequestParam(value = "file", required = false) MultipartFile file,HttpServletRequest request){
		
		goodsService.update(goods);
		int id=goods.getGoodsId();
		String filename=id+".jpg";
		String path = request.getServletContext().getRealPath("/assets/img");

		File targetFile = new File(path, filename); 
		 if(!targetFile.exists()){  
	            targetFile.mkdirs();  
	        }  
		 try {  
	            file.transferTo(targetFile);  
	        } catch (Exception e) {  
	            e.printStackTrace();  
	        }  
		
		return "success";
		
	}
	
	@RequestMapping(value = "/delete")
	public String delete(@RequestParam(value="id",required=true) int goodsID,Map<String, Object> map){

		goodsService.delete(goodsID);
		return findAll(map);
	}
	
	@RequestMapping(value = "/load")
	public String load(@RequestParam(value="id",required=true) int goodsID,Map<String, Object> map){
		Goods goods=goodsService.searchById(goodsID);
		map.put("goods", goods);
		return "editGoods";
	}
}
