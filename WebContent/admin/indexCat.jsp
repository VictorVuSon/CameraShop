<%@page import="bean.Category"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/header.jsp" %>
<div class="bottom-spacing">
	  <!-- Button -->
	  <div class="float-left">
		  <a href="<%=request.getContextPath()%>/admin/add-cat" class="button">
			<span>Thêm Danh Mục Tin <img src="<%=request.getContextPath()%>/templates/admin/images/plus-small.gif" alt="ThÃªm tin"></span>
		  </a>
	  </div>
	  <div class="clear"></div>
</div>

<div class="grid_12">
	<!-- Example table -->
	
	<div class="module">
		<h2><span>Danh sách Danh Mục Tin</span></h2>
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
				ArrayList<Category> listCat = (ArrayList<Category>) request.getAttribute("listCat");
				if(listCat != null){
					for(Category cat: listCat){
				%>
					<tr>
						<td class="align-center"><%=cat.getIdCat() %></td>
						<td><a href=""><%=cat.getNameCat() %></a></td>
						<td align="center">
							<a href="<%=request.getContextPath()%>/admin/edit-cat?idcat=<%=cat.getIdCat()%>">Sửa <img src="<%=request.getContextPath()%>/templates/admin/images/pencil.gif" alt="edit" /></a>
							<a href="<%=request.getContextPath()%>/admin/del-cat?idcat=<%=cat.getIdCat()%>" onClick="return confirm ('Are you sure?')">Xóa <img src="<%=request.getContextPath()%>/templates/admin/images/bin.gif" width="16" height="16" alt="delete" /></a>
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
			<a <% if(p == i) { out.println("class='current'");} %> href="<%=request.getContextPath()%>/admin/list-cat?trang=<%=i%>"><%=i%></a><% if(i != totalPage) out.print("|"); %>
		<% } %>
		<% } %>	
		</div> 
		<div style="clear: both;"></div> 
	 </div>
	
</div> <!-- End .grid_12 -->
<%@include file="/templates/admin/inc/footer.jsp" %> 