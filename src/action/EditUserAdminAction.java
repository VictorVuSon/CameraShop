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

import bean.Category;
import bean.User;
import bo.CatBO;
import bo.UserBO;

/**
 * Servlet implementation class EditUserAdminAction
 */
public class EditUserAdminAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditUserAdminAction() {
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
		
		//kiểm tra đăng nhập
		HttpSession session = request.getSession();
		User userLogin = (User) session.getAttribute("userLogin");
		if(userLogin == null){
			response.sendRedirect(request.getContextPath()+"/admin/login");
			return;
		}
		
		UserBO userBO = new UserBO();
		int idUser = Integer.parseInt(request.getParameter("iduser"));
		User user = userBO.getUserDetail(idUser);
		request.setAttribute("user", user);
		String submit = request.getParameter("edituser");
		if (submit != null) {
			String oldPassword = request.getParameter("oldpassword");
			String newPassword = request.getParameter("newpassword");
			String fullName = new String(request.getParameter("fullname").getBytes("ISO-8859-1"),"UTF-8");
			if (oldPassword.equals(user.getPassword())) {
				//set lại password và fullname
				user.setPassword(newPassword);
				user.setFullName(fullName);
				if (userBO.editUser(user)) {
					out.print("Edit thành công");
					RequestDispatcher rd = request.getRequestDispatcher("list-user");
					rd.forward(request, response);
				} else {
					out.print("Edit ko thành công");
					RequestDispatcher rd = request.getRequestDispatcher("editUser.jsp?msg=Có lỗi trong quá trình thay đổi.");
					rd.forward(request, response);
				}
			} else {
				RequestDispatcher rd = request.getRequestDispatcher("editUser.jsp?msg= Mật khẩu cũ ko đúng");
				rd.forward(request, response);
			}
			
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("editUser.jsp");
			rd.forward(request, response);
		}
	}

}
