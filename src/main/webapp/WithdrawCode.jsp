<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import="java.sql.*" %>
<%
try
{
	long acno=Long.parseLong(request.getParameter("acno"));
	String name=request.getParameter("name");
	String psw=request.getParameter("psw");
	double amt=Double.parseDouble(request.getParameter("amt"));
	double temp= amt;
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","sdfc","sdfc");
	PreparedStatement ps=con.prepareStatement("select amount from account where account_number=? and name=? and password=?");
	ps.setLong(1,acno);
	ps.setString(2,name);
	ps.setString(3,psw);
	ResultSet rs=ps.executeQuery();
	if(rs.next())
	{
	    amt =amt-rs.getDouble(1);
		out.print("<h3> Your amount has been debited  "+temp+"</h3>");
		out.print("<h3> Your account balance is  "+amt+"</h3>");
		out.print("<h1><b>Thank you -> Visit Again SDFC</b></h1>");
		PreparedStatement ps1=con.prepareStatement("update account set amount=? where account_number=? and name=? and password=?");
		ps1.setDouble(1,amt);
		ps1.setLong(2,acno);
		ps1.setString(3,name);
		ps1.setString(4,psw);
		ps1.executeUpdate();
		con.close();
	}
	else
	{
		out.print("You are entered invalid details");
	}

}

	catch (Exception e)
	{
		out.print(e);
	}
%>

</body>
