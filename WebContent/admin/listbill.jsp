<%@page import="bean.Bill"%>
<%@page import="bean.Products"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/header.jsp" %>
<%ArrayList<Bill> listBill = (ArrayList<Bill>)request.getAttribute("listBill");%>
<div class="bottom-spacing">
                  <!-- Button -->
                  <div class="float-left">
                  <span style ="color:green;" class="thongbao">
                      	<%if(request.getParameter("msg")!=null){
                      		out.print(request.getParameter("msg")!=null);
                      	}
                      		%>
                      </span>
                  </div>
                  <div class="clear"></div>
            </div>
            <form action="" method = "post" enctype="multipart/form-data">
            <div class="grid_12">
                <!-- Example table -->
                <div class="module">
                	<h2><span>Tất cả đơn hàng</span></h2>
                    <div class="module-table-body">
                        <table id="myTable" class="tablesorter">
                        	<thead>
                                <tr>
                                    <th style="width:4%; text-align: center;">ID</th>
                                    <th style="width:11%; text-align: center;">Tên khách hàng</th>
                                    <th style="width:16%; text-align: center;">Số điện thoại</th>
                                    <th >Địa chỉ</th>
                                    <th style="width:11%; text-align: center;">Tổng tiền</th>
                                    <th style="width:11%; text-align: center;">Tình trạng</th>
                                </tr>
                            </thead>
                            <tbody>
                           <% if(listBill.size() > 0){
                        	   for(Bill bill:listBill){
                        	   %>
                                <tr>
                                    <td class="align-center"><a href = "view-bill?bill=<%=bill.getId_order() %>">Bill-<%=bill.getId_order() %></a></td>
                                    <td><%=bill.getUser().getFullName() %></td>
                                    <td align="center">
                                    	<%=bill.getUser().getPhone_number() %>
                                    </td>
                                    <td class = "align-center"><%=bill.getUser().getAddress() %></td>
                                    <td class = "align-center">
                                    	<%=bill.getTotal() %>$
                                    </td>
                                    <td class = "align-center">
                                    	<%if(bill.getStatus() == 0){ %>
                                    		<a href = "execute-bill?bill=<%=bill.getId_order()%>">Execute</a>
                                    	<%} else out.print("Executed");%>
                                    </td>
                                </tr>
                                
                                <%}} %>
                            </tbody>
                        </table>
                     </div> <!-- End .module-table-body -->
                </div> <!-- End .module -->
                     <div class="pagination">           
                        <div style="clear: both;"></div> 
                     </div>
			</div> <!-- End .grid_12 -->
			</form>
<%@include file="/templates/admin/inc/footer.jsp" %> 