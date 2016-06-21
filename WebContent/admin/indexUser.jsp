<%@page import="bean.User"%>
<%@page import="bean.Category"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/header.jsp" %>
<div class="bottom-spacing">
	  <!-- Button -->
	  <div class="float-left">
	  	<%
		  	User userLogin = (User) session.getAttribute("userLogin");
		  	if(userLogin.getUserName().equals("admin")){ 
	  	%>
		  <a href="<%=request.getContextPath()%>/admin/add-user" class="button">
			<span>Thêm User<img src="<%=request.getContextPath()%>/templates/admin/images/plus-small.gif" alt="Thêm User"></span>
		  </a>
		<%} %>
	  </div>
	  <div class="clear"></div>
</div>

<div class="grid_12">
	<!-- Example table -->
	
	<div class="module">
		<h2><span>Danh sách User</span></h2>
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
						<th>Username</th>
						<th>Fullname</th>
						<th>Chức vụ</th>
						<th style="width:11%; text-align: center;">Chức năng</th>
					</tr>
				</thead>
				<tbody>
				<%
				ArrayList<User> listUser = (ArrayList<User>) request.getAttribute("listUser");
				if(listUser != null){
					for(User user: listUser){
				%>
					<tr>
						<td class="align-center"><%=user.getUserID()%></td>
						<td><%=user.getUserName()%></td>
						<td><%=user.getFullName()%></td>
						<td>
							<%
								if(user.getRole() == 1){
									if(user.getUserName().equals("admin")){
										out.print("Admin");
									}else{
										out.print("Nhân viên");
									}
								}else{
									out.print("Khách hàng");
								}
							%>
						</td>
						<td align="center">
							<%
								if(userLogin.getUserName().equals("admin")){
									if(user.getUserName().equals("admin")){
							%>
								<a href="<%=request.getContextPath()%>/admin/edit-user?iduser=<%=user.getUserID()%>">Sửa <img src="<%=request.getContextPath()%>/templates/admin/images/pencil.gif" alt="edit" /></a>
							<%}else{ %>
								<a href="<%=request.getContextPath()%>/admin/edit-user?iduser=<%=user.getUserID()%>">Sửa <img src="<%=request.getContextPath()%>/templates/admin/images/pencil.gif" alt="edit" /></a>
								<a href="<%=request.getContextPath()%>/admin/del-user?iduser=<%=user.getUserID()%>">Xóa <img src="<%=request.getContextPath()%>/templates/admin/images/pencil.gif" alt="edit" /></a>
							<%} %>
							<%}else if(user.getUserID() == userLogin.getUserID() || user.getRole() != 1){%>
								<a href="<%=request.getContextPath()%>/admin/edit-user?iduser=<%=user.getUserID()%>">Sửa <img src="<%=request.getContextPath()%>/templates/admin/images/pencil.gif" alt="edit" /></a>
							
						<%	}
							%>
						</td>	
					</tr>
					<% }} %>
					
				   
				</tbody>
			</table>
			</form>
		 </div> <!-- End .module-table-body -->
	</div> <!-- End .module -->
	
</div> <!-- End .grid_12 -->
<%@include file="/templates/admin/inc/footer.jsp" %> 