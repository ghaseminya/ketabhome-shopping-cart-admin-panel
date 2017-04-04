<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="fa">
  <head>
    <title>خوش آمدید</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/util.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
  </head>
  
  <body dir="rtl">
  
  <center>
  	<br/><br/>
    <h1>خوش آمد گویی</h1>
    <br/>
    <a href="${pageContext.request.contextPath}">خانه</a> 
    <c:if test="${sessionScope.customer==null }" >
    	 <a href="${pageContext.request.contextPath}/regist.jsp">ثبت نام</a>
    	<a href="${pageContext.request.contextPath}/login.jsp">ورود</a>
    </c:if>
      <c:if test="${sessionScope.customer!=null }" >
    	 ${sessionScope.customer.username }
    	 <a href="${pageContext.request.contextPath}/servlet/ClientServlet?op=logout">خروج</a>	
    </c:if>
    
   
    <a href="${pageContext.request.contextPath}/servlet/ClientServlet?op=showOrders">سفارشات من</a>
    <a href="${pageContext.request.contextPath}/showCart.jsp">سبد خرید</a>
    <br/>
    