package com.baidu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.baidu.controller.MarketController;
import com.baidu.entity.Market;
import com.baidu.entity.User;
import com.baidu.until.Page;

/**
  *@author 思远
  *@version 创建时间：2018年5月15日 下午3:05:13
  *类说明：
  */
@Mapper
public interface MarketMapper {

	User getUser(@Param("name")String name,@Param("pwd")String pwd);

	int getMarketCount(String mohu);

	//List<Market> getMarkeList(Page page);

	List<Market> getBname();

	List<Market> getSupplier();

	void toAddMarket(Market market);

	void toDelete(int bid);

	List<Market> getMarkeList(@Param("page")Page page,@Param("market") Market market);

}

