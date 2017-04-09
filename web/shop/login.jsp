<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/shop/commons/header.jsp"%>
    <h3>ثبت نام کاربر جدید</h3>
    <form action="${pageContext.request.contextPath}/servlet/ClientServlet?op=login" method="post">
    	<table border="1" width="600">
    		<tr>
    			<td>نام کاربری：</td>
    			<td>
    				<input name="username"/>
    			</td>
    		</tr>
    		<tr>
    			<td>گذرواژه：</td>
    			<td>
    				<input type="password" name="password"/>
    			</td>
    		</tr>
    		<tr>
    			<td colspan="2">
    				<input type="submit" value="ورود"/>
    			</td>
    		</tr>
    	</table>
    </form>
<%@ include file="/shop/commons/footer.jsp"%>
