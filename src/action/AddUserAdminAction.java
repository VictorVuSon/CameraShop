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

import bean.User;
import bo.CatBO;
import bo.UserBO;

/**
 * Servlet implementation class AddCatAdminAction
 */
public class AddUserAdminAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddUserAdminAction() {
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
			String username = new String(request.getParameter("username").getBytes("ISO-8859-1"),"UTF-8");
			String password = new String(request.getParameter("password").getBytes("ISO-8859-1"),"UTF-8");
			String repassword = new String(request.getParameter("repassword").getBytes("ISO-8859-1"),"UTF-8");
			String fullname = new String(request.getParameter("fullname").getBytes("ISO-8859-1"),"UTF-8");
			String phone = new String(request.getParameter("phone").getBytes("ISO-8859-1"),"UTF-8");
			String address = new String(request.getParameter("address").getBytes("ISO-8859-1"),"UTF-8");
			String email = new String(request.getParameter("email").getBytes("ISO-8859-1"),"UTF-8");
			User user = null;
			UserBO userBO = new UserBO();
			//kiểm tra user đúng định dạng
			int check = 0;
			if(username.matches("[a-zA-Z0-9_]+")){
				ArrayList<User> lisUser = userBO.getListUser();
				for (User user2 : lisUser) {
					if (username.equals(user2.getUserName())) {
						RequestDispatcher rd = request.getRequestDispatcher("addUser.jsp?msg=Username đã bị trùng ");
						rd.forward(request, response);
					} else {
						check = 1;
					}
				}
			}else {
				RequestDispatcher rd = request.getRequestDispatcher("addUser.jsp?msg=Vui lòng nhập đúng định dạng user ");
				rd.forward(request, response);
			}
			if (check==1) {
				user = new User(0, username, password, 1, fullname, phone, address, email);
				if(userBO.addUser(user)){
					RequestDispatcher rd = request.getRequestDispatcher("list-user");
					rd.forward(request, response);
				} else {
					RequestDispatcher rd = request.getRequestDispatcher("admin/addUser.jsp?msg=Có lỗi trong quá trình xử lý ");
					rd.forward(request, response);
				}
			} 
			
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("addUser.jsp");
			rd.forward(request, response);
		}
	}

}
