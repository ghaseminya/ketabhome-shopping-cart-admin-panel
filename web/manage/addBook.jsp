<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/manage/commons/header.jsp"%>
    <h3>Add New BOOK</h3>
    <form enctype="multipart/form-data" action="${pageContext.request.contextPath}/servlet/ManageServlet?op=addBook" method="post">
    	<table border="1" width="438">
    		<tr>
    			<td>book name：</td>
    			<td>
    				<input name="name" id="name" />
    			</td>
    		</tr>
    		<tr>
    			<td>Book Auther：</td>
    			<td>
    				<input name="author" id="author" />
    			</td>
    		</tr>
    		<tr>
    			<td>price：</td>
    			<td>
    				<input name="price" id="price" />元
    			</td>
    		</tr>
    		<tr>
    			<td>image：</td>
    			<td>
    				<input type="file" name="image" />
    			</td>
    		</tr>
    		<tr>
    			<td>desc：</td>
    			<td>
    				<textarea rows="3" cols="38" name="des"></textarea>
    			</td>
    		</tr>
    		<tr>
    			<td>categ：</td>
    			<td>
    				<select name="categoryId">
    					<c:forEach items="${cs}" var="c">
    						<option value="${c.id}">${c.name}</option>
    					</c:forEach>
    				</select>
    			</td>
    		</tr>
    	</table>
    	<input type="submit" value="Submit"/>
    </form>
<%@ include file="/manage/commons/footer.jsp"%>