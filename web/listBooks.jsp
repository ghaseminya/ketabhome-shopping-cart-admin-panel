<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/header.jsp"%>
    <br/>
    دسته‌ها：
    <c:forEach items="${cs}" var="c">
    	<a href="${pageContext.request.contextPath}/servlet/ClientServlet?op=listBookByCategory&categoryId=${c.id}">${c.name}</a>&nbsp;&nbsp;
    </c:forEach>
    <hr/>
    <table>
    	<tr>
    		<c:forEach items="${page.records}" var="b">
    			<td>
    				<img src="${pageContext.request.contextPath}/../images/${b.path}/${b.filename}"/><br/>
    				نام کتاب：${b.name}<br/>
    				نویسنده کتاب：${b.author}<br/>
    				قیمت：${b.price}<br/>
    				<a href="${pageContext.request.contextPath}/servlet/ClientServlet?op=buyBook&bookId=${b.id}">خرید</a>
    			</td>
    		</c:forEach>
    	</tr>	
    </table>	
    <%@ include file="/commons/page.jsp"%>
    
    </center>
  </body>
</html>
