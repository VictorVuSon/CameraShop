package action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
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
 * Servlet implementation class AddNewsAdminAction
 */
public class AddNewsAdminAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddNewsAdminAction() {
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
		IsProductBO isproductBO = new IsProductBO();
		// lấy list cat
		ArrayList<Category> listCat = catBO.getListCat();
		request.setAttribute("listCat", listCat);
		ArrayList<IsProduct> listIsProduct = isproductBO.getListIsProduct();
		request.setAttribute("listIsProduct", listIsProduct);
		String load = request.getParameter("type");// kiểm tra xem trường hợp thêm vào, hay load trang addNews.jsp,biến type truyền từ trang indexNews.jsp
		if ("load".equals(load)) { 
			//out.print("đã vào đc đây!<br>"); 
			Products product = new Products();
			String nameProduct="";
			String previewText="";
			String detail="";
			String photo_product="";
			int price = 0;
			int idIsProduct = 0;
			int idCat=0;
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
							case "tentin": nameProduct = value; break; 
							case "mota": previewText = value; break; 
							case "chitiet": detail = value; break; 
							case "danhmuc": idCat = Integer.parseInt(value); break;
							case "price" : price = Integer.parseInt(value); break;
							case "isProduct" : idIsProduct = Integer.parseInt(value); break;
						}
					} else { // là file
						String filename = fileItem.getName();
						// đổi tên file
						if(fileItem != null){
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
//							out.println(uploadDir);
							// tạo đường dẫn thực đến file trên đĩa.
							String RealPathFile = uploadDir + File.separator + photo_product;

							// upload file lên ổ đĩa
							File file = new File(RealPathFile);
							fileItem.write(file);
						} else {
							photo_product = "";
						}
						
						//xóa file
					}
				}
			} catch (FileUploadException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			product.setNameProduct(nameProduct);;
			product.setPreviewText(previewText);
			product.setDetail(detail);
			product.setIdCat(idCat);
			product.setPhotoProduct(photo_product);
			product.setPrice(price);
			product.setIsProduct(idIsProduct);
			
			if(newsBO.addNews(product)){
				response.sendRedirect("list-news");
			} else {
				RequestDispatcher rd = request.getRequestDispatcher("addNews.jsp?msg=Có lỗi trong quá trình thêm ");
				rd.forward(request, response);
			}
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("addNews.jsp");
			rd.forward(request, response);
		}
	}

}
