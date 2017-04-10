<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/shop/commons/header.jsp"%>
<!-- start slider -->
    
    <!--/slider -->
<div class="main">
	<div class="wrap">
		<div class="section group">
		  <div class="cont span_2_of_3">
		  	<h2 class="head">Featured Products</h2>
			<div class="top-box">
			 <c:forEach items="${page.records}" var="b">
    			
    		
    	                    <div class="col_1_of_3 span_1_of_3"> 
			   <a href="${pageContext.request.contextPath}/servlet/ClientServlet?op=buyBook&bookId=${b.id}">
				<div class="inner_content clearfix">
					<div class="product_image">
						<img src="${pageContext.request.contextPath}/res/shop_assets/images/book/${b.filename}" alt=""/>
					</div>
                    <div class="sale-box"><span class="on_sale title_shop">New</span></div>	
                    <div class="price">
					   <div class="cart-left">
							<p class="title">${b.name}</p>
							<p class="description">${b.author}</p>
							<div class="price1">
							  <span class="actual">${b.price}</span>
							</div>
						</div>
						<div class="cart-right"> </div>
						<div class="clear"></div>
					 </div>				
                   </div>
                 </a>
				</div>
			   </c:forEach>
    
        
				<div class="clear"></div>
                                <%@ include file="/shop/commons/page.jsp"%>
			</div>	
		  			 						 			    
		  </div>
			<div class="rsidebar span_1_of_left">
				<div class="top-border"> </div>
				 <div class="border">
	             
                                     <img src="${pageContext.request.contextPath}/res/shop_assets/images/t-img4.jpg" style="width: 230px;height: 450px"  alt="" />
              <div class="btn"><a href="single.html">Check it Out</a></div>
             </div>
           <div class="top-border"> </div>
			<div class="sidebar-bottom">
			    <h2 class="m_1">Newsletters<br> Signup</h2>
			    <p class="m_text">Lorem ipsum dolor sit amet, consectetuer</p>
			    <div class="subscribe">
					 <form>
					    <input name="userName" type="text" class="textbox">
					    <input type="submit" value="Subscribe">
					 </form>
	  			</div>
			</div>
	    </div>
	   <div class="clear"></div>
	</div>
	</div>
	</div>
<%@ include file="/shop/commons/footer.jsp"%>
