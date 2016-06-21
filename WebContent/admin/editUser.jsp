<%@page import="bean.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/header.jsp" %>
<!-- Form elements -->    
<div class="grid_12">

	<div class="module">
		 <h2><span>Sửa User</span></h2>
		<div style ="color:red">
		<%
		String msg = request.getParameter("msg");
		if(msg != null){
			out.print(msg);
		}
		%>
		</div>
		 <div class="module-body">
		 	<%
		 	User user = (User) request.getAttribute("user");
		 	%>
			<form action="<%=request.getContextPath()%>/admin/edit-user"/>
				<p>
					<input type = "hidden" name = "iduser" value ="<%=user.getUserID()%>" />
				</p>
				<p>
					<label>Mật khẩu cũ</label>
					<input type="text" name="oldpassword" value="" class="input-medium" />
				</p>
				<p>
					<label>Mật khẩu mới</label>
					<input type="text" name="newpassword" value="" class="input-medium" />
				</p>
				<p>
					<label>Xác nhận mật khẩu mới</label>
					<input type="text" name="renewpassword" value="" class="input-medium" />
				</p>
				<p>
					<label>Họ và tên</label>
					<input type="text" name="fullname" value="<%=user.getFullName() %>" class="input-medium" />
				</p>
				<p>
					<label>Email</label>
					<input type="text" name="email" value="<%=user.getEmail()%>" class="input-medium" />
				</p>
				<p>
					<label>Địa chỉ</label>
					<input type="text" name="address" value="<%=user.getAddress()%>" class="input-medium" />
				</p>
				<p>
					<label>Điện thoại</label>
					<input type="text" name="phone" value="<%=user.getPhone_number()%>" class="input-medium" />
				</p>
				<fieldset>
					<input class="submit-green" name="edituser" type="submit" value="Edit" /> 
				</fieldset>
			</form>
		 </div> <!-- End .module-body -->

	</div>  <!-- End .module -->
	<div style="clear:both;"></div>
</div> <!-- End .grid_12 -->
<%@include file="/templates/admin/inc/footer.jsp" %> 