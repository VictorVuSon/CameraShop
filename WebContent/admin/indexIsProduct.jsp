<%@page import="bean.IsProduct"%>
<%@page import="bean.Category"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/header.jsp" %>
<div class="bottom-spacing">
	  <!-- Button -->
	  <div class="float-left">
		  <a href="<%=request.getContextPath()%>/admin/add-is-product" class="button">
			<span>Thêm loại sản phẩm <img src="<%=request.getContextPath()%>/templates/admin/images/plus-small.gif" alt="Thêm loại sản phẩm"></span>
		  </a>
	  </div>
	  <div class="clear"></div>
</div>

<div class="grid_12">
	<!-- Example table -->
	
	<div class="module">
		<h2><span>Danh sách loại sản phẩm</span></h2>
		<div style ="color:red">
			<%
			String msg = request.getParameter("msg");
			if(msg != null){
				out.print(msg);
			}
			%>
		</div>
		<div class="module-table-body">
			<form action="">
			<table id="myTable" class="tablesorter">
				<thead>
					<tr>
						<th style="width:4%; text-align: center;">ID</th>
						<th>Tên</th>
						<th style="width:11%; text-align: center;">Chức năng</th>
					</tr>
				</thead>
				<tbody>
				<%
				ArrayList<IsProduct> list = (ArrayList<IsProduct>) request.getAttribute("list");
				if(list != null){
					for(IsProduct isproduct: list){
				%>
					<tr>
						<td class="align-center"><%=isproduct.getIdIsProduct() %></td>
						<td><a href=""><%=isproduct.getNameIsProduct() %></a></td>
						<td align="center">
							<a href="<%=request.getContextPath()%>/admin/edit-is-product?idcat=<%=isproduct.getIdIsProduct()%>">Sửa <img src="<%=request.getContextPath()%>/templates/admin/images/pencil.gif" alt="edit" /></a>
							<a href="<%=request.getContextPath()%>/admin/del-is-product?idcat=<%=isproduct.getIdIsProduct()%>" onClick="return confirm ('Are you sure?')">Xóa <img src="<%=request.getContextPath()%>/templates/admin/images/bin.gif" width="16" height="16" alt="delete" /></a>
						</td>
					</tr>
					<%}} %>
					
				   
				</tbody>
			</table>
			</form>
		 </div> <!-- End .module-table-body -->
	</div> <!-- End .module -->
	
</div> <!-- End .grid_12 -->
<%@include file="/templates/admin/inc/footer.jsp" %> 