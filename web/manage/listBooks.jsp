<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/manage/commons/header.jsp"%>
<div class="main-content">
    <div class="main-content-inner">
        <div class="breadcrumbs ace-save-state" id="breadcrumbs">
            <ul class="breadcrumb">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href="${pageContext.request.contextPath}/manage/">Home</a>
                </li>

                <li>
                    <a href="#">Book</a>
                </li>
                <li class="active">List of Book</li>
            </ul><!-- /.breadcrumb -->

            <div class="nav-search" id="nav-search">
                <form class="form-search">
                    <span class="input-icon">
                        <input type="text" placeholder="Search ..." class="nav-search-input" id="nav-search-input" autocomplete="off" />
                        <i class="ace-icon fa fa-search nav-search-icon"></i>
                    </span>
                </form>
            </div><!-- /.nav-search -->
        </div>

        <div class="page-content">
            <div class="page-header">
                <h1>
                    List of Book
                    <small>
                        <i class="ace-icon fa fa-angle-double-right"></i>
                        all Book
                    </small>
                </h1>
            </div>
            <div class="row">
                <div class="col-xs-12">
    <c:if test="${empty page.records}">
    	<h2><fmt:message key="dashboard.nobook" />，<a href="${pageContext.request.contextPath}/servlet/ManageServlet?op=addBookUI">Add new BOOK</a></h2>
    </c:if>
    <c:if test="${!empty page.records}">
    	<table class="table  table-bordered table-hover">
    		<tr>
    			<Th> picture </ th>
     <Th> title </ th>
     <Th> author </ th>
     <Th> price </ th>
     <Th> Description </ th>
     <Th> belongs to </ th>
     <Th> operation </ th>
    		</tr>
    		<c:forEach items="${page.records}" var="b" varStatus="vs">
    			<tr class="${vs.index%2==0?'even':'odd'}">
	    			<td>
                                    <img style="width: 64px;height: 64px" src="${pageContext.request.contextPath}/res/shop_assets/images/book/${b.filename}"/>
	    			</td>
	    			<td>${b.name}</td>
	    			<td>${b.author}</td>
	    			<td>${b.price}</td>
	    			<td>${b.des}</td>
	    			<td>${b.category.name}</td>
	    			<td>
	    				[<a href="javascript:alert('modify')">modify</a>]
	    				[<a href="javascript:alert('delete')">delete</a>]
	    			</td>
	    		</tr>
    		</c:forEach>
    	</table>
    	<%@ include file="/manage/commons/page.jsp"%>
    </c:if></div>
            </div>
        </div>
    </div>
</div>
<%@ include file="/manage/commons/footer.jsp"%>
