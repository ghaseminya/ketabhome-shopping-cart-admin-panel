<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div>
    <ul class="pagination">
        <li class="">
            <a href="${pageContext.request.contextPath}${page.url}&num=${page.prePageNum}">
                <i class="ace-icon fa fa-angle-double-left"></i>
            </a>
        </li>
        <c:forEach begin="1" end="${page.totalPageSize}" var="n">
        <li class="${(page.pageNum eq n )?'active':''}">
            <a href="${pageContext.request.contextPath}${page.url}&num=${n}">${n}</a>
        </li>
        </c:forEach>
        

        <li>
            <a href="${pageContext.request.contextPath}${page.url}&num=${page.nextPageNum}">
                <i class="ace-icon fa fa-angle-double-right"></i>
            </a>
        </li>
    </ul>
</div>