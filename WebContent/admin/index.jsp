<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/header.jsp" %>
            
<!-- Dashboard icons -->
<div class="grid_main_l">
	<a href="<%=request.getContextPath()%>/admin/list-bills" class="dashboard-module">
		<img src="<%=request.getContextPath()%>/templates/admin/images/Crystal_Clear_write.gif" width="64" height="64" alt="edit" />
		<span>Danh sách đặt hàng</span>
	</a>
	
	<a href="<%=request.getContextPath()%>/admin/list-contact" class="dashboard-module">
		<img src="<%=request.getContextPath()%>/templates/admin/images/Crystal_Clear_files.gif" width="64" height="64" alt="edit" />
		<span>Danh sách liên hệ</span>
	</a>
	<div style="clear: both"></div>
</div> <!-- End .grid_7 -->

<!-- Account overview -->
<div class="grid_main_r">
	<div class="module">
			<h2><span>Quản trị hệ thống</span></h2>
			
			<div class="module-body">
				<p class="p">
					<strong>Quản trị website shop bán hàng camera</strong><br />
					<strong>Designer: </strong>Vũ Ngọc Sơn<br />
					<strong>Email: </strong>ngocson.bkdn@gmail.com<br /> 
					<strong>Phone: </strong>0909.123.456<br />
				</p>
			</div>
	</div>
	<div style="clear:both;"></div>
	<div class="padding-bottom"></div>
</div> <!-- End .grid_5 -->
<%@include file="/templates/admin/inc/footer.jsp" %>           