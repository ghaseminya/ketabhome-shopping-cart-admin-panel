<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/shop/commons/header.jsp"%>
<div class="register_account">
           <div class="wrap">
    	     <h4 class="title">Shopping cart</h4>
    	     
   <c:if test="${empty sessionScope.cart.items}">
       <p class="cart"><fmt:message key="cart.noitem" />.<br>Click<a href="index.html"> here</a> to continue shopping</p>
    	   
       
    </c:if>
    <c:if test="${!empty sessionScope.cart.items}">
    	<p class="cart">
        <table border="1" width=800">
    		<tr>
    			<th>Book Name</th>
    			<th>Book Auther</th>
    			<th>Book Price</th>
    			<th>Number</th>
    			<th>OP</th>
    		</tr>
    		<c:forEach items="${sessionScope.cart.items}" var="me" varStatus="vs">
    			<tr class="${vs.index%2==0?'even':'odd'}">
	    			<td>${me.value.book.name}</td>
	    			<td>${me.value.book.author}</td>
	    			<td>${me.value.book.price}</td>
	    			<td><input type="text" size="3" id="number" name="number" value="${me.value.number}" onchange="changeNumber(this,'${me.value.number}','${me.key}')"/></td>
	    			<td>${me.value.price}</td>
	    			<td>
	    				<a href="javascript:delOneItem('${me.key}')">Del</a>
	    			</td>
	    		</tr>
    		</c:forEach>
    		<tr>
    			<td align="right" colspan="6">
    				Order Number：${sessionScope.cart.number}&nbsp;&nbsp;
    				Price：${sessionScope.cart.price}&nbsp;&nbsp;
    				<a href="${pageContext.request.contextPath}/servlet/ClientServlet?op=genOrder">Order</a>
    			</td>
    		</tr>
    	</table>
    </p>
    </c:if>
             </div>
    	</div>
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
    <!--/slider -->

<%@ include file="/shop/commons/footer.jsp"%>
