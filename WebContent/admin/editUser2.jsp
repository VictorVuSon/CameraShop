<%@page import="bean.User"%>
<%@page import="bean.Category"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/header.jsp" %>
<!-- Form elements -->    
<div class="grid_12">


<script type="text/javascript" src="<%=request.getContextPath()%>/library/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/library/jquery.validate.js"></script>						
<script type="text/javascript">
$(document).ready(function(){
	$("#adduser").validate({
		rules: {
			username: {
				required: true,
				minlength: 6,
				maxlength: 32,
			},
			password: {
				required: true,
				minlength: 6,
				maxlength: 32,
			},
			fullname: {
				required: true,
			},
		},
		messages: {
			username: {
				required: "Bạn chưa nhập Tên đăng nhập",
				minlength: "Bạn nhập ít nhất 6 ký tự",
				maxlength: "Bạn nhập nhiều nhất 32 ký tự",
			},
			password: {
				required: "Bạn chưa nhập Password",
				minlength: "Bạn nhập ít nhất 6 ký tự",
				maxlength: "Bạn nhập nhiều nhất 32 ký tự",
			},
			fullname: {
				required: "Bạn chưa nhập Password",
			},
		}
	});
});
</script>



<%
User user = (User) request.getAttribute("user");
%>
	<div class="module">
		 <h2><span>Sửa</span></h2>
		 <%
		 String msg = request.getParameter("msg");
		 if(msg != null){
			out.print(msg);
		 }
		%>
		 <div class="module-body">
			<form action="<%=request.getContextPath()%>/admin/edit-user" method="post">
			
				<p>
					<input type = "hidden" name = "iduser" value ="<%=user.getUserID()%>" />
				</p>
				<p>
					<label>Mật khẩu cũ</label>
					<input type="password" name="oldpassword" value="" class="input-medium" />
				</p>
				<p>
					<label>Mật khẩu mới</label>
					<input type="password" name="newpassword" value="" class="input-medium" />
				</p>
				<p>
					<label>Họ và tên</label>
					<input type="text" name="fullname" value="<%=user.getFullName()%>" class="input-medium" />
				</p>
				<fieldset>
					<input class="submit-green" type="submit" name="edituser" value="Edit" /> 
				</fieldset>
			</form>
		 </div> <!-- End .module-body -->

	</div>  <!-- End .module -->
	<div style="clear:both;"></div>
</div> <!-- End .grid_12 -->
<%@include file="/templates/admin/inc/footer.jsp" %> 