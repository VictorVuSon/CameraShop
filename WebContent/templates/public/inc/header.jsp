<%@page import="bean.Products"%>
<%@page import="bean.Category"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
      <meta name="description" content="">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="shortcut icon" href="<%=request.getContextPath()%>/templates/public/images/favicon.png">
      <title>Welcome to CameraShop</title>
      <link href="<%=request.getContextPath()%>/templates/public/css/bootstrap.css" rel="stylesheet">
      <link href='http://fonts.googleapis.com/css?family=Roboto:400,300,300italic,400italic,500,700,500italic,100italic,100' rel='stylesheet' type='text/css'>
      <link href="<%=request.getContextPath()%>/templates/public/css/font-awesome.min.css" rel="stylesheet">
      <link rel="stylesheet" href="<%=request.getContextPath()%>/templates/public/css/flexslider.css" type="text/css" media="screen"/>
      <link href="<%=request.getContextPath()%>/templates/public/css/sequence-looptheme.css" rel="stylesheet" media="all"/>
      <link href="<%=request.getContextPath()%>/templates/public/css/style.css" rel="stylesheet">
      <link href="<%=request.getContextPath()%>/templates/public/css/custom.css" rel="stylesheet">
      <script type="text/javascript" src="<%=request.getContextPath()%>/templates/public/js/jquery-2.1.1.min.js"></script>
      <!--[if lt IE 9]><script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script><script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script><![endif]-->
   </head>
   <body id="home">
   <%if(request.getParameter("checkout")!=null){ %>
   <script type="text/javascript">
		alert = confirm("Checkout succesfully, we will delive product to you soon!");
	</script>
  <%} %>
  <%if(request.getParameter("send")!=null){ %>
   <script type="text/javascript">
		alert = confirm("Send your contact succsesfully, thanks you!");
	</script>
  <%} %>
      <div class="wrapper">
         <div class="header">
            <div class="container">
               <div class="row">
                  <div class="col-md-2 col-sm-2">
                     <div class="logo"><a href="home"><img class = "logo" src="<%=request.getContextPath()%>/templates/public/images/logo2.png" alt="FlatShop"></a></div>
                  </div>
                  <div class="col-md-10 col-sm-10">
                     <div class="clearfix"></div>
                     <div class="header_bottom">
                        <ul class="option">
                           <li id="search" class="search">
                              <form action="home?type=search" method = "post"><input class="search-submit" type="submit" value = ""><input class="search-input" placeholder="Enter your search term..." type="text" value="" name="search"></form>
                           </li>
                           <li class="option-cart">
                           	<%
                              	ArrayList<Products> listCart = (ArrayList<Products>)session.getAttribute("listCart");
                           		if(listCart == null){
                              %>
                              <a href="#" class="cart-icon">cart <span class="cart_no">0</span></a>
                              <%}else{ 
                            	int totalSoluong = 0;
  	                          	int totalGia = 0;
  	                          	for(Products pr : listCart){
  	                          		totalSoluong += pr.getSoluong();
  	                          		totalGia += pr.getPrice() * pr.getSoluong();
  	                          	}
                              %>
                              <a href="#" class="cart-icon">cart <span class="cart_no"><%=totalSoluong %></span></a>
                              <ul class="option-cart-item">
                              <%
                              	for(Products pro:listCart){
                              %>
                                 <li>
                                    <div class="cart-item">
                                       <div class="image"><img src="<%=request.getContextPath() %>/files/<%=pro.getPhotoProduct() %>" alt=""></div>
                                       <div class="item-description">
                                          <p class="name"><%=pro.getNameProduct() %></p>
                                          Quantity: <span class="light-red"><%=pro.getSoluong() %></span></p>
                                       </div>
                                       <div class="right">
                                          <p class="price">$<%=pro.getSoluong()*pro.getPrice() %></p>
                                          <a href="javascript:void(0)" onClick = "removeProduct(<%=pro.getIdProduct() %>);" class="remove"><img src="<%=request.getContextPath()%>/templates/public/images/remove.png" alt="remove"></a>
                                       </div>
                                    </div>
                                 </li>
                                 <%} %>
                                 <li><span class="total">Total <strong>$<%=totalGia %></strong></span><button class="checkout" onClick="location.href='checkout'">CheckOut</button></li>
                              </ul>
                              <%} %>
                           </li>
                        </ul>
<script type="text/javascript">
	function removeProduct(idProduct){
			$.ajax({
			url: '<%=request.getContextPath()%>/remove-product',
			type: 'POST',
			cache: false,
			data: {idProduct: idProduct},
			success: function(data){
				//alert(data);
				$('.option-cart').html(data);
			},
			error: function (){
				alert('Something went wrong!');
			}
		});
		return false;
	}
</script>
                        <div class="navbar-header"><button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button></div>
                        <div class="navbar-collapse collapse">
                           <ul class="nav navbar-nav">
                              <li class="active dropdown">
                                 <a href="home" class="dropdown-toggle" data-toggle="dropdown">Home</a>
                              </li>
                              <li class="dropdown">
                                 <a href="#" class="dropdown-toggle" data-toggle="dropdown">Camera</a>
                                 <div class="dropdown-menu mega-menu">
                                    <div class="row">
                                       <div class="col-md-6 col-sm-6">
                                          <ul class="mega-menu-links">
                                          <%
                                          	ArrayList<Category> listCat = (ArrayList<Category>)request.getAttribute("listCat");
                                          	if(listCat.size()>0){
                                        	  for(Category cat:listCat){
                                          %>
                                             <li><a href="view-category?cat=<%=cat.getIdCat()%>"><%=cat.getNameCat() %></a></li>
                                            <%}} %>
                                          </ul>
                                       </div>
                                    </div>
                                 </div>
                              </li>
                              <li class="dropdown">
                                 <a href="#" class="dropdown-toggle" data-toggle="dropdown">Fashion</a>
                              </li>
                              <li><a href="contact">contact us</a></li>
                              
                           </ul>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <div class="clearfix"></div>