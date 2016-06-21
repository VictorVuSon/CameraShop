<%@page import="bean.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<title>Shop Admin</title>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/templates/admin/css/styles.css" media="screen" />
        <script type="text/javascript" src="<%=request.getContextPath()%>/library/ckeditor/ckeditor.js"></script>
	</head>
	<body>
    	<!-- Header -->
        <div id="header">
            <!-- Header. Status part -->
            <div id="header-status">
                <div class="container_12">
                    <div class="grid_4">
                    <%
                    User account = (User) session.getAttribute("userLogin");
                    if(account != null ){
                    %>
                    	<ul class="user-pro">
							<li><a href="<%=request.getContextPath()%>/admin/logout">Logout</a></li>
							<li>Chào, <a href="<%=request.getContextPath()%>/admin/edit-user<%if(account !=null ){out.print("?iduser="+account.getUserID());}%>"><%=account.getFullName() %></a></li>
                    	</ul>
                    <%} else { %>
                    	<ul class="user-pro">
							<li><a href="<%=request.getContextPath()%>/admin/login">Đăng nhập</a></li>
                    	</ul>
                    <%} %>
                    </div>
                </div>
                <div style="clear:both;"></div>
            </div> <!-- End #header-status -->
            
            <!-- Header. Main part -->
            <div id="header-main">
                <div class="container_12">
                    <div class="grid_12">
                        <div id="logo">
                            <ul id="nav">
                                <li id="current"><a href="/Camera/admin">Quản trị</a></li>
                                <li><a href="<%=request.getContextPath()%>/admin/edit-user<%if(account !=null ){out.print("?iduser="+account.getUserID());}%>">Tài khoản</a></li>
                            </ul>
                        </div><!-- End. #Logo -->
                    </div><!-- End. .grid_12-->
                    <div style="clear: both;"></div>
                </div><!-- End. .container_12 -->
            </div> <!-- End #header-main -->
            <div style="clear: both;"></div>
            <!-- Sub navigation -->
            <div id="subnav">
                <div class="container_12">
                    <div class="grid_12">
                        <ul>
                            <li><a href="<%=request.getContextPath()%>/admin/list-news">Sản phẩm</a></li>
                            <li><a href="<%=request.getContextPath()%>/admin/list-cat">Danh mục</a></li>
                            <li><a href="<%=request.getContextPath()%>/admin/list-is-product">Loại sản phẩm</a></li>
                            <li><a href="<%=request.getContextPath()%>/admin/list-user">Người dùng</a></li>
                        </ul>
                        
                    </div><!-- End. .grid_12-->
                </div><!-- End. .container_12 -->
                <div style="clear: both;"></div>
            </div> <!-- End #subnav -->
        </div> <!-- End #header -->
		<div class="container_12">