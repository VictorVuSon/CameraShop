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
				required: "Bạn chưa nhập Tên",
			},
		}
	});
});
</script>



	<div class="module">
		 <h2><span>Thêm User</span></h2>
		<div style ="color:red">
		<%
		String msg = request.getParameter("msg");
		if(msg != null){
			out.print(msg);
		}
		%>
		</div>
		 <div class="module-body">
			<form name="adduser" id="adduser" action="<%=request.getContextPath()%>/admin/add-user" method="GET"/>
				<p>
					<label>Tên đăng nhập</label>
					<input type="text" name="username" value="" class="input-medium" />
				</p>
				<p>
					<label>Mật khẩu</label>
					<input type="password" name="password" value="" class="input-medium" />
				</p>
				<p>
					<label>Nhập lại mật khẩu</label>
					<input type="password" name="repassword" value="" class="input-medium" />
				</p>
				<p>
					<label>Họ và tên</label>
					<input type="text" name="fullname" value="" class="input-medium" />
				</p>
				<p>
					<label>Email</label>
					<input type="text" name="email" value="" class="input-medium" />
				</p>
				<p>
					<label>Địa chỉ</label>
					<input type="text" name="address" value="" class="input-medium" />
				</p>
				<p>
					<label>Điện thoại</label>
					<input type="text" name="phone" value="" class="input-medium" />
				</p>
				<fieldset>
					<input class="submit-green" name="add" type="submit" value="Thêm" /> 
					<input class="submit-gray" name="reset" type="reset" value="Nhập lại" />
				</fieldset>
			</form>
		 </div> <!-- End .module-body -->

	</div>  <!-- End .module -->
	<div style="clear:both;"></div>
</div> <!-- End .grid_12 -->
<%@include file="/templates/admin/inc/footer.jsp" %> 