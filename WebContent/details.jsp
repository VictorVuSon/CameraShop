<%@page import="bean.Products"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="templates/public/inc/header2.jsp"%>
<%
Products products = (Products)request.getAttribute("product");
ArrayList<Products> listProduct = (ArrayList<Products>)request.getAttribute("listProduct");
%>
 <div class="page-index">
          <div class="container">
            <p>
              Home - Products Details
            </p>
          </div>
        </div>
      </div>
      <div class="clearfix">
      </div>
      <div class="container_fullwidth">
        <div class="container">
          <div class="row">
            <div class="col-md-9">
              <div class="products-details">
                <div class="preview_image">
                	<img src="<%=request.getContextPath() %>/files/<%=products.getPhotoProduct() %>" alt="Product Name">
                </div>
                <div class="products-description">
                  <h5 class="name">
                    <%=products.getNameProduct() %>
                  </h5>
                  <p>
                    <%=products.getPreviewText() %>
                  </p>
                  <hr class="border">
                  <div class="price">
                    Price : 
                    <span class="new_price">
                      <%=products.getPrice() %>
                      <sup>
                        $
                      </sup>
                    </span>
                  </div>
                  <hr class="border">
                  <div class="wided">
                  <form name = "" action = "javascript:void(0)" method = "post">
                    <div class="qty">
                      Qty &nbsp;&nbsp;: 
                      <input type = "number" value = "" min="1" max="10" required = "required" id = "qty" />
                    </div>
                    <div class="button_group">
                      <button class="button" type = "submit" onclick="mua('<%=products.getIdProduct()%>','<%=products.getNameProduct()%>',document.getElementById('qty').value,<%=products.getPrice()%>,'<%=products.getPhotoProduct()%>');" >
                        Add To Cart
                      </button>
<script type="text/javascript">
		function mua(idProduct,nameProduct,quality,price,picture){
				if(quality>10 || quality <=0){
					exit();
				}
				$.ajax({
				url: '<%=request.getContextPath()%>/basket',
				type: 'POST',
				cache: false,
				data: {idProduct: idProduct, nameProduct: nameProduct, quality: quality, price: price, picture: picture},
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
                    </div>
                  </form>
                  </div>
                  <div class="clearfix">
                  </div>
                  <hr class="border">
                </div>
              </div>
              <div class="clearfix">
              </div>
              <h3 class="title">
                  <strong>
                    Detail
                  </strong>
              </h3>
              <div class="tab-content" id="Descraption">
                    <p>
                      <%=products.getDetail() %>
                    </p>
              </div>
              <div class="clearfix">
              </div>
              <div id="productsDetails" class="hot-products">
                <h3 class="title">
                  <strong>
                    Hot
                  </strong>
                  Products
                </h3>
                <ul id="hot">
                  <%
                  	int count = 0;
                  	int indexPrint = 0;
                  	for(;count<listProduct.size();){
                  %>
                     <li>
                        <div class="row">
                        <%
                        	for(;count<listProduct.size();count++){
                    	 		if(listProduct.get(count).getIsProduct() == 3){
                    	 		indexPrint++;
                    	 		if((indexPrint!=1) && (indexPrint % 4 == 1)){indexPrint = 0;break;}
                    	 %>
                           <div class="col-md-3 col-sm-6">
                              <div class="products">
                                 <div class="offer">Spec</div>
                                 <div class="thumbnail"><a href="detail?id=<%=listProduct.get(count).getIdProduct()%>"><img src="<%=request.getContextPath() %>/files/<%=listProduct.get(count).getPhotoProduct() %>" alt="Product Name"></a></div>
                                 <div class="productname"><%=listProduct.get(count).getNameProduct() %></div>
								 <div class="productname desc">
								 </div>
                                 <div class="button_group">
									<i class="price">$<%=listProduct.get(count).getPrice() %></i>
									<button class="button add-cart" type="button" onclick="mua('<%=listProduct.get(count).getIdProduct()%>','<%=listProduct.get(count).getNameProduct()%>',1,<%=listProduct.get(count).getPrice()%>,'<%=listProduct.get(count).getPhotoProduct()%>');">Add To Cart</button>
								 </div>
                              </div>
                           </div>
                           <%
                    	 	}} %>
                        </div>
 <script type="text/javascript">
		function mua(idProduct,nameProduct,quality,price,picture){
				$.ajax({
				url: '<%=request.getContextPath()%>/basket',
				type: 'POST',
				cache: false,
				data: {idProduct: idProduct, nameProduct: nameProduct, quality: quality, price: price, picture: picture},
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
                     </li>
                     <%} %>
                  </ul>
              </div>
              <div class="clearfix">
              </div>
            </div>
            <div class="col-md-3">
              <div class="special-deal leftbar">
                <h4 class="title">
                  Special 
                  <strong>
                    Deals
                  </strong>
                </h4>
                <%
                		int countt = 0;
                		for(Products products2 : listProduct){
                			if(products2.getIsProduct() == 4){
                				countt++;
                				if(countt == 5)break;
                			}
                			if(products2.getIsProduct() == 3){
                				continue;
                			}
                  	%>
                <div class="special-item">
                	
                  <div class="product-image">
                    <a href="detail?id=<%=products2.getIdProduct()%>">
                      <img src="<%=request.getContextPath() %>/files/<%=products2.getPhotoProduct() %>" alt="Product Name">
                    </a>
                  </div>
                  <div class="product-info">
                    <p>
                      <%=products2.getNameProduct() %>
                    </p>
                    <h5 class="price">
                      $<%=products2.getPrice() %>
                    </h5>
                  </div>
                </div>
                <%} %>
              </div>
              <div class="clearfix">
              </div>
              <div class="product-tag leftbar">
                <h3 class="title">
                  Products 
                  <strong>
                    Tags
                  </strong>
                </h3>
                <ul> 
                  <li>
                    <a href="#">
                      Lincoln us
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      SDress for Girl
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      Corner
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      Window
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      PG
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      Oscar
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      Bath room
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      PSD
                    </a>
                  </li>
                </ul>
              </div>
              <div class="clearfix">
              </div>
              <div class="get-newsletter leftbar">
                <h3 class="title">
                  Get 
                  <strong>
                    newsletter
                  </strong>
                </h3>
                <p>
                  Casio G Shock Digital Dial Black.
                </p>
                <form>
                  <input class="email" type="text" name="" placeholder="Your Email...">
                  <input class="submit" type="submit" value="Submit">
                </form>
              </div>
              <div class="clearfix">
              </div>
            </div>
          </div>
<%@include file="templates/public/inc/footer.jsp"%>