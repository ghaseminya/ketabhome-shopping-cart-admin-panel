<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="fa">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
        <link rel="icon" href="${pageContext.request.contextPath}/assets/images/smb/favicon.png" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/iran.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/font-awesome/4.5.0/css/font-awesome.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />
        <!--[if lte IE 9]>
                <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace-part2.min.css" class="ace-main-stylesheet" />
        <![endif]-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace-skins.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace-rtl.min.css" />
        <!--[if lte IE 9]>
          <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ace-ie.min.css" />
        <![endif]-->
        <script src="${pageContext.request.contextPath}/assets/js/ace-extra.min.js"></script>
        <!--[if lte IE 8]>
        <script src="${pageContext.request.contextPath}/assets/js/html5shiv.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/respond.min.js"></script>
        <![endif]-->
    </head><!--/head-->
  <body class="no-skin rtl">
        <div id="navbar" class="navbar navbar-default    navbar-collapse       h-navbar ace-save-state">
            <div class="navbar-container ace-save-state" id="navbar-container">
                <div class="navbar-header pull-right">
                    <a href="${pageContext.request.contextPath}/cms/index.jsp" class="navbar-brand">
                        <small >
                            <i class="fa fa-leaf"></i>
                            کتاب خانه
                        </small>
                    </a>

                    <button class="pull-left navbar-toggle navbar-toggle-img collapsed" type="button" data-toggle="collapse" data-target=".navbar-buttons,.navbar-menu">
                        <span class="sr-only" >منوی اصلی</span>

                        <img src="${pageContext.request.contextPath}/assets/images/kh/ketabhome.jpg" alt="sell my book" />
                    </button>

                    <button class="pull-left navbar-toggle collapsed" type="button" data-toggle="collapse" data-target="#sidebar">
                        <span class="sr-only">منوی سایت</span>

                        <span class="icon-bar"></span>

                        <span class="icon-bar"></span>

                        <span class="icon-bar"></span>
                    </button>
                </div>

                <div class="navbar-buttons navbar-header pull-left  collapse navbar-collapse" role="navigation">
                    <ul class="nav ace-nav">
                        
                        <li class="light-blue dropdown-modal user-min">
                            <a data-toggle="dropdown" href="#" class="dropdown-toggle">
                                
                                 <c:if test="${sessionScope.customer!=null }" >
                                 <img class="nav-user-photo" src="${pageContext.request.contextPath}/data/users/${uid}/${avatar}" alt="Sell My Book" />
                                <span class="user-info">
                                    ${name}
                                    <small>خوش آمدید,</small>
                                </span>
                                 </c:if>
                                 <c:if test="${sessionScope.customer==null }" >
                                 <img class="nav-user-photo" src="${pageContext.request.contextPath}/assets/images/smb/noimg.jpg" alt="Sell My Book" />
                                 
                                <span class="user-info">
                                    کاربرگرامی
                                    <small>خوش آمدید,</small>
                                </span>
                                 </c:if>
                                 
                                <i class="ace-icon fa fa-caret-down"></i>
                            </a>
                            <ul class="user-menu dropdown-menu-left dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                                
                                 <c:if test="${sessionScope.customer!=null }" >
                                <li>
                                    <a href="${pageContext.request.contextPath}/panel/index.jsp">
                                        <i class="ace-icon fa fa-cog"></i>
                                        پنل کاربری
                                    </a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/panel/orders.jsp">
                                        <i class="ace-icon fa fa-user"></i>
                                        لیست خرید ها
                                    </a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/servlet/ClientServlet?op=logout">
                                        <i class="ace-icon fa fa-power-off"></i>
                                        خروج
                                    </a>
                                </li>
                                </c:if>
                                <c:if test="${sessionScope.customer==null }" >
                                    <li>
                                    <a href="${pageContext.request.contextPath}/op/login.jsp">
                                        <i class="ace-icon fa fa-lock"></i>
                                        ثبت نام/ورود به پرتال
                                    </a>
                                </li>
                                </c:if>
                            </ul>
                        </li>
                    </ul>
                </div>
                <nav role="navigation" class="navbar-menu pull-right collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                        
                        <li>
                            <a href="${pageContext.request.contextPath}/st/faq.jsp">
                                <i class="ace-icon fa fa-umbrella"></i>
                                Help
                                <span class="badge badge-warning">۱۲۹</span>
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/st/price.jsp">
                                <i class="ace-icon fa fa-money"></i>
                                Cart
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/servlet/ClientServlet?op=showOrders">
                                <i class="ace-icon fa fa-money"></i>
                                Orders
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/st/about.jsp">
                                <i class="ace-icon fa fa-info"></i>
                                About Us
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/st/contact.jsp">
                                <i class="ace-icon fa fa-map-marker"></i>
                                Contact Us
                            </a>
                        </li>
                    </ul>
                                <form class="navbar-form navbar-left form-search" action="${pageContext.request.contextPath}/cms/all.jsp">
                        <div class="form-group">
                            <input type="text" placeholder="جستجو" name="query"/>
                        </div>

                        <button type="button" class="btn btn-mini btn-info2">
                            <i class="ace-icon fa fa-search icon-only bigger-110"></i>
                        </button>
                    </form>
                </nav>
            </div><!-- /.navbar-container -->
        </div>
        <div class="main-container ace-save-state" id="main-container">
            <script type="text/javascript">
                try {
                    ace.settings.loadState('main-container')
                } catch (e) {
                }
            </script>
            <div id="sidebar" class="sidebar      h-sidebar                navbar-collapse collapse          ace-save-state">
                <script type="text/javascript">
                    try {
                        ace.settings.loadState('sidebar')
                    } catch (e) {
                    }
                </script>
                <div class="sidebar-shortcuts" id="sidebar-shortcuts">
                    <div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
                        <a class="btn btn-success" href="${pageContext.request.contextPath}/op/register_gift.jsp">
                            <i class="ace-icon fa fa-gift"></i>
                        </a>
                        <a class="btn btn-info" href="${pageContext.request.contextPath}/op/register_sell.jsp">
                            <i class="ace-icon fa fa-shopping-basket"></i>
                        </a>
                        <a class="btn btn-warning" href="${pageContext.request.contextPath}/cms/all.jsp">
                            <i class="ace-icon fa fa-list"></i>
                        </a>
                        <a class="btn btn-danger" href="${pageContext.request.contextPath}/panel/index.jsp">
                            <i class="ace-icon fa fa-dashboard"></i>
                        </a>
                    </div>
                    <div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
                        <span class="btn btn-success"></span>
                        <span class="btn btn-info"></span>
                        <span class="btn btn-warning"></span>
                        <span class="btn btn-danger"></span>
                    </div>
                </div><!-- /.sidebar-shortcuts -->
                <ul class="nav nav-list">
                    <li id="dashboard" class=" hover highlight">
                        <a href="${pageContext.request.contextPath}/cms/index.jsp">
                            <i class="menu-icon fa fa-home"></i>
                            <span class="menu-text"> پیشخوان </span>
                        </a>
                        <b class="arrow"></b>
                    </li>
                    <li id="category" class=" hover highlight">
                        <a href="${pageContext.request.contextPath}/cms/all.jsp" >
                            <i class="menu-icon fa fa-desktop"></i>
                            <span class="menu-text">
                                موضوعات و دسته‌بندی‌ها
                            </span>
                            <b class="arrow fa fa-angle-down"></b>
                        </a>
                        <b class="arrow"></b>
                        
                    </li>
                    <li id="book" class="hover highlight">
						<a href="${pageContext.request.contextPath}/cms/gifts.jsp" >
							<i class="menu-icon fa fa-gift"></i>
							<span class="menu-text"> 
                                                        کتب اهدایی موجود
                                                        </span>
						</a>
						<ul class="submenu">
							<li class="">
								<a href="${pageContext.request.contextPath}/cms/gifts_edu.jsp">
									کتب درسی تحصیلی مدارس و دانشگاه
								</a>
							</li>
							<li class="">
								<a href="${pageContext.request.contextPath}/cms/gifts_releges.jsp">
									ادعیه و کتب مذهبی
								</a>
							</li>
							<li class="">
								<a href="${pageContext.request.contextPath}/cms/gifts_general.jsp">
									دیگر کتب اهدایی موجود
								</a>
							</li>
						</ul>
					</li>
                    <li id="gift" class="hover highlight">
                        <a href="${pageContext.request.contextPath}/op/register_gift.jsp">
                            <i class="menu-icon fa fa-paper-plane-o"></i>
                            <span class="menu-text"> 
                            اهدای کتاب شخصی
                            </span>
                        </a>
                        <b class="arrow"></b>
                    </li>
                    <li id="sell" class="hover highlight">
                        <a href="${pageContext.request.contextPath}/op/register_sell.jsp">
                            <i class="menu-icon fa fa-send"></i>
                            <span class="menu-text"> 
                            فروش کتاب شخصی
                            </span>
                        </a>
                        <b class="arrow"></b>
                    </li>
                    <script type="text/javascript" language="JavaScript">
        function setClass(id, className) {
            var obj = document.getElementById(id);
            if (obj != null) {
                obj.className = className;
            }
        }
        setClass( "${page}", "active hover highlight");
    </script>
                </ul><!-- /.nav-list -->
            </div>
 
    