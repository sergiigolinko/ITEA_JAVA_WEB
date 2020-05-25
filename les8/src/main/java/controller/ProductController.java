package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import data.DBWorker;
import model.Product;

/**
 * Servlet implementation class ProductController
 */
public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DBWorker worker=new DBWorker();
		List<Product> listProduct=worker.getProducts();
		
		if(request.getParameter("category")!=null) {
			listProduct=worker.getProductsCategory(request.getParameter("category"));
		}
		request.setAttribute("imgHeight", "100px");
		request.setAttribute("listProducts", listProduct);
		RequestDispatcher rd=request.getRequestDispatcher("/WEB-INF/views/Products.jsp");
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idProduct=Integer.valueOf(request.getParameter("idProduct"));
		request.setAttribute("imgHeight", "200px");
		DBWorker worker=new DBWorker();
		Product listProduct=worker.getProduct(idProduct);
		request.setAttribute("listProducts", listProduct);
		RequestDispatcher rd=request.getRequestDispatcher("/WEB-INF/views/Products.jsp");
		rd.forward(request, response);
	}

}
