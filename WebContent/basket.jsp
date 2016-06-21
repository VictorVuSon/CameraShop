<%@page import="java.util.ArrayList"%>
<%@page import="bean.Products"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String idProduct = request.getParameter("idProduct");
	String nameProduct = request.getParameter("nameProduct");
	String soluong = request.getParameter("quality");
	String price = request.getParameter("price");
	String picture = request.getParameter("picture");
	Products newProduct = new Products();
	newProduct.setIdProduct(Integer.parseInt(idProduct));
	newProduct.setNameProduct(nameProduct);
	newProduct.setPrice(Integer.parseInt(price));
	newProduct.setPhotoProduct(picture);
	newProduct.setSoluong(Integer.parseInt(soluong));
	ArrayList<Products> listProduct = (ArrayList<Products>)session.getAttribute("listCart");
	if(listProduct != null){
		boolean check = true;
		for(Products product:listProduct){
			if(newProduct.getIdProduct() == product.getIdProduct()){
				product.setSoluong(product.getSoluong() + newProduct.getSoluong());
				check = false;
			}
		}
		if(check){
			listProduct.add(newProduct);
		}
	}else{
		listProduct = new ArrayList<Products>();
		listProduct.add(newProduct);
		session.setAttribute("listCart", listProduct);
	}
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
				<img src="<%=request.getContextPath() %>/files/<%=pro.getPhotoProduct() %>" alt="">
			</div>
			<div class="item-description">
				<p class="name"><%=pro.getNameProduct() %></p>
				Quantity: <span class="light-red"><%=pro.getSoluong() %></span>
				</p>
			</div>
			<div class="right">
				<p class="price">$<%=pro.getSoluong()*pro.getPrice() %></p>
				<a href="javascript:void(0)" onClick = "removeProduct(<%=pro.getIdProduct() %>);" class="remove"><img src="<%=request.getContextPath()%>/templates/public/images/remove.png" alt="remove"></a>
			</div>
		</div>
	</li>
	<%} %>
	<li><span class="total">Total <strong>$<%=totalGia %></strong></span>
		<button class="checkout" onClick="location.href='checkout'">CheckOut</button>
	</li>
</ul>