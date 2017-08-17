<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>paymentJsp</title>
</head>
<body>
<%@ page import="java.sql.*" %>>
<%@ page import="java.sql.*" %>>
<% 

		 	String custId = request.getParameter("cid");
	        String noOfBottles = request.getParameter("qty");
	        String subTotal = request.getParameter("sub");
	        String gst = request.getParameter("gst");
	        String amt = request.getParameter("amount");
	        String url="jdbc:mysql://127.0.0.1:3306/loginuser?autoReconnect=true&useSSL=false";
	        String username="root";
	        String password="jeevanmysql";

			try{
				Class.forName("com.mysql.jdbc.Driver");
				Connection conn = DriverManager.getConnection(url,username,password);
				/* String query="insert into neerdetails(CUSTOMER_ID,NO_OF_BOTTLES,SUB_TOTAL,GST,TOTAL) values(?,?,?,?,?) ";
				PreparedStatement stmt=conn.prepareStatement(query);  
				stmt.setString(1,custId.getText());
				stmt.setString(2,noOfBottles.getText());
				stmt.setString(3,subTotal.getText());
				stmt.setString(4,gst.getText());
				stmt.setString(5,amt.getText()); */
				//Statement st=conn.createStatement();
				
				Statement st=conn.createStatement(); 
				ResultSet rs;
				
				int i =st.executeUpdate("insert into neerdetails values('"+custId+"','"+noOfBottles+"','"+subTotal+"', '"+gst+"','"+amt+"')");
				
			
				out.print("Data added successfully");
				
			
				
				st.close();
				
			
			}catch(Exception e)
			
			{
				System.out.println(e);
			}
	
			
			


 %>
 
</body>
</html>