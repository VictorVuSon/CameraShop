<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/header.jsp" %>
<!-- Form elements -->    
<div class="grid_12">


<script type="text/javascript" src="<%=request.getContextPath()%>/library/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/library/jquery.validate.js"></script>						
<script type="text/javascript">
$(document).ready(function(){
	$("#addnews").validate({
		rules: {
			tentin: {
				required: true,
				minlength: 6,
				maxlength: 32,
			},
			mota: {
				required: true,
				
			},
			chitiet: {
				required: true,
				
			},
		},
		messages: {
			tentin: {
				required: "<h6 class = 'error'>Bạn chưa nhập Tên tin</h6>",
				minlength: "<h6 class = 'error'>Bạn nhập ít nhất 6 ký tự</h6>",
				maxlength: "<h6 class = 'error'>Bạn nhập nhiều nhất 32 ký tự</h6>",
			},
			mota: {
				required: "Bạn chưa nhập Mô tả</h6>",
			},
			chitiet: {
				required: "<h6 class = 'error'>Bạn chưa nhập Chi tiết</h6>",
			},
		}
	});
});
</script>



	<div class="module">
		 <h2><span>Sửa</span></h2>
		<div style ="color:red">
			<%
				String msg = request.getParameter("msg");
				if(msg != null){
					out.print(msg);
				}
			%>
		</div>
		<%
			User userLogin = (User) request.getAttribute("userLogin");
		%>
		 <div class="module-body">
			<form name="addnews" id="addnews" action="<%=request.getContextPath()%>/admin/edit-user/ method="post" enctype="multipart/form-data">
				<p>
					<label>Username</label>
					<input type="text" name="tentin" disabled value="<%=userLogin.getUserName()%>" class="input-medium" />
				</p>
				<p>
					<label>Họ và tên</label>
					<input type="text" name="fullname" disabled value="<%=userLogin.getFullName()%>" class="input-medium" />
				</p>
				<p>
					<label>Email</label>
					<input type="text" name="email" value="<%=userLogin.getEmail()%>" class="input-medium" />
				</p>
				<p>
					<label>Địa chỉ</label>
					<input type="text" name="address" value="<%=userLogin.getAddress()%>" class="input-medium" />
				</p>
				<p>
					<label>Điện thoại</label>
					<input type="text" name="phone" value="<%=userLogin.getPhone_number()%>" class="input-medium" />
				</p>
				<p>
					<label>Mật khẩu</label>
					<input name="password" rows="7" cols="90" class="input-medium" />
				</p>
				<p>
					<label class="ckedictor">Xác nhận mật khẩu</label>
					<input name="re-password" rows="7" cols="90" class="input-medium" />
				</p>
				<fieldset>
					<input class="submit-green" name="Edit" type="submit" value="Cập nhật" /> 
				</fieldset>
			</form>
		 </div> <!-- End .module-body -->

	</div>  <!-- End .module -->
	<div style="clear:both;"></div>
</div> <!-- End .grid_12 -->
<%@include file="/templates/admin/inc/footer.jsp" %> 