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
import bo.CatBO;
import bo.IsProductBO;
import bo.ProductBO;

/**
 * Servlet implementation class PublicContactAction
 */
public class PublicContactAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PublicContactAction() {
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
		CatBO catBO = new CatBO();
		String contact = request.getParameter("contact");
		
		if("send".equals(contact)){
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String message = request.getParameter("message");
			if(catBO.saveContact(name,email,message)){
				RequestDispatcher rd = request.getRequestDispatcher("home?send=true");
				rd.forward(request, response);
				return;
			}
		}
		ArrayList<Category> listCat = catBO.getListCat();
		request.setAttribute("listCat", listCat);
		RequestDispatcher rd = request.getRequestDispatcher("contactpublic.jsp");
		rd.forward(request, response);
	}

}
