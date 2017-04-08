<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/commons/header.jsp"%>
        <div class="main-content">
				<div class="main-content-inner">
					<div class="page-content">
					

						<div class="page-header">
							<h1>
								Ketab Home
								<small>
									<i class="ace-icon fa fa-angle-double-left"></i>
									Home
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
                                

                            </div>
														</div>

														<div class="hr hr-dotted"></div>

														<h4 class="blue smaller">
															<i class="fa fa-map-marker light-orange bigger-110"></i>
															شهرها:
														</h4>

														<div>
															
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
														
														
													</div>

													<div class="space-12"></div>

													<div class="row">
														<div class="col-xs-12">
                                                                                                                    
															
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
<%@ include file="/commons/footer.jsp"%>
