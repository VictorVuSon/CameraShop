package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Category;
import bean.IsProduct;
import bean.Products;
import bo.CatBO;
import bo.IsProductBO;
import bo.ProductBO;

/**
 * Servlet implementation class PublicGetDetailProduct
 */
public class PublicGetDetailProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PublicGetDetailProduct() {
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
		CatBO catBO = new CatBO();
		ProductBO productBO = new ProductBO();
		IsProductBO isProductBO = new IsProductBO();
		ArrayList<Products> listProduct = productBO.getListNews();
		ArrayList<Category> listCat = catBO.getListCat();
		request.setAttribute("listCat", listCat);
		request.setAttribute("listProduct", listProduct);
//		out.println("Hello");
		int idProduct = 0;
		try {
			idProduct = Integer.parseInt(request.getParameter("id"));
			if(idProduct<=0){throw new Exception();}
		} catch (Exception e) {
			response.sendRedirect("home");
			return;
		}
		Products products = productBO.getDetail(idProduct);
		request.setAttribute("product", products);
		RequestDispatcher rd = request.getRequestDispatcher("details.jsp");
		rd.forward(request, response);
	}

}
