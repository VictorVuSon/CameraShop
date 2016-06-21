<%@page import="java.util.ArrayList"%>
<%@page import="bean.Products"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String strID = request.getParameter("strID");
	String[] array = strID.split(",");
	ArrayList<Products> listCart = (ArrayList<Products>)session.getAttribute("listCart");
	for(int j = 0 ;j < array.length;j++){
		for(int i = 0;i< listCart.size();i++){
			if(listCart.get(i).getIdProduct() == Integer.parseInt(array[j])){
				listCart.remove(i);
			}
		}		
	}
	session.removeAttribute("listCart");
	session.setAttribute("listCart", listCart);
%>
<%
	int totalSoluong = 0;
	int totalGia = 0;
	for(Products pr : listCart){
		totalSoluong += pr.getSoluong();
		totalGia += pr.getPrice() * pr.getSoluong();
	}
%>
<a href="#" class="cart-icon">cart <span class="cart_no"><%=totalSoluong %></span></a>
<%if(totalSoluong !=0) {%>
<ul class="option-cart-item">
<%for(Products pro:listCart){ %>
	<li>
		<div class="cart-item">
			<div class="image">
				<img src="<%=request.getContextPath() %>/files/<%=pro.getPhotoProduct() %>" alt="">
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
	<%} %>
	<li><span class="total">Total <strong>$<%=totalGia %></strong></span>
		<button class="checkout" onClick="location.href='checkout'">CheckOut</button></li>
</ul>
<%}else{session.removeAttribute("listCart");}%>