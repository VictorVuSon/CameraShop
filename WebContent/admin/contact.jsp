<%@page import="bean.Contact"%>
<%@page import="bean.Category"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/header.jsp" %>
<%ArrayList<Contact> listContact = (ArrayList<Contact>)request.getAttribute("listContact"); %>
<div class="bottom-spacing">
                  <!-- Button -->
                  <div class="float-left">
                      <span style ="color:green;" class="thongbao">
                      </span>
                  </div>
                  <div class="clear"></div>
            </div>
            <form action="" method = "post" enctype="multipart/form-data">
            <div class="grid_12">
                <!-- Example table -->
                <div class="module">
                	<h2><span>Liên hệ</span></h2>
                    <div class="module-table-body">
                        <table id="myTable" class="tablesorter">
                        	<thead>
                                <tr>
                                    <th style="width:4%; text-align: center;">ID</th>
                                    <th style="width:11%; text-align: center;">Tên liên hệ</th>
                                    <th style="width:16%; text-align: center;">Email</th>
                                    <th >Nội dung</th>
                                </tr>
                            </thead>
                            <tbody>
                            <%if(listContact.size()>0){
                            	for(Contact contact:listContact){
                            	%>
                                <tr>
                                    <td class="align-center">CT<%=contact.getIdContact() %></td>
                                    <td><%=contact.getName() %></td>
                                    <td align="center">
                                    	<%=contact.getEmail() %>
                                    </td>
                                    <td class = "align-center"><%=contact.getMessage() %></td>
                                </tr>
                                <%} }%>
                            </tbody>
                        </table>
                     </div> <!-- End .module-table-body -->
                </div> <!-- End .module -->
			</div> <!-- End .grid_12 -->
			</form>
<%@include file="/templates/admin/inc/footer.jsp" %> 