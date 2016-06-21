<%@page import="java.util.ArrayList"%>
<%@page import="bean.Products"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
ArrayList<Products> listCart = (ArrayList<Products>)session.getAttribute("listCart");
if(listCart!=null){
%>

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
    int dem = 0;
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
        <td><%=pro.getPrice() %></td>
        <td><input class = "soluong" style = "width: 55px;height: 33px;" type = "number" min = "1" max = "10" value = "<%=pro.getSoluong() %>" /></td>
        <td><%=pro.getSoluong()*pro.getPrice() %>$</td>
      </tr>
      <%}session.removeAttribute("listCart");session.setAttribute("listCart", listCart);
      %>
    </tbody>
  </table>
  <input type = "button" onclick = "updateBot();updateTopCart();" value = "Update" >
  <a title="" href="home" class="more" style = "border: 1px solid #9E9E9E; padding: 4px; background-color: #E3E3E3;">Continue buy</a> 
  <input type = "submit"  value = "Checkout" name = "checkout" >
  <%}else{
	  out.println("Empty");
  }
  %>
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