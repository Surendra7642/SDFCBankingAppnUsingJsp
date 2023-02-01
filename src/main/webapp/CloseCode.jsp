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
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","sdfc","sdfc");
	PreparedStatement ps=con.prepareStatement("delete from account where account_number=? and name=? and password=?");
	ps.setLong(1,acno);
	ps.setString(2,name);
	ps.setString(3,psw);
	int i=ps.executeUpdate();
	out.print(i+"welcome"+" "+name+" "+"your account"+" "+acno+" "+"has closed");
	con.close();
	
}

	catch (Exception e)
	{
		out.print(e);
	}
%>

</body>
</html>