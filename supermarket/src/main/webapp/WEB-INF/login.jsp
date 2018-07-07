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
 

<body>
  <form  class="col-xs-2" action="<%=request.getContextPath()%>/getUser" method="post" >
    ${error}
  <h3>用户登录页面</h3>
    
    用户名：<input class="form-control" type="text" id="name" name="name"><br>
    密码：<input class="form-control" type="text" id="pwd" name="pwd"><br>
    <input  class="btn btn-default" type="submit" value="登录" >
      
  </form>
 

  

</body>
</html>