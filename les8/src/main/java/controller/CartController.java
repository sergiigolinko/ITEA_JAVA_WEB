package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import data.DBWorker;
import model.Product;


public class CartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String CART="CART";
       
    
    public CartController() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      Map<Product,Integer> listProduct;
       request.setAttribute("imgHeight", "100px");
		
		HttpSession session=request.getSession();
		
		if(session.getAttribute(CART)!=null) {
			listProduct=(Map) session.getAttribute(CART);
		}else {
			listProduct=new HashMap<Product,Integer>();
		}
		
		
		request.setAttribute("listProducts", listProduct);
		RequestDispatcher rd=request.getRequestDispatcher("/WEB-INF/views/Cart.jsp");
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DBWorker worker=new DBWorker();
		Map<Product,Integer> productsMap=new HashMap<Product,Integer>();
		
		HttpSession session=request.getSession();
		
		if(session.getAttribute(CART)!=null) {
			productsMap=(Map) session.getAttribute(CART);
		}
		Product product=worker.getProduct(Integer.valueOf(request.getParameter("productId")));
		Integer countProducts=Integer.valueOf(request.getParameter("productQnt"));
		if(productsMap.containsKey(product)) {
			productsMap.put(product,
					productsMap.get(product)+countProducts);
		}else {
			productsMap.put(product,countProducts);
		}
		
		
		session.setAttribute(CART, productsMap);
		int qnt=productsMap.size();
		PrintWriter out=response.getWriter();
		out.write(""+qnt);
		
		
		//response.sendRedirect("/les8/products");
		
	}	
}
