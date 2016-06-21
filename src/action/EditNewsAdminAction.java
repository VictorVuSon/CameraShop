package action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;

import bean.Category;
import bean.IsProduct;
import bean.Products;
import bean.User;
import bo.CatBO;
import bo.IsProductBO;
import bo.ProductBO;

/**
 * Servlet implementation class EditNewsAdminAction
 */
public class EditNewsAdminAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditNewsAdminAction() {
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
		
		ProductBO newsBO = new ProductBO();
		CatBO catBO = new CatBO();
		IsProductBO isProductBO = new IsProductBO();
		int idNews = Integer.parseInt(request.getParameter("idnews"));
		Products productDetail = newsBO.getDetail(idNews);
		
		String type = request.getParameter("type");
		if("load".equals(type)){
			ArrayList<IsProduct>listIsProduct = isProductBO.getListIsProduct();
			ArrayList<Category> listCat =  catBO.getListCat();
			request.setAttribute("productDetail", productDetail);
			request.setAttribute("listCat", listCat);
			request.setAttribute("listIsProduct", listIsProduct);
			RequestDispatcher rd = request.getRequestDispatcher("editNews.jsp");
			rd.forward(request, response);
		}else {
			Products news = new Products();
			String name_product="";
			String preview_text="";
			String detail="";
			String photo_product="";
			int idCat=0;
			int price=0;
			int isProduct = 0;
			
			// lấy tất cả các phần tử của form
			DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(fileItemFactory);
			try {
				List<FileItem> formitems = upload.parseRequest(request);
				for (FileItem fileItem : formitems) {
					if (fileItem.isFormField()) {// khác file
						String name = fileItem.getFieldName();
						String value = new String(fileItem.getString().getBytes("ISO-8859-1"), "UTF-8");
						//lấy từng giá trị của form
						switch(name){
							case "tentin": name_product = value; break; 
							case "danhmuc": idCat = Integer.parseInt(value); break; 
							case "mota": preview_text = value; break; 
							case "chitiet": detail = value; break; 
							case "price" : price = Integer.parseInt(value) ; break;
							case "isProduct" : isProduct = Integer.parseInt(value);
						}
					} else { // là file
						String filename = fileItem.getName();
						if (filename.isEmpty()) {
							photo_product = productDetail.getPhotoProduct();
						} else {
							// đổi tên file
							String ext = FilenameUtils.getExtension(filename);
							long time = System.nanoTime();// lấy thời gian
							photo_product = "Camera-" + time + "." + ext;

							// tạo thư mục upload file
							String uploadDir = request.getServletContext().getRealPath("") + java.io.File.separator
									+ "files";
							File dir = new File(uploadDir);
							if (!dir.exists()) {
								dir.mkdirs();
							}
							//out.println(uploadDir);
							// tạo đường dẫn thực đến file trên đĩa.
							String RealPathFile = uploadDir + File.separator + photo_product;
							// File.separator = \
							// upload file lên ổ đĩa
							File file = new File(RealPathFile);
							fileItem.write(file);
						}
						

					}
				}
			} catch (FileUploadException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			news.setIdProduct(idNews);
			news.setNameProduct(name_product);
			news.setPreviewText(preview_text);
			news.setDetail(detail);
			news.setIdCat(idCat);
			news.setPrice(price);
			news.setPhotoProduct(photo_product);
			news.setIsProduct(isProduct);
			if(newsBO.editNews(news)){
				response.sendRedirect("list-news");
			} else {
				RequestDispatcher rd = request.getRequestDispatcher("addNews.jsp?msg=Có lỗi trong quá trình sửa ");
				rd.forward(request, response);
			}
		}
		
	}

}
