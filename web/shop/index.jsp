<%@page import="mnm.util.persian"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>


<%
    request.setAttribute("page", "category");
    persian p=new persian();
    request.setAttribute("p", p);
        String ccateg_name=(String)request.getParameter("ccn");
//        ccateg_name=new String(ccateg_name.getBytes("ISO8859_1"), "UTF-8");
        String cid=request.getParameter("cci");
        request.setAttribute("cid", cid);
        request.setAttribute("ccateg_name", ccateg_name);
    %>
    <%
                                String ebegin=(String)request.getParameter("ebegin");
                                String esize=(String)request.getParameter("esize");
                                
                                try{
                                if(esize.length()==0)esize="20";
                                }catch(Exception s){
                                    esize="20";
                                
                                }
                                try{
                                if(ebegin.length()==0)ebegin="0";
                                }catch(Exception s){
                                
                                ebegin="0";
                                }
                                
                                String nB="ebegin="+(Integer.parseInt(ebegin)+Integer.parseInt(esize))+"&esize="+esize;
                                String pB="ebegin="+(Integer.parseInt(ebegin)-Integer.parseInt(esize))+"&esize="+esize;
                                
                                request.setAttribute("nB", nB);
                                request.setAttribute("pB", pB);
                                request.setAttribute("ebegin", ebegin);
                                request.setAttribute("esize", esize);
                                %>
                                <%
    String city=(String)request.getParameter("city");
    String cityid=(String)request.getParameter("i");
    request.setAttribute("whereclouse", "");
    if(null!=cityid&&cityid.length()>0){
        request.setAttribute("cityid", cityid);
        request.setAttribute("city", city);
        request.setAttribute("whereclouse1", "where not isgift and  cityid="+cityid+" order by ddat DESC");
        request.setAttribute("whereclouse2", "where  isgift and cityid="+cityid+" order by ddat DESC");
    }
    String query=(String)request.getParameter("query");
    if(null!=query&&query.length()>0){
        request.setAttribute("query", query);
        request.setAttribute("whereclouse1", "where not isgift and title like \"%"+query+"%\""
                + " or text like \"%"+query+"%\" "
                        + "or tags like \"%"+query+"%\" order by ddat DESC limit "+ebegin+","+esize);
        request.setAttribute("whereclouse2", "where isgift and title like \"%"+query+"%\""
                + " or text like \"%"+query+"%\" "
                        + "or tags like \"%"+query+"%\" order by ddat DESC limit "+ebegin+","+esize);
        
    }
%>
<c:url var="nextUrlPage" value="">
<c:forEach items="${param}" var="entry">
    <c:if test="${entry.key != 'esize' and entry.key != 'ebegin'}">
        <c:param name="${entry.key}" value="${entry.value}" />
    </c:if>
</c:forEach>
</c:url>
<t:generic>
    <jsp:attribute name="mainmeta">
        <title>فروشگاه کتاب من | کتاب های ثبت شده</title>
        <meta name="keywords" content="فروش کتاب شخصی، کتاب فروشی، اهدا کتاب، نقل و انتقال کتاب" />
        <meta name="description" content="sellmybook اولین سامانه تخصصی نقل و انتقال کتابهای شخصی" />
    </jsp:attribute>
    <jsp:attribute name="mainjs">
                
    </jsp:attribute>
    <jsp:body>
        <div class="main-content">
				<div class="main-content-inner">
					<div class="page-content">
					

						<div class="page-header">
							<h1>
								فروشگاه کتاب من
								<small>
									<i class="ace-icon fa fa-angle-double-left"></i>
									خانه
								</small>
							</h1>
						</div><!-- /.page-header -->
