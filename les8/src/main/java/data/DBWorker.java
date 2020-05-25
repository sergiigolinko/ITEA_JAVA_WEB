package data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Product;

public class DBWorker {

	private final static String SELECT_ALL="SELECT * FROM products";
	private final static String ID_FORM="SELECT * FROM products WHERE id=?";
	private final static String GET_CATEGORY="SELECT * FROM products WHERE category=?";
	
	public List<Product> getProducts() {
		List<Product> productList=new ArrayList<Product>();
		
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		Connection conn = null;

		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost/myShop?" + "user=root&password=");

		} catch (SQLException ex) {
			ex.printStackTrace();
		}

		Statement stmt = null;
		ResultSet rs=null;
		

		try {
			stmt=conn.createStatement();
			rs = stmt.executeQuery(SELECT_ALL);
			while(rs.next()) {
				Product product=new Product();
				product.setId(rs.getInt("id"));
				product.setName(rs.getString("name"));
				product.setPrice(rs.getInt("price"));
				product.setDescription(rs.getString("description"));
				product.setCategory(rs.getString("category"));
				productList.add(product);
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		} finally {
			if(rs!=null) {
				try {
					rs.close();
				}catch (SQLException ex) {
					ex.printStackTrace();
			}
				rs=null;
			}
			
			if(stmt!=null) {
				try {
					stmt.close();
				}catch (SQLException ex) {
					ex.printStackTrace();
			}
				stmt=null;
			}
			try {
				conn.close();
			}catch (SQLException ex) {
				ex.printStackTrace();
		}
	}
		return productList;
	
}

	public Product getProduct(int id) {

			Product product=null;
			
			try {
				Class.forName("com.mysql.jdbc.Driver").newInstance();
			} catch (Exception ex) {
				ex.printStackTrace();
			}

			Connection conn = null;

			try {
				conn = DriverManager.getConnection("jdbc:mysql://localhost/myShop?" + "user=root&password=");

			} catch (SQLException ex) {
				ex.printStackTrace();
			}

			PreparedStatement stmt = null;
			ResultSet rs=null;
			

			try {
				stmt=conn.prepareStatement(ID_FORM);
				stmt.setInt(1, id);
				rs = stmt.executeQuery();
				if(rs.next()) {
					product=new Product();
					product.setId(rs.getInt("id"));
					product.setName(rs.getString("name"));
					product.setPrice(rs.getInt("price"));
					product.setDescription(rs.getString("description"));
					product.setCategory(rs.getString("category"));
					
				}
			} catch (SQLException ex) {
				ex.printStackTrace();
			} finally {
				if(rs!=null) {
					try {
						rs.close();
					}catch (SQLException ex) {
						ex.printStackTrace();
				}
					rs=null;
				}
				
				if(stmt!=null) {
					try {
						stmt.close();
					}catch (SQLException ex) {
						ex.printStackTrace();
				}
					stmt=null;
				}
				try {
					conn.close();
				}catch (SQLException ex) {
					ex.printStackTrace();
			}
		}
			return product;
		
	}
		

	public List<Product> getProductsCategory(String category) {
		List<Product> productList=new ArrayList<Product>();
		
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		Connection conn = null;

		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost/myShop?" + "user=root&password=");

		} catch (SQLException ex) {
			ex.printStackTrace();
		}

		PreparedStatement stmt = null;
		ResultSet rs=null;
		

		try {
			stmt=conn.prepareStatement(GET_CATEGORY);
			stmt.setString(1, category);
			rs = stmt.executeQuery();
			if(rs.next()) {
				Product product=new Product();
				product.setId(rs.getInt("id"));
				product.setName(rs.getString("name"));
				product.setPrice(rs.getInt("price"));
				product.setDescription(rs.getString("description"));
				product.setCategory(rs.getString("category"));
				productList.add(product);
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		} finally {
			if(rs!=null) {
				try {
					rs.close();
				}catch (SQLException ex) {
					ex.printStackTrace();
			}
				rs=null;
			}
			
			if(stmt!=null) {
				try {
					stmt.close();
				}catch (SQLException ex) {
					ex.printStackTrace();
			}
				stmt=null;
			}
			try {
				conn.close();
			}catch (SQLException ex) {
				ex.printStackTrace();
		}
	}
		return productList;
	
}
	
	public static void main(String[] args ) {
		
		System.out.println(new DBWorker().getProductsCategory("TennisBalls"));
	}
}
