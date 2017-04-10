<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/manage/commons/header.jsp"%>
<h3>Book List</h3>
    <c:if test="${empty page.records}">
    	<h2><fmt:message key="dashboard.nobook" />，<a href="${pageContext.request.contextPath}/servlet/ManageServlet?op=addBookUI">Add new BOOK</a></h2>
    </c:if>
    <c:if test="${!empty page.records}">
    	<table border="1" width="900">
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
    	<%@ include file="/shop/commons/page.jsp"%>
    </c:if>
<%@ include file="/manage/commons/footer.jsp"%>
