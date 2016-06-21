package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.User;
import bo.ProductBO;

/**
 * Servlet implementation class ExecuteBillAdminAction
 */
public class ExecuteBillAdminAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ExecuteBillAdminAction() {
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
		// kiểm tra đăng nhập
		HttpSession session = request.getSession();
		User userLogin = (User) session.getAttribute("userLogin");
		if (userLogin == null) {
			response.sendRedirect(request.getContextPath() + "/admin/login");
			return;
		}
		PrintWriter out = response.getWriter();
		ProductBO productBO = new ProductBO();
		String id_order = request.getParameter("bill");
		if (productBO.executeBill(id_order)) {
			RequestDispatcher rd = request.getRequestDispatcher("list-bills");
			rd.forward(request, response);
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("list-bills?msg=error");
			rd.forward(request, response);
		}
	}

}
