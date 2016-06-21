package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Category;
import bean.IsProduct;
import bean.User;
import bo.CatBO;
import bo.IsProductBO;
import bo.ProductBO;
import dao.DataBase;

/**
 * Servlet implementation class ListCatAdminAction
 */
public class ListIsProductAdminAction extends HttpServlet {
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListIsProductAdminAction() {
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
		
		//kiểm tra đăng nhập
		HttpSession session = request.getSession();
		User userLogin = (User) session.getAttribute("userLogin");
		if(userLogin == null){
			response.sendRedirect(request.getContextPath()+"/admin/login");
			return;
		}	
		IsProductBO isproductBO = new IsProductBO();
		ArrayList<IsProduct> listCat = isproductBO.getListIsProduct();
		request.setAttribute("list", listCat);
		RequestDispatcher rd = request.getRequestDispatcher("indexIsProduct.jsp");
		rd.forward(request, response);
	}

}
