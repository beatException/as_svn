<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript">
		function User(name){
		this.name=name;
		}
		function sends(){
		 
		var user=new User("abc");
		var str=JSON.stringify(user);
		 
		$.ajax({
		url:"sendsJson",
		type:"post",
		contentType:"application/json",
		data:str,
		success:function(da){
		alert(da);
		
		}
		
		
		
		});
		
		}
	
	</script>
	
	
  </head>
  
  <body>
     <a href="findUsers?username=lx">find</a><br/>
     <form action="toAddUser" method="post">
     	<input type="text" name="name"/>
     	<input type="text" name="roleid"/>
     	<input type="submit" value="submit"/>
     
     </form>
     <a href="printJson">find</a><br/>
     <a href="javascript:sends()">sendJson</a><br/>
  </body>
</html>
