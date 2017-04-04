<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div>
    	اولین ${page.pageNum}صفحه /از${page.totalPageSize}صفحه&nbsp;&nbsp;
    	<a href="${pageContext.request.contextPath}${page.url}&num=1">خانه</a>&nbsp;&nbsp;
    	<a href="${pageContext.request.contextPath}${page.url}&num=${page.prePageNum}">قبلی</a>&nbsp;&nbsp;
    	                    <!--   page.setUrl("/servlet/ManageServlet?op=listBooks"); -->
    	<a href="${pageContext.request.contextPath}${page.url}&num=${page.nextPageNum}">بعدی</a>&nbsp;&nbsp;
    	<a href="${pageContext.request.contextPath}${page.url}&num=${page.totalPageSize}">صفحه آخر</a>&nbsp;&nbsp;
    	<select id="jump" onchange="jump(this)">
    		<c:forEach begin="1" end="${page.totalPageSize}" var="n">
    		   
    			<option value="${n}" ${page.pageNum==n?'selected="selected"':''}>${n}</option>
    		</c:forEach>
    	</select>
    	&nbsp;&nbsp;
    	<input type="text" size="3" id="num"/><input type="button" value="پرش" onclick="jump1()"/>
    	<script type="text/javascript">
    		function jump(selectObj){
    			window.location.href="${pageContext.request.contextPath}${page.url}&num="+selectObj.value;
    		}
    		function jump1(){
				var num = document.getElementById("num").value;
				if(!/^[1-9][0-9]*$/.test(num)){
					alert("لطفا شماره صفحه را وارد کنید?");
					return;
				}
				if(num>${page.totalPageSize}){
					alert("صفحه خارج از محدوده");
					return;
				}
				window.location.href="${pageContext.request.contextPath}${page.url}&num="+num;
			}
    	</script>
    </div>