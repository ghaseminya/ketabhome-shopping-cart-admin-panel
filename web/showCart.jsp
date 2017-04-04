<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/header.jsp"%>
    <h1>سبد خرید</h1>
    <c:if test="${empty sessionScope.cart.items}">
    	هیچ کالایی انتخاب نشده است.
    </c:if>
    <c:if test="${!empty sessionScope.cart.items}">
    	<table border="1" width=800">
    		<tr>
    			<th>نام کتاب</th>
    			<th>نویسنده کتاب</th>
    			<th>قیمت کتاب</th>
    			<th>تعداد</th>
    			<th>عملیات</th>
    		</tr>
    		<c:forEach items="${sessionScope.cart.items}" var="me" varStatus="vs">
    			<tr class="${vs.index%2==0?'even':'odd'}">
	    			<td>${me.value.book.name}</td>
	    			<td>${me.value.book.author}</td>
	    			<td>${me.value.book.price}</td>
	    			<td><input type="text" size="3" id="number" name="number" value="${me.value.number}" onchange="changeNumber(this,'${me.value.number}','${me.key}')"/></td>
	    			<td>${me.value.price}</td>
	    			<td>
	    				<a href="javascript:delOneItem('${me.key}')">حذف</a>
	    			</td>
	    		</tr>
    		</c:forEach>
    		<tr>
    			<td align="right" colspan="6">
    				شماره سفارش：${sessionScope.cart.number}&nbsp;&nbsp;
    				قیمت：${sessionScope.cart.price}&nbsp;&nbsp;
    				<a href="${pageContext.request.contextPath}/servlet/ClientServlet?op=genOrder">تایید</a>
    			</td>
    		</tr>
    	</table>
    </c:if>
    <script type="text/javascript">
    	function delOneItem(bookId){
    		var sure = window.confirm("آیا مطمئن هستید که می خواهید حذف کنید？");
    		if(sure){
    			location.href="${pageContext.request.contextPath}/servlet/ClientServlet?op=delOneItem&bookId="+bookId;
    		}
    	}
    	function changeNumber(inputObj,oldNumber,bookId){
    		var value = inputObj.value;
    		if(!/^[1-9][0-9]*$/.test(value)){
				//inputObj.value=1;
				alert("لطفا شماره را صحیح وارد کنید");
				this.focus();
				return;
    		}
    		var sure = window.confirm("مطمئن هستید که می خواهید تعداد را تغیر دهید"+value+"؟");
    		if(sure){
    			location.href="${pageContext.request.contextPath}/servlet/ClientServlet?op=changeNum&bookId="+bookId+"&num="+value;
    		}else{
    			inputObj.value = oldNumber;
    		}
    	}
    </script>
  </body>
</html>
