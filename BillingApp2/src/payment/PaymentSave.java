package payment;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PaymentSave extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 resp.setContentType("text/html");
		 PrintWriter out=resp.getWriter();
		 
		 	String custId = req.getParameter("cid");
	        String noOfBottles = req.getParameter("qty");
	        String subTotal = req.getParameter("sub");
	        String gst = req.getParameter("gst");
	        String amt = req.getParameter("amount");
	        String url="jdbc:mysql://127.0.0.1:3306/loginuser?autoReconnect=true&useSSL=false";
	        String username="root";
	        String password="jeevanmysql";

			try{
				 Class.forName("com.mysql.jdbc.Driver");
				Connection conn = DriverManager.getConnection(url,username,password);
				String query="insert into neerdetails (CUSTOMER_ID,NO_OF_BOTTLES,SUB_TOTAL,GST,TOTAL) values(?,?,?,?,?) ";
				PreparedStatement stmt=conn.prepareStatement(query);  
				stmt.setString(1,custId);
				stmt.setString(2,noOfBottles);
				stmt.setString(3,subTotal);
				stmt.setString(4,gst);
				stmt.setString(5,amt);
				
				int i=stmt.executeUpdate();  
			if(i>0){
				
					out.print("Data added successfully");
			}
				
				
				stmt.close();
				
			
			}catch(Exception e)
			
			{
				System.out.println(e);
			}
	}
}