<div class="row">
							<div class="col-xs-12">

								<div>
									<div class="row search-page" id="search-page-1">
										<div class="col-xs-12">
											<div class="row">
												<div class="col-xs-12 col-sm-3">
													<div class="search-area well well-sm">
														<div class="search-filter-header bg-primary">
															<h5 class="smaller no-margin-bottom">
																<i class="ace-icon fa fa-sliders light-green bigger-130"></i>&nbsp; لیست کتابهای موجود
															</h5>
														</div>

														<div class="space-10"></div>

                                                                                                                <form action="${pageContext.request.contextPath}/cms/all.jsp">
															<div class="row">
																<div class="col-xs-12 col-sm-11 col-md-10">
																	<div class="input-group">
																		<input type="text" class="form-control" name="query" placeholder="جستجو" />
																		<div class="input-group-btn">
																			<button type="button" class="btn btn-default no-border btn-sm">
																				<i class="ace-icon fa fa-search icon-on-right bigger-110"></i>
																			</button>
																		</div>
																	</div>
																</div>
															</div>
														</form>

														<div class="hr hr-dotted"></div>

														<h4 class="blue smaller">
															<i class="fa fa-tags"></i>
															دسته‌ها
														</h4>

                                                                                                                <div  style="min-width: 280px;min-height: 500px">
															<div class="panel-group category-products" id="accordian"><!--category-productsr-->
                                <sql:query var="result" dataSource="con8">SELECT name,idcategory FROM category where category_idcategory=0</sql:query>

                                <c:forEach var="row" items="${result.rows}">
                                    <c:set var="mainid" value="${row.idcategory}"/>        
                                    <c:set var="mainname" value="${row.name}"/>        
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#accordian" href="#id${mainid}">
                                                    <span class="badge pull-right"><i class="fa fa-plus"></i></span>

                                                </a>
                                                <a href="${pageContext.request.contextPath}/cms/category.jsp?ccn=${row.name}&cci=${row.idcategory}">${row.name}</a>
                                            </h4>
                                        </div>
                                        <div id="id${mainid}" class="panel-collapse collapse">
                                            <div class="panel-body">
                                                <sql:query var="result2" dataSource="con8">SELECT name,idcategory FROM category where category_idcategory=<c:out value="${mainid}"/></sql:query>

                                                    <ul>
                                                    <c:forEach var="row2" items="${result2.rows}">
                                                        <li><a href="${pageContext.request.contextPath}/cms/subcategory.jsp?cn=${row2.name}&ci=${row2.idcategory}&cci=${mainid}&ccn=${mainname}">${row2.name}</a></li>
                                                        </c:forEach>

                                                </ul>
                                            </div>
                                        </div>
                                    </div>

                                </c:forEach>

                            </div>
														</div>

														<div class="hr hr-dotted"></div>

														<h4 class="blue smaller">
															<i class="fa fa-map-marker light-orange bigger-110"></i>
															شهرها:
														</h4>

														<div>
															<sql:query var="result" dataSource="con8">SELECT name,id FROM city</sql:query>

                                <c:forEach var="row" items="${result.rows}">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a href="${pageContext.request.contextPath}/cms/all.jsp?city=${row.name}&i=${row.id}">${row.name}</a>
                                            </h4>
                                        </div>
                                    </div>

                                </c:forEach>
														</div>

														
														<div class="hr hr-dotted hr-24"></div>

														<div class="text-center">
															<button type="button" class="btn btn-default btn-round btn-sm btn-white">
																<i class="ace-icon fa fa-remove red2"></i>
																ریست
															</button>

															<button type="button" class="btn btn-default btn-round btn-white">
																<i class="ace-icon fa fa-refresh green"></i>
																جستجو
															</button>
														</div>

														<div class="space-4"></div>
													</div>
												</div>

												<div class="col-xs-12 col-sm-9">
													

													<div class="row">
														<sql:query var="result" dataSource="con8">
                                                                                                                    SELECT 
                                                                                                                    mt.id, b_name, b_desc, image, iduser, maincat, subcat, fname, b_author, ddat, b_sub, b_dewey, uuidkey, b_price, dtpersian, c.name as name, isgift, b_status, b_priceyou, b_page 
                                                                                                                    from myTable as mt 
                                                                                                                    inner join city as c on c.id=mt.cityid 
                                                                                                                    ${whereclouse1}
                                                                                                                </sql:query>
                                                                                                        <c:forEach varStatus="counter" var="row" items="${result.rows}">

														<div class="col-xs-6 col-sm-4 col-md-3">
															<div class="thumbnail search-thumbnail">
                                                                                                                            <c:choose>
                                                                                                                                    <c:when test="${row.image}">
                                                                                                                                           <img style="height: 155px;"  src="${pageContext.request.contextPath}/data/${row.id}/${row.fname}_logo"  />
                                                                                                                                    </c:when>
                                                                                                                                    <c:otherwise>
                                                                                                                                        <img style="height: 155px;" src="${pageContext.request.contextPath}/assets/images/smb/noimg.jpg"  />
                                                                                                                                    </c:otherwise>
                                                                                                                                        </c:choose>
                                                                                                                            <img class="media-object" src=""/>
																<div class="caption">
																	<div class="clearfix">
																		<span class="pull-right label label-grey info-label">${row.name}</span>
																	</div>

																	<h3 class="search-title">
																		<a href="${pageContext.request.contextPath}/cms/one.jsp?ct=${p.utitle(row.b_name)}&id=${row.id}" class="blue">${row.b_name}</a>
																	</h3>
																	<p>${row.b_author}-${row.b_sub}-${row.b_desc}</p>
																</div>
															</div>
														</div>
                                                                                                            </c:forEach>
														
													</div>

													<div class="space-12"></div>

													<div class="row">
														<div class="col-xs-12">
                                                                                                                    <sql:query var="result" dataSource="con8">
                                                                                                                    SELECT 
                                                                                                                    mt.id, b_name, b_desc, image, iduser, maincat, subcat, fname, b_author, ddat, b_sub, b_dewey, uuidkey, b_price, dtpersian, c.name as name, isgift, b_status, b_priceyou, b_page 
                                                                                                                    from myTable as mt 
                                                                                                                    inner join city as c on c.id=mt.cityid 
                                                                                                                    ${whereclouse2}
                                                                                                                </sql:query>
                                                                                                                <c:forEach varStatus="counter" var="row" items="${result.rows}">
															<div class="media search-media">
																<div class="media-left">
																	<a href="#">
																		<c:choose>
                                                                                                                                    <c:when test="${row.image}">
                                                                                                                                           <img style="height: 155px;"  src="${pageContext.request.contextPath}/data/${row.id}/${row.fname}_logo"  />
                                                                                                                                    </c:when>
                                                                                                                                    <c:otherwise>
                                                                                                                                        <img style="height: 155px;" src="${pageContext.request.contextPath}/assets/images/smb/noimg.jpg"  />
                                                                                                                                    </c:otherwise>
                                                                                                                                        </c:choose>
																	</a>
																</div>

																<div class="media-body">
																	<div>
																		<h4 class="media-heading">
																			<a href="${pageContext.request.contextPath}/cms/one.jsp?ct=${p.utitle(row.b_name)}&id=${row.id}" class="blue">${row.b_name}</a>
																		</h4>
																	</div>
																	<p>${row.b_author}-${row.b_sub}-${row.b_desc}</p>

																	<div class="search-actions text-center">

																		<span class="blue bolder bigger-150">${row.priceyou}</span>

																		<a class="search-btn-action btn btn-sm btn-block btn-info">خرید</a>
																	</div>
																</div>
															</div>
                                                                                                                        </c:forEach>
															
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>

								

								<!-- PAGE CONTENT ENDS -->
							</div><!-- /.col -->
						</div><!-- /.row -->
						
					</div><!-- /.page-content -->
				</div>
			</div><!-- /.main-content -->
        
    </jsp:body>
</t:generic>
