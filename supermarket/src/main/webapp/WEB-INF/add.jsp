<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap-3.3.7-dist/css/bootstrap.min.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.8.2.min.js"></script>
</head>

<script type="text/javascript">
  //添加追加下拉款
  $(function(){
	 $.post("<%=request.getContextPath()%>/getAddMarket",function(mag){
		 //console.log(mag);
		var blist=mag.blist;
		var slist=mag.slist;
		
		var bhtml="";
		var shtml="";
		for ( var i = 0; i < blist.length; i++) {
			bhtml+="<option value="+blist[i].bname+">"+blist[i].bname+"</option>";
		} 
   		$("#bid").html(bhtml); 
   		
   		for ( var i = 0; i < slist.length; i++) {
   			shtml+="<option value="+slist[i].sid+">"+slist[i].supplier+"</option>";
   			} 
   		$("#sid").html(shtml);
	},"json");
});
  
  //添加
   function toAdd(){
	    $.post("<%=request.getContextPath()%>/toAddMarket",$("#f").serialize(),function(flg){
	    	console.log(flg);         
	    	 if(flg){
	    		 alert("添加成功！");
	    		 location="<%=request.getContextPath()%>/getMarkeList"
	    	 }else{
	    		 alert("添加失败！");
	    	 }
	    },"json")
  }

</script>
  
<body>
  <h2>超市管理系统——添加页面</h2>
  <form id="f">
   <table>
   
    <tr>
       <td>
                 商品名称:<select id="bid" name="bname">
                  
                </select><br/>
      </td> 
    </tr>
    <tr> 
      <td>
                   供应商:<select id="sid" name="sid">
             
               </select><br/>
      </td>
    </tr>
    <tr> 
      <td>
                    账单金额:<input type="text" id="price" name="price"><br/>
      </td>
    </tr>
    <tr> 
       <td>  
                  是否付款:<input type="radio"  name="payment" value="1">已付款
                 <input type="radio"  name="payment" value="0">未付款<br/> 
         
       </td>
    <tr>  
    <tr>
       <td>   
                 创建时间:<input type="text" id="datea" name="datea"><br/>
       </td>
    </tr>
    <tr>
       <td>
        <input type="button" value="添加" onclick="toAdd()">
       </td>
    </tr>
          
 
  </table>
 </form>
</body>
</html>