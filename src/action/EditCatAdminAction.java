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

/**
 * Servlet implementation class EditCatAdminAction
 */
public class EditCatAdminAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditCatAdminAction() {
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
		
		int idCat = Integer.parseInt(request.getParameter("idcat"));
		CatBO catBO = new CatBO();
		Category cat = catBO.getCatDetail(idCat);
		String submit = request.getParameter("editcat");
		if (submit != null) {
			String nameCat = new String(request.getParameter("namecat").getBytes("ISO-8859-1"),"UTF-8");
			cat.setNameCat(nameCat);
			if (catBO.editCat(cat)) {
				response.sendRedirect("list-cat");
			}else {
				RequestDispatcher rd = request.getRequestDispatcher("admin/editCat.jsp?msg=Có lỗi trong quá trình xử lý ");
				rd.forward(request, response);
			}
		} else {
			request.setAttribute("cat", cat);
			RequestDispatcher rd = request.getRequestDispatcher("editCat.jsp");
			rd.forward(request, response);
		}
	}

}
