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

import dao.DataBase;
import bean.User;
import bo.UserBO;

/**
 * Servlet implementation class LoginAdminAction
 */
public class LoginAdminAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginAdminAction() {
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
		String submit = request.getParameter("login");
		if(submit != null){
			// xử lý đăng nhập
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			UserBO userBO = new UserBO();
			User userLogin = userBO.checkLogin(username, password);
			if (userLogin != null) {
				// đăng nhập thành công
				HttpSession session = request.getSession();
				session.setAttribute("userLogin", userLogin);
				response.sendRedirect(request.getContextPath()+"/admin");
			} else {
				// quay lại trang đăng nhập
				RequestDispatcher rd = request.getRequestDispatcher("login.jsp?msg= Sai tên đăng nhập hoặc mật khẩu!");
				rd.forward(request, response);
			}
		}else {
			// load form
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
		}
	}

}
