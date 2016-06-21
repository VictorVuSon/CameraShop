package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Category;
import bean.Products;
import bean.User;
import bo.CatBO;
import bo.ProductBO;

/**
 * Servlet implementation class PublicCheckoutAction
 */
public class PublicCheckoutAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PublicCheckoutAction() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		String checkout = request.getParameter("checkout");
		if ("Checkout".equals(checkout)) {
//			out.println("let's checkout");
			ProductBO productBO = new ProductBO();
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String telephone = request.getParameter("telephone");
			String address = request.getParameter("address");
			HttpSession session = request.getSession();
			ArrayList<Products> listCart = (ArrayList<Products>)session.getAttribute("listCart");
			if(listCart == null){
				response.sendRedirect("home");
				return;
			}
			User guest = new User();
			guest.setAddress(address);
			guest.setFullName(name);
			guest.setEmail(email);
			guest.setPhone_number(telephone);
			if(productBO.checkout(guest,listCart)){
				session.removeAttribute("listCart");
				RequestDispatcher rd = request.getRequestDispatcher("home?checkout=true");
				rd.forward(request, response);
			}else{
				out.println("error");
			}
		} else {
			HttpSession session = request.getSession();
			CatBO catBO = new CatBO();
			ArrayList<Category> listCat = catBO.getListCat();
			request.setAttribute("listCat", listCat);
			RequestDispatcher rd = request.getRequestDispatcher("checkout2.jsp");
			rd.forward(request, response);
		}
	}

}
