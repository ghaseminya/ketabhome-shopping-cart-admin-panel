<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/manage/commons/header.jsp"%>
<div class="main-content">
				<div class="main-content-inner">
					<div class="breadcrumbs ace-save-state" id="breadcrumbs">
						<ul class="breadcrumb">
							<li>
								<i class="ace-icon fa fa-home home-icon"></i>
								<a href="${pageContext.request.contextPath}/manage/">Home</a>
							</li>

							<li class="active">Dashboard</li>
						</ul><!-- /.breadcrumb -->

						<div class="nav-search" id="nav-search">
							<form class="form-search">
								<span class="input-icon">
									<input type="text" placeholder="Search ..." class="nav-search-input" id="nav-search-input" autocomplete="off" />
									<i class="ace-icon fa fa-search nav-search-icon"></i>
								</span>
							</form>
						</div><!-- /.nav-search -->
					</div>

					<div class="page-content">
						<!-- /.ace-settings-container -->

						<div class="row">
							<div class="col-xs-12">
								<div class="row">
									<div class="col-xs-12">
										<a href="${pageContext.request.contextPath}/servlet/ManageServlet?op=listBooks" class="btn btn-default btn-app radius-4">
											<i class="ace-icon fa fa-table bigger-230"></i>
											Book List
										</a>
										<a href="${pageContext.request.contextPath}/servlet/ManageServlet?op=listCategories" class="btn btn-default btn-app radius-4">
											<i class="ace-icon fa fa-table bigger-230"></i>
											Category List
										</a>
										<a href="${pageContext.request.contextPath}/servlet/ManageServlet?op=addBookUI" class="btn btn-default btn-app radius-4">
											<i class="ace-icon fa fa-plus bigger-230"></i>
											New Book 
										</a>
										<a href="${pageContext.request.contextPath}/manage/addCategory.jsp" class="btn btn-default btn-app radius-4">
											<i class="ace-icon fa fa-plus bigger-230"></i>
											New Category
										</a>
                                                                        </div>
                                                                </div>
							</div><!-- /.col -->
						</div><!-- /.row -->
					</div><!-- /.page-content -->
				</div>
			</div><!-- /.main-content -->
                        <%@ include file="/manage/commons/footer.jsp"%>