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

                <li>
                    <a href="#">Category</a>
                </li>
                <li class="active">New Category</li>
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
            <div class="page-header">
                <h1>
                    Add New Category
                    <small>
                        <i class="ace-icon fa fa-angle-double-right"></i>
                        Submit new category
                    </small>
                </h1>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <!-- PAGE CONTENT BEGINS -->
                    <form class="form-horizontal" action="${pageContext.request.contextPath}/servlet/ManageServlet?op=addCategory" method="post">
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> Category Name </label>

                            <div class="col-sm-9">
                                <input type="text" id="name" placeholder="name" class="col-xs-10 col-sm-5" name="name"/>
                                <span class="help-inline col-xs-12 col-sm-7">
                                    <span id="sname"></span>
                                </span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="form-field-1-1"> Description </label>

                            <div class="col-sm-9">
                                <input type="text" name="des" class="form-control" />
                            </div>
                        </div>



                        <div class="clearfix form-actions">
                            <div class="col-md-offset-3 col-md-9">
                                <button class="btn btn-info" type="submit">
                                    <i class="ace-icon fa fa-check bigger-110"></i>
                                    Submit
                                </button>

                                &nbsp; &nbsp; &nbsp;
                                <button class="btn" type="reset">
                                    <i class="ace-icon fa fa-undo bigger-110"></i>
                                    Reset
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


<script type="text/javascript">
    window.onload = function () {
        document.getElementById("name").onblur = function () {
            var xhr = getXhr();
            xhr.onreadystatechange = function () {
                if (xhr.readyState == 4) {
                    if (xhr.status == 200) {
                        document.getElementById("sname").innerHTML = xhr.responseText;
                    }
                }
            }
            var nameValue = encodeURI(this.value);
            xhr.open("GET", "${pageContext.request.contextPath}/servlet/ManageServlet?op=checkCategory&name=" + nameValue + "&time=" + new Date().getTime());
            xhr.send(null);
        }
    }
</script>
<%@ include file="/manage/commons/footer.jsp"%>