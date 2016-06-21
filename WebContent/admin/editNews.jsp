<%@page import="bean.IsProduct"%>
<%@page import="bean.Products"%>
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
			Products productDetail = (Products) request.getAttribute("productDetail");
			ArrayList<Category> listCat = (ArrayList<Category>) request.getAttribute("listCat");
			ArrayList<IsProduct> listIsProduct = (ArrayList<IsProduct>) request.getAttribute("listIsProduct");
		%>
		 <div class="module-body">
			<form name="addnews" id="addnews" action="<%=request.getContextPath()%>/admin/edit-news?type=edit&idnews=<%= productDetail.getIdProduct()%>" method="post" enctype="multipart/form-data">
				<p>
					<label>Tên sản phẩm(*)</label>
					<input type="text" name="tentin" value="<%=productDetail.getNameProduct()%>" class="input-medium" />
				</p>
				<p>
					<label>Danh mục sản phẩm</label>
					<select  name="danhmuc" class="input-short">
					<%
					if(listCat != null){
						String selected = "";
						for(Category cat: listCat){
							if(cat.getIdCat() == productDetail.getIdCat()){
								selected = "selected = 'selected'";
							}
					%>
						<option value="<%=cat.getIdCat()%>" <%=selected %>><%=cat.getNameCat() %></option>
					<%}} %>
					</select>
				</p>
				<p>
					<label>Hình ảnh</label>
					<input type="file"  name="hinhanh" value="" />
				</p>
				<p>
					<label>Mô tả</label>
					<textarea name="mota" rows="7" cols="90" class="input-medium"><%=productDetail.getPreviewText() %></textarea>
				</p>
				<p>
					<label >Chi tiết</label>
					<textarea  class = "ckeditor" name="chitiet" value="<%=productDetail.getDetail() %>" rows="7" cols="90" class="input-long"><%=productDetail.getDetail() %></textarea>
				</p>
				<p>
					<label>Giá(*)</label>
					<input type="number" name="price" value="<%=productDetail.getPrice()%>" class="input-medium" />
				</p>
				<p>
					<label>Loại sản phẩm(*)</label>
					<select  name="isProduct" class="input-short">
					<%
					if(listIsProduct != null){
						for(IsProduct isProduct: listIsProduct){
							String selected2 = "";
							if(isProduct.getIdIsProduct() ==  productDetail.getIsProduct()){
								selected2 = "selected = 'selected'";
							}
					%>
						<option value="<%=isProduct.getIdIsProduct()%>" <%=selected2 %>><%=isProduct.getNameIsProduct() %></option>
					<%}} %>
					</select>
				</p>
				<fieldset>
					<input class="submit-green" name="Edit" type="submit" value="Edit" /> 
				</fieldset>
			</form>
		 </div> <!-- End .module-body -->

	</div>  <!-- End .module -->
	<div style="clear:both;"></div>
</div> <!-- End .grid_12 -->
<%@include file="/templates/admin/inc/footer.jsp" %> 