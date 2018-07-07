package com.baidu.entity;
/**
  *@author 思远
  *@version 创建时间：2018年5月16日 上午9:03:40
  *类说明：
  */
public class Market {
   private Integer bid;
   private String  bname;
   private Integer sid;
   private String  price;
 
   private String  datea;
   private String  supplier;
   private String  payment;
public Integer getBid() {
	return bid;
}
public String getBname() {
	return bname;
}
public Integer getSid() {
	return sid;
}
public String getPrice() {
	return price;
}
public String getDatea() {
	return datea;
}
public String getSupplier() {
	return supplier;
}
public String getPayment() {
	return payment;
}
public void setBid(Integer bid) {
	this.bid = bid;
}
public void setBname(String bname) {
	this.bname = bname;
}
public void setSid(Integer sid) {
	this.sid = sid;
}
public void setPrice(String price) {
	this.price = price;
}
public void setDatea(String datea) {
	this.datea = datea;
}
public void setSupplier(String supplier) {
	this.supplier = supplier;
}
public void setPayment(String payment) {
	this.payment = payment;
}

   
   
   
}

