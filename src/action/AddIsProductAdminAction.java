package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.User;
import bo.IsProductBO;

/**
 * Servlet implementation class AddCatAdminAction
 */
public class AddIsProductAdminAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddIsProductAdminAction() {
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
		PrintWriter out = response.getWriter();
		
		//kiểm tra đăng nhập
		HttpSession session = request.getSession();
		User userLogin = (User) session.getAttribute("userLogin");
		if(userLogin == null){
			response.sendRedirect(request.getContextPath()+"/admin/login");
			return;
		}
		
		String submit = request.getParameter("add");
		if (submit != null) {
			String nameCat = new String(request.getParameter("namecat"));
			IsProductBO catBO = new IsProductBO();
			if(catBO.addIsProduct(nameCat)){
				RequestDispatcher rd = request.getRequestDispatcher("list-is-product");
				rd.forward(request, response);
			} else {
				RequestDispatcher rd = request.getRequestDispatcher("admin/addIsProduct.jsp?msg=Có lỗi trong quá trình xử lý ");
				rd.forward(request, response);
			}
			
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("addIsProduct.jsp");
			rd.forward(request, response);
		}
	}

}
