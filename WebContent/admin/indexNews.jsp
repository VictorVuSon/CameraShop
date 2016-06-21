<%@page import="bean.Products"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/header.jsp" %>
<div class="bottom-spacing">
	  <!-- Button -->
	  <div class="float-left">
		  <a href="<%=request.getContextPath()%>/admin/add-news" class="button">
			<span>Thêm sản phẩm <img src="<%=request.getContextPath()%>/templates/admin/images/plus-small.gif" alt="Thêm tin"></span>
		  </a>
	  </div>
	  <div class="clear"></div>
</div>

<div class="grid_12">
	<!-- Example table -->
	<div class="module">
		<h2><span>Danh sách tin</span></h2>
		
		<div class="module-table-body">
			<form action="">
			<table id="myTable" class="tablesorter">
				<thead>
					<tr>
						<th style="width:4%; text-align: center;">ID</th>
						<th>Tên</th>
						<th style="width:20%">Danh mục</th>
						<th style="width:16%; text-align: center;">Giá</th>
						<th style="width:16%; text-align: center;">Loại hàng</th>
						<th style="width:16%; text-align: center;">Hình ảnh</th>
						<th style="width:11%; text-align: center;">Chức năng</th>
					</tr>
				</thead>
				<tbody>
				<%
					ArrayList<Products> listNews = (ArrayList<Products>) request.getAttribute("listNews");
						if(listNews != null){
							for(Products news: listNews){
				%>
					<tr>
						<td class="align-center"><%=news.getIdProduct() %></td>
						<td><a href="<%=request.getContextPath()%>/admin/edit-news?type=load&idnews=<%=news.getIdProduct()%>"><%=news.getNameProduct() %></a></td>
						<td><%=news.getNameCat() %></td>
						<td><%=news.getPrice() %></td>
						<td><%=news.getNamIsProduct() %></td>
						<td align="center">
							<%
							if(news.getPhotoProduct() != ""){
							%>
							<img src="<%=request.getContextPath() %>/files/<%=news.getPhotoProduct() %>" onerror="<%= request.getContextPath() %>/file/LichHoc.jpg" class="hoa" />
							<%} else{
								out.println("-Chưa có hình ảnh-");// chưa kiểm tra đc
							}
							
							%>
						</td>
						<td align="center">
							<a href="<%=request.getContextPath()%>/admin/edit-news?type=load&idnews=<%=news.getIdProduct()%>">Sửa <img src="<%=request.getContextPath() %>/templates/admin/images/pencil.gif" alt="edit" /></a>
							<a href="<%=request.getContextPath()%>/admin/del-news?idnews=<%=news.getIdProduct()%>" onClick="return confirm ('Are you sure?')">Xóa <img src="<%=request.getContextPath() %>/templates/admin/images/bin.gif" width="16" height="16" alt="delete" /></a>
						</td>
					</tr>
				   <%}} %>
				</tbody>
			</table>
			</form>
		 </div> <!-- End .module-table-body -->
	</div> <!-- End .module -->
		
		<% 
		Integer totalPage = (Integer) request.getAttribute("totalPage");
		Integer p = (Integer) request.getAttribute("p");
		if(totalPage > 1){
		%>
		 <div class="pagination">           
			<div class="numbers">
				<span>Trang:</span> 
				<%
			for(int i = 1; i <= totalPage; i++){
			%>
				<a <% if(p == i) { out.println("class='current'");} %> href="<%=request.getContextPath()%>/admin/list-news?trang=<%=i%>"><%=i%></a><% if(i != totalPage) out.print("|"); %>
			<% } %>
			<% } %>	
			</div> 
			<div style="clear: both;"></div> 
		 </div>
	
</div> <!-- End .grid_12 -->
<%@include file="/templates/admin/inc/footer.jsp" %> 