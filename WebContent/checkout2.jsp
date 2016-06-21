<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="templates/public/inc/header2.jsp"%>
          <div class="container">
            <p>
              Home - CheckOut
            </p>
          </div>
      </div>
      <div class="clearfix">
      </div>
      <div class="container_fullwidth">
        <div class="container">
          <div class="row">
            <div class="col-md-3">
              <div class="product-tag leftbar">
                <h3 class="title">
                  Products 
                  <strong>
                    Tags
                  </strong>
                </h3>
                <ul>
                  
                </ul>
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
            </div>
            <div class="col-md-9">
              <div class="checkout-page">
                <ol class="checkout-steps">
                	<li class="steps active">
                    <a href="javascript:void(0)" class="step-title">
                      Your shopping cart
                    </a>
                    <div class="step-description">
                    <%
                    //ArrayList<Products> listCart = (ArrayList<Product>)session.getAttribute("listCart");
                    if(listCart != null){
                    %>
                    <form method = "post"  class = "form-bot-cart" >
                    	<table class="table table-condensed">
						    <thead>
						      <tr>
						        <th>
						        	<input type = "button" value = "Delete" onclick = "deleteAll();delBot();" name = "deleteall" />
						        	<input type = "checkbox" id = "selecctall" />
						        </th>
						        <th>Picture</th>
						        <th>Name</th>
						        <th>Price</th>
						        <th>Quality</th>
						        <th>Total</th>
						      </tr>
						    </thead>
						    <tbody>
						    <%
						    for(Products pro:listCart){
						    %>
						      <tr>
						        <td>
						        	<input class = "checkbox1" type="checkbox" value="<%=pro.getIdProduct() %>" name = "checkbox1" />
						        </td>
						        <td>
						        	<img style = "width: 60px; height: 55px;border-radius: 50%;" src="<%=request.getContextPath() %>/files/<%=pro.getPhotoProduct() %>" alt="Product Name">
								</td>
						        <td><%=pro.getNameProduct() %></td>
						        <td><%=pro.getPrice() %>$</td>
						        <td><input class = "soluong" style = "width: 55px;height: 33px;" type = "number" min = "1" max = "10" value = "<%=pro.getSoluong() %>" /></td>
						        <td><%=pro.getSoluong()*pro.getPrice() %>$</td>
						      </tr>
						      <%} %>
						    </tbody>
						  </table>
						  <input type = "button" onclick = "updateBot();updateTopCart();" value = "Update" >
						  <a title="" href="home" class="more" style = "border: 1px solid #9E9E9E; padding: 4px; background-color: #E3E3E3;">Continue buy</a> 
					  </form>
						  <%}else{out.println("Empty");} %>
                    </div>
                  </li>
                </ol>
                <ol class="checkout-steps">
                  <li class="steps active">
                    <a href="javascript:void(0)" class="step-title">
                      billing information
                    </a>
                    <div class="step-description">
                      <form name = "check-out" method = "post" action = "checkout" >
                        <div class="row">
                          <div class="col-md-6 col-sm-6">
                            <div class="your-details">
                              <div class="form-row">
                                <label class="lebel-abs">
                                  Name 
                                  <strong class="red">
                                    *
                                  </strong>
                                </label>
                                <input type="text" required = "required" class="input namefild" name="name">
                              </div>
                              <div class="form-row">
                                <label class="lebel-abs">
                                  Email 
                                  <strong class="red">
                                    *
                                  </strong>
                                </label>
                                <input type="email" required = "required" class="input namefild" name="email">
                              </div>
                            </div>
                          </div>
                          <div class="col-md-6 col-sm-6">
                            <div class="your-details">
                              <div class="form-row">
                                <label class="lebel-abs">
                                  Telephone 
                                  <strong class="red">
                                    *
                                  </strong>
                                </label>
                                <input type="number" required = "required" class="input namefild" name="telephone">
                              </div>
                              <div class="form-row">
                                <label class="lebel-abs">
                                  Address
                                  <strong class="red">
                                    *
                                  </strong>
                                </label>
                                <input type="text" class="input namefild" name="address" required = "required" >
                              </div>
                            </div>
                          </div>
                        </div>
                        <input type = "submit"  value = "Checkout" name = "checkout" >
                      </form>
                    </div>
                  </li>
                </ol>
              </div>
            </div>
          </div>
<script type="text/javascript">
function deleteAll(){
	var strID = "";
	var checkboxes = document.querySelectorAll('input[name="' + "checkbox1" + '"]:checked');
    Array.prototype.forEach.call(checkboxes, function(el) {
        //values.push(el.value);
        strID += el.value+",";
    });
    if(strID == ""){
    	alert("You haven't selected item!");
    	exit();
    }
	$.ajax({
	url: '<%=request.getContextPath()%>/deleteAll',
	type: 'POST',
	cache: false,
	data: {strID:strID},
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
<script type="text/javascript">
function updateBot(){
	var arr = document.getElementsByClassName("soluong");
	var str = "";
	for(var i = 0;i<arr.length;i++){
		str+= arr[i].value;
	}
	$.ajax({
		url: '<%=request.getContextPath()%>/updateBotcart',
		type: 'POST',
		cache: false,
		data: {str:str},
		success: function(data){
			//alert(data);
			$('.form-bot-cart').html(data);
		},
		error: function (){
			alert('Something went wrong!');
		}
	});
}
</script>
<script type="text/javascript">
function delBot(){
	var str="";
	$.ajax({
		url: '<%=request.getContextPath()%>/delbot',
		type: 'POST',
		cache: false,
		data: {str:str},
		success: function(data){
			//alert(data);
			$('.form-bot-cart').html(data);
		},
		error: function (){
			alert('Something went wrong!');
		}
	});
}
</script>
<script type="text/javascript">
function updateTopCart(){
	var str="";
	$.ajax({
		url: '<%=request.getContextPath()%>/updateTopcart',
		type: 'POST',
		cache: false,
		data: {str:str},
		success: function(data){
			//alert(data);
			$('.option-cart').html(data);
		},
		error: function (){
			alert('Something went wrong!');
		}
	});
}
</script>
<script type="text/javascript">
$(document).ready(function() {
	$('#selecctall').click(function(event) {  //on toggle click 
		if(this.checked) { // check toggle status
			$('.checkbox1').each(function() { //select all checkboxes with class "checkbox1"
				this.checked = true;                        
			});
		}else{
			$('.checkbox1').each(function() { //disselect all checkboxes with class "checkbox1"
				this.checked = false;                        
			});			
		}
	});
	
});
</script>
          <%@include file="templates/public/inc/footer.jsp"%>