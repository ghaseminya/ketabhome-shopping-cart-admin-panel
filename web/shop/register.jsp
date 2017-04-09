<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/shop/commons/header.jsp"%>
    <h3>ثبت نام کاربر جدید</h3>
    <form action="${pageContext.request.contextPath}/servlet/ClientServlet?op=customerRegist" method="post">
    	<table border="1" width="438">
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
    			<td>تلفن：</td>
    			<td>
    				<input name="phone"/>
    			</td>
    		</tr>
    		<tr>
    			<td>آدرس：</td>
    			<td><input name="address"/></td>
    		</tr>
    		<tr>
    			<td>ایمیل：</td>
    			<td>
    				<input name="email"/>
    			</td>
    		</tr>
    		<tr>
    			<td colspan="2">
    				<input type="submit" value="ثبت نام"/>
    			</td>
    		</tr>
    	</table>
    </form>
<%@ include file="/shop/commons/footer.jsp"%>
