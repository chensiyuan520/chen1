<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap-3.3.7-dist/css/bootstrap.min.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.8.2.min.js"></script>
</head>

<script type="text/javascript">
	//分页
	function fenye(current){
				$("#current").val(current);
				$("#myfrom").submit();
			}	
	//条件查询下拉列表的回显
	$(function(){
		$.post("<%=request.getContextPath()%>/getSupplier",function(img){
			//alert(img);
			
			 var HTML="";
			 HTML+="<option value=''>---请选择---</option>"
			 for (var i = 0; i <img.length; i++) {
				
				HTML+="<option value='"+img[i].sid+"'>"+img[i].supplier+"</option>"
				
			}
			$("#sid").html(HTML);
		},"json")
	})
    //添加
    function toAdd(){
      location="<%=request.getContextPath()%>/toAdd";
    } 
    //删除
    function todel(bid){
     // var bid=${param.bid}
      $.post("<%=request.getContextPath()%>/toDelete",{bid:bid},function(mag){
    	  // alert(mag);
    	   if(mag){
    		   alert("删除成功！");
    		   location="<%=request.getContextPath()%>/getMarkeList";
    	   }else{
    		   alert("删除失败！");
    	   }
    	   
      },"json")
    }
</script>
<body>
<table class="table table-bordered table-striped table-hover">
  <h2 align="center">超市管理系统</h2>
   <tr>
     <td colspan="6">
         <form action="<%=request.getContextPath() %>/getMarkeList"  method="post" id="myfrom">
			 <input type="hidden" name="current" value="${page.currentPage}" id="current" />
			 <input  type="text" name="mohu" value="${mohu}" id="mohu" />
			 
			 <select id="sid" name="sid">
			 
			 </select>
			 <select id="payment" name="payment">
			   <option value="">--请选择--</option>
			   <option value="0">未付款</option>
			   <option value="1">已付款</option>
			 </select>
	         <input  class="btn btn-default" type="submit" value="查询" />
	  </form>		
     </td>
      <td> 
        <input  class="btn btn-default" type="button" value="添加" onclick="toAdd()">
        
      </td>
   </tr>
    <tr>
      <td>商品编号</td>
      <td>商品名称</td>
      <td>供应商</td>
      <td>账单金额</td>
      <td>是否付款</td>
      <td>创建时间</td>
      <td>操作</td>
    </tr>
    
    <c:forEach items="${list}" var="u">
      <tr>
        <td>${u.bid}</td>
        <td>${u.bname}</td>
        <td>${u.supplier}</td>
        <td>${u.price}</td>
        <td>${u.payment==0?"未付款":"已付款"}</td>
        <td>${u.datea}</td>
        <td><input  class="btn btn-default" type="button" value="删除" onclick="todel(${u.bid})"></td>
  
      </tr>
    </c:forEach>
      <tr><td></td></tr>
       <tr>
				<td colspan="11">
					<input  class="btn btn-default" type="button" value="首页" onclick="fenye(1)"/>
					<input  class="btn btn-default" type="button" value="上一页" onclick="fenye(${page.previousPage})"/>
					<input  class="btn btn-default" type="button" value="下一页" onclick="fenye(${page.nextPage})"/>
					<input  class="btn btn-default" type="button" value="末页" onclick="fenye(${page.pageCount})"/>
				</td>
			</tr>
   </table>				
</body>
</html>