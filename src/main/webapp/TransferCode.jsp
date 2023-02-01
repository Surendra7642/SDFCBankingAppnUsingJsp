<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Target_account</title>
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

try
{
	long acno=Long.parseLong(request.getParameter("acno"));
	String name=request.getParameter("name");
	String psw=request.getParameter("psw");
	long Target_account=Long.parseLong(request.getParameter("tano"));
	double amt=Double.parseDouble(request.getParameter("amt"));
	double temp=amt;
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","sdfc","sdfc");
	PreparedStatement ps=con.prepareStatement("select amount from account where account_number=?");
	ps.setLong(1,acno);
	ResultSet rs=ps.executeQuery();
	PreparedStatement ps1=con.prepareStatement("select amount from account where account_number=?");
	ps1.setLong(1,Target_account);
	ResultSet rs1=ps1.executeQuery();
	if(rs.next()&&rs1.next())
	{
		if(amt>rs.getDouble(1))
		{
			amt=rs.getDouble(1)-amt;
			out.print("<h3> Your amount transfered Successfully..."+temp+"</h3>");
			out.print("<h3> Your account balance is"+amt+"</h3>");
			PreparedStatement ps2=con.prepareStatement("update account set amount=? where account_number=?");
			ps2.setDouble(1,amt);
			ps2.setLong(2,Target_account);
			int i=ps2.executeUpdate();
			out.println(i+"New record updated");
			amt=amt+rs1.getDouble(1);
			PreparedStatement ps3=con.prepareStatement("update account set amount=? where account_number=?");
			ps3.setDouble(1,amt);
			ps3.setLong(2,Target_account);
			int i1=ps3.executeUpdate();
			out.println(i1+"New record updated");
		}
		
	}
	else
	{
		out.print("<h3> You are entered invalid dettails"+"</h3>");
	
	}
	
	con.close();
}
catch (Exception e)
{
	out.print(e);
}
%>

</body>
