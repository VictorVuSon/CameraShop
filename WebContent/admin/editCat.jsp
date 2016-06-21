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
	$("#editcat").validate({
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
		 <h2><span>Sửa Danh mục tin</span></h2>
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
		 	Category cat = (Category) request.getAttribute("cat");
		 	%>
			<form action="<%=request.getContextPath()%>/admin/edit-cat"/ name="editcat" id="editcat">
				<p>
					<label>Tên danh mục tin cần sửa</label>
					<input type = "hidden" name = "idcat" value ="<%=cat.getIdCat()%>" />
					<input type="text" name="namecat" value="<%=cat.getNameCat() %>" class="input-medium" />
				</p>
				
				<fieldset>
					<input class="submit-green" name="editcat" type="submit" value="Edit" /> 
				</fieldset>
			</form>
		 </div> <!-- End .module-body -->

	</div>  <!-- End .module -->
	<div style="clear:both;"></div>
</div> <!-- End .grid_12 -->
<%@include file="/templates/admin/inc/footer.jsp" %> 