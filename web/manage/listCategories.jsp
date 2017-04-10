<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/manage/commons/header.jsp"%>

<center>
<h3>List Of category</h3>
    <c:if test="${empty cs}">
    	<h2><fmt:message key="dashboard.nocategory" />，<a href="${pageContext.request.contextPath}/manage/addCategory.jsp">New Category</a></h2>
    </c:if>
    <c:if test="${!empty cs}">
    	<table border="1" width="438">
    		<tr>
    			<Th> Select </th>
     <Th> serial number </th>
     <Th> classification name </th>
     <Th> Description </th>
     <Th> operation </th>
    		</tr>
    		<c:forEach items="${cs}" var="c" varStatus="vs">
    			<tr class="${vs.index%2==0?'even':'odd'}">
	    			<td>
	    				<input type="checkbox" name="ids" value="${c.id}"/>
	    			</td>
	    			<td>${vs.count}</td>
	    			<td>${c.name}</td>
	    			<td>${c.des}</td>
	    			<td>
	    				[<a href="javascript:update()">Modify</a>]
	    				[<a href="" onclick="del(this)">Delete</a>]
	    			</td>
	    		</tr>
    		</c:forEach>
    	</table>
    </c:if>
     </center>
     <script type="text/javascript" src="${pageContext.request.contextPath}/res/manage_assets/js/jquery-1.11.3.js"  ></script>
     <script type="text/javascript">

			function del(obj){
				var Vname=$(obj).parent().prev().prev().text();
    			$.post("${pageContext.request.contextPath}/servlet/ManageServlet",{op:'delCategory',name:Vname},function(data){
					
					
				});
			}



	</script>
<%@ include file="/manage/commons/footer.jsp"%>
