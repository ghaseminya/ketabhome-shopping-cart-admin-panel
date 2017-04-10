<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="ir.javahosting.i18n.msg" />
<!DOCTYPE HTML>
<html lang="${language}">
<head>
<title>KetabHome | Index</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="shortcut icon"  href="${pageContext.request.contextPath}/res/shop_assets/images/favicon.png" sizes="16x16" type="image/png">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="${pageContext.request.contextPath}/res/shop_assets/css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="${pageContext.request.contextPath}/res/shop_assets/css/form.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="${pageContext.request.contextPath}/res/shop_assets/js/jquery1.min.js"></script>
<!-- start menu -->
<link href="${pageContext.request.contextPath}/res/shop_assets/css/megamenu.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="${pageContext.request.contextPath}/res/shop_assets/js/megamenu.js"></script>
<script>$(document).ready(function(){$(".megamenu").megamenu();});</script>

<script src="${pageContext.request.contextPath}/res/shop_assets/js/jquery.easydropdown.js"></script>
</head>
<body>
     <div class="header-top">
	   <div class="wrap"> 
			  <div class="header-top-left">
                              <form  class="box">
                                  <select onchange="submit()" name="language" tabindex="4" class="dropdown">
							<option value="" class="label" value="">Language :</option>
							<option ${language == 'en' ? 'sellected' : ''} value="en">English</option>
							<option ${language == 'fa' ? 'sellected' : ''} value="fa">فارسی</option>
					  </select>
   				    </form>
   				    <div class="clear"></div>
   			 </div>
			 <div class="cssmenu">
				<ul>
					<li class="active"><a href="${pageContext.request.contextPath}/shop/login.sjp">Account</a></li> |
					<li><a href="${pageContext.request.contextPath}/shop/cart.jsp">Checkout</a></li> |
					<li><a href="${pageContext.request.contextPath}/shop/login.jsp">Log In</a></li> |
					<li><a href="${pageContext.request.contextPath}/shop/register.jsp">Sign Up</a></li>
				</ul>
			</div>
			<div class="clear"></div>
 		</div>
	</div>
	<div class="header-bottom">
	    <div class="wrap">
			<div class="header-bottom-left">
				<div class="logo">
					<a href="${pageContext.request.contextPath}/index.jsp">
                                            <img src="${pageContext.request.contextPath}/res/shop_assets/images/logo.png" style="height: 41px" alt=""/></a>
				</div>
				<div class="menu">
	            <ul class="megamenu skyblue">
			<li class="active grid"><a href="index.html"><fmt:message key="index.name" /></a></li>
			<li><a class="color4" href="#">Category</a>
				<div class="megapanel">
					<div class="row">
						<div class="col1">
							<div class="h_nav">
								<h4>List of Category</h4>
								<ul>
                                                                    <c:forEach items="${cs}" var="c">
                                                                        <li><a href="${pageContext.request.contextPath}/servlet/ClientServlet?op=listBookByCategory&categoryId=${c.id}">${c.name}</a></li>
    </c:forEach>
									</ul>	
							</div>							
						</div>
						
					  </div>
					</div>
				</li>				
				
				<li><a class="color6" href="${pageContext.request.contextPath}/shop/orders.jsp">Other</a></li>
				<li><a class="color7" href="${pageContext.request.contextPath}/shop/cart.jsp">Purchase</a></li>
			</ul>
			</div>
		</div>
	   <div class="header-bottom-right">
         <div class="search">	  
				<input type="text" name="s" class="textbox" value="Search" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search';}">
				<input type="submit" value="Subscribe" id="submit" name="submit">
				<div id="response"> </div>
		 </div>
	  <div class="tag-list">
	    <ul class="icon1 sub-icon1 profile_img">
			<li><a class="active-icon c1" href="#"> </a>
				<ul class="sub-icon1 list">
					<li><h3>sed diam nonummy</h3><a href=""></a></li>
					<li><p>Lorem ipsum dolor sit amet, consectetuer  <a href="">adipiscing elit, sed diam</a></p></li>
				</ul>
			</li>
		</ul>
		<ul class="icon1 sub-icon1 profile_img">
			<li><a class="active-icon c2" href="#"> </a>
				<ul class="sub-icon1 list">
					<li><h3>No Products</h3><a href=""></a></li>
					<li><p>Lorem ipsum dolor sit amet, consectetuer  <a href="">adipiscing elit, sed diam</a></p></li>
				</ul>
			</li>
		</ul>
	    <ul class="last"><li><a href="#">Cart(0)</a></li></ul>
	  </div>
    </div>
     <div class="clear"></div>
     </div>
	</div>  