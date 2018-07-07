package com.baidu.controller;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baidu.entity.Market;
import com.baidu.entity.User;
import com.baidu.mapper.MarketMapper;
import com.baidu.until.Page;


/**
  *@author 思远
  *@version 创建时间：2018年5月15日 下午1:55:13
  *类说明：
  */
@Controller
public class MarketController {
	@Autowired
	private MarketMapper mapper;
	
   @RequestMapping("toUser")
	public String  test() {
		return "login";
	}
	
	//登录
   @RequestMapping("getUser")
   public String getUser(HttpServletRequest request,String name,String pwd) {
	
		 User user =mapper.getUser(name,pwd);
		 
		 if(user==null) {
			  request.setAttribute("error", "账号或密码有误！");
			  
			  return "forward:/toUser";
		 }else {
			  request.getSession().setAttribute("lanjie",user);
			 return "redirect:getMarkeList";
		 }	
	}
	
   
   
   //列表
	    @RequestMapping("getMarkeList")
	   
	     public String  getMarkeList(Market market,String mohu,String current,HttpServletRequest request) {
	    	 mohu=mohu==null?"":mohu;
	    	 int count=mapper.getMarketCount(mohu);
	    	 Page page=new Page<>(current, count, "3");
	    	 page.setMohu(mohu);
	    	 List<Market> list =mapper.getMarkeList(page,market);
	    	 request.setAttribute("mohu",mohu);
	    	 request.setAttribute("page",page);
	    	 request.setAttribute("list",list);
        	return "list";
      }
	 //添加
	   //到添加页面
		   @RequestMapping("toAdd")
		   public String  toAdd() {
				return "add";
			}
	//获取商品下拉列表getBname
	@RequestMapping("getAddMarket")
	@ResponseBody
	public Map<String, Object>  getAddMarket(){
		
		List<Market> blist=mapper.getBname();
		List<Market> slist=mapper.getSupplier();
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("blist", blist);
		map.put("slist", slist);
		return map;
	}
	//添加信息
	 @RequestMapping("toAddMarket")
	 @ResponseBody
	 public boolean toAddMarket(Market market) {
		  try {
			 mapper.toAddMarket(market);
			 return  true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return  false ;
		}
		 
	 }
	 //多条件查询（获取供应商下拉列表）getSupplier
	 @RequestMapping("getSupplier")
	 @ResponseBody
	 public List<Market> getSupplier(){
		 List<Market> slist=mapper.getSupplier();
		 return slist;
	 }
	 //单删toDelete
	 @RequestMapping("toDelete")
	 @ResponseBody
	 public boolean toDelete(int bid) {
		  try {
			 mapper.toDelete(bid);
			 return  true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return  false ;
		}
		 
	 }
	  
    
}

