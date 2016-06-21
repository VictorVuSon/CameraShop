<%@page import="bean.Bill"%>
<%@page import="bean.Products"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/header.jsp" %>
<%ArrayList<Bill> listBill = (ArrayList<Bill>)request.getAttribute("listProductBill");%>
<div class="bottom-spacing">
                  <!-- Button -->
                  <div class="float-left">
                  <%
                  	if(listBill.get(1).getStatus()== 0){ 
                  %>
                  <h3><a href = "execute-bill?bill=<%=listBill.get(1).getId_order()%>">Execute</a></h3>
                  <%}else out.print("Executed");%>
                  
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
                	<h2><span>Chi tiết đơn hàng</span></h2>
                    <div class="module-table-body">
                    	<%for(Bill bill:listBill){
                    		
                    		%>
                    	<ul>
                    		<li><h4>Sản phẩm:<%=bill.getProduct().getNameProduct() %></h4></li>
                    		<li>Số lượng:<%=bill.getProduct().getSoluong() %></li>
                    		<li>Tổng tiền:<%=bill.getProduct().getPrice()*bill.getProduct().getSoluong() %>$</li>
                    	</ul>
                    	<%} %>
                    	<h3>Tổng chi phí:<%=listBill.get(1).getTotal() %>$</h3>
	                    </div> <!-- End .module-table-body -->
                    <h2><span>Thông tin khách hàng</span></h2>
                    <div class="module-table-body">
                    	<ul>
                    		<li><%=listBill.get(1).getUser().getFullName() %></li>
                    		<li><%=listBill.get(1).getUser().getEmail() %></li>
                    		<li><%=listBill.get(1).getUser().getPhone_number() %></li>
                    		<li><%=listBill.get(1).getUser().getAddress() %></li>
                    	</ul>
                    </div> <!-- End .module-table-body -->
                </div> <!-- End .module -->
			</div> <!-- End .grid_12 -->
			</form>
<%@include file="/templates/admin/inc/footer.jsp" %> 