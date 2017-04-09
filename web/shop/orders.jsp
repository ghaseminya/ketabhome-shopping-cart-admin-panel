<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/shop/commons/header.jsp"%>
    <h1>مشخصات سفارشات من</h1>
    <c:if test="${empty orders}">
    	سفارشی ثبت نشده است.
    </c:if>
    <c:if test="${!empty orders}">
    	<table border="1" width="638">
    		<tr>
    			<th>شماره سفارش</th>
    			<th>مبلغ</th>
    			<th>مقدار</th>
    			<th>-</th>
    			<th>حذف</th>
    		</tr>
    		<c:forEach items="${orders}" var="o" varStatus="vs">
    			<tr class="${vs.index%2==0?'even':'odd'}">
	    			<td>${o.ordernum}</td>
	    			<td>${o.price}</td>
	    			<td>${o.number}</td>
	    			<td>
	    				<c:choose>
	    					<c:when test="${o.status==0}">
	    						عدم پرداخت
	    					</c:when>
	    					<c:when test="${o.status==1}">
	    						پرداخت شده
	    					</c:when>
	    					<c:otherwise>
	    						انجام نشده
	    					</c:otherwise>
	    				</c:choose>
	    			</td>
	    			<td>
	    				<c:choose>
	    					<c:when test="${o.status==0}">
	    						<a href="${pageContext.request.contextPath}/pay.jsp?ordernum=${o.ordernum}&price=${o.price}">付款</a>
	    					</c:when>
	    					<c:when test="${o.status==1}">
	    						تکمیل شده
	    					</c:when>
	    					<c:otherwise>
	    						در حال تکمیل
	    					</c:otherwise>
	    				</c:choose>
	    			</td>
	    		</tr>
    		</c:forEach>
    	</table>
    </c:if>
  <%@ include file="/shop/commons/footer.jsp"%>

