package action;

import java.io.IOException;
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
 * Servlet implementation class HomeAction
 */
public class HomeAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		request.setCharacterEncoding("UTF-8");
		CatBO catBO = new CatBO();
		ProductBO productBO = new ProductBO();
		IsProductBO isProductBO = new IsProductBO();
		ArrayList<Category> listCat = catBO.getListCat();
		ArrayList<IsProduct> listIsProduct = isProductBO.getListIsProduct();
		String type = request.getParameter("type");
		if("search".equals(type)){
			String keyWord = request.getParameter("search");
			ArrayList<Products> listProduct = productBO.getListNews(keyWord);
			request.setAttribute("listCat", listCat);
			request.setAttribute("listProduct", listProduct);
			request.setAttribute("listIsProduct", listIsProduct);
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			rd.forward(request, response);
			return;
		}
		ArrayList<Products> listProduct = productBO.getListNews();
		request.setAttribute("listCat", listCat);
		request.setAttribute("listProduct", listProduct);
		request.setAttribute("listIsProduct", listIsProduct);
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
		rd.forward(request, response);
	}

}
