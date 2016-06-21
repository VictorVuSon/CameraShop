<%@page import="bean.IsProduct"%>
<%@page import="bean.Category"%>
<%@page import="java.util.ArrayList"%>
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
				required: "Bạn chưa nhập Tên tin",
				minlength: "Bạn nhập ít nhất 6 ký tự",
				maxlength: "Bạn nhập nhiều nhất 32 ký tự",
			},
			mota: {
				required: "Bạn chưa nhập Mô tả",
			},
			chitiet: {
				required: "Bạn chưa nhập Chi tiết",
			},
		}
	});
});
</script>


	<div class="module">
		 <h2><span>Thêm sản phẩm</span></h2>
		<div style ="color:red">
		<%
		String msg = request.getParameter("msg");
		if(msg != null){
			out.print(msg);
		}
		%>
		</div>
		 <div class="module-body">
			<form name="addnews" id="addnews" action="<%=request.getContextPath()%>/admin/add-news?type=load" method="post" enctype="multipart/form-data">
				<p>
					<label>Tên sản phẩm(*)</label>
					<input type="text" name="tentin" value="" class="input-medium" />
				</p>
				<p>
					<label>Danh mục</label>
					<select  name="danhmuc" class="input-short">
					<%
					ArrayList<Category> listCat = (ArrayList<Category>) request.getAttribute("listCat");
					if(listCat!=null){
						for(Category cat: listCat){
					%>
						<option value="<%=cat.getIdCat()%>"><%=cat.getNameCat() %></option>
						<%}} %>
					</select>
				</p>
				<p>
					<label>Hình ảnh</label>
					<input type="file"  name="hinhanh" value="" />
				</p>
				<p>
					<label>Mô tả</label>
					<textarea name="mota" rows="7" cols="90" class="input-medium"></textarea>
				</p>
				<p>
					<label>Giá sản phẩm</label>
					<input type="number" name="price" value="" class="input-medium" />
				</p>
				<p>
					<label>Loại hàng</label>
					<select  name="isProduct" class="input-short">
					<%
					ArrayList<IsProduct> listIsProduct = (ArrayList<IsProduct>) request.getAttribute("listIsProduct");
					if(listCat!=null){
						for(IsProduct cat: listIsProduct){
					%>
						<option value="<%=cat.getIdIsProduct()%>"><%=cat.getNameIsProduct() %></option>
						<%}} %>
					</select>
				</p>
				<p>
					<label>Chi tiết</label>
					<textarea  class = "ckeditor"  name="chitiet" rows="7" cols="90" class="input-long"></textarea>
				</p>
				<fieldset>
					<input class="submit-green" name="add" type="submit" value="Add" /> 
					<input class="submit-gray" name="reset" type="reset" value="Reset" />
				</fieldset>
			</form>
		 </div> <!-- End .module-body -->

	</div>  <!-- End .module -->
	<div style="clear:both;"></div>
</div> <!-- End .grid_12 -->
<%@include file="/templates/admin/inc/footer.jsp" %> 