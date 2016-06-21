<%@page import="java.util.ArrayList"%>
<%@page import="bean.Products"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<Products> listProduct = (ArrayList<Products>)session.getAttribute("listCart");
	if(listProduct != null){
		int totalSoluong = 0;
		int totalGia = 0;
		for(Products pr : listProduct){
		totalSoluong += pr.getSoluong();
		totalGia += pr.getPrice() * pr.getSoluong();
		}
%>
<a href="#" class="cart-icon">cart <span class="cart_no"><%=totalSoluong %></span></a>
<ul class="option-cart-item">
<%for(Products pro:listProduct){ %>
	<li>
		<div class="cart-item">
			<div class="image">
				<img
					src="<%=request.getContextPath() %>/files/<%=pro.getPhotoProduct() %>"
					alt="">
			</div>
			<div class="item-description">
				<p class="name"><%=pro.getNameProduct() %></p>
				Quantity: <span class="light-red"><%=pro.getSoluong() %></span>
				</p>
			</div>
			<div class="right">
				<p class="price">$<%=pro.getSoluong()*pro.getPrice() %></p>
				<a href="javascript:void(0)" onClick = "removeProduct(<%=pro.getIdProduct() %>);updateBot2();" class="remove"><img src="<%=request.getContextPath()%>/templates/public/images/remove.png" alt="remove"></a>
			</div>
		</div>
	</li>
	<%}%>
	<li><span class="total">Total <strong>$<%=totalGia %></strong></span>
		<button class="checkout" onClick="location.href='checkout'">CheckOut</button>
	</li>
</ul>
<%}else{%>
<a href="#" class="cart-icon">cart <span class="cart_no">0</span></a>
<%}%>