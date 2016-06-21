<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/header.jsp" %>
<!-- Form elements -->    
<div class="grid_12">


<script type="text/javascript" src="<%=request.getContextPath()%>/library/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/library/jquery.validate.js"></script>						
<script type="text/javascript">
$(document).ready(function(){
	$("#addcat").validate({
		rules: {
			namecat: {
				required: true,
				minlength: 6,
				maxlength: 32,
			},
		},
		messages: {
			namecat: {
				required: "Bạn chưa nhập Tên danh mục",
				minlength: "Bạn nhập ít nhất 6 ký tự",
				maxlength: "Bạn nhập nhiều nhất 32 ký tự",
			},
		}
	});
});
</script>


	<div class="module">
		 <h2><span>Thêm loại sản phẩm</span></h2>
		<div style ="color:red">
		<%
		String msg = request.getParameter("msg");
		if(msg != null){
			out.print(msg);
		}
		%>
		</div>
		 <div class="module-body">
			<form action="<%=request.getContextPath()%>/admin/add-is-product" method="post" name="addcat" id="addcat"/>
				<p>
					<label>Tên loại sản phẩm</label>
					<input type="text" name="namecat" value="" class="input-medium" />
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