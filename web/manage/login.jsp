<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>ورود کاربران</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">


  </head>
  
  <body>
    <form action="${pageContext.request.contextPath}/servlet/LoginServlet" method="post">
    	نام کاربری：<input name="username"/><br/>
    	گذرواژه：<input type="password" name="password"/><br/>
    	<input type="submit" value="ورود"/>
    </form>
  </body>
</html>
