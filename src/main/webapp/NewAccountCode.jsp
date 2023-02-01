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
String cpsw=request.getParameter("cpsw");
double amt=Double.parseDouble(request.getParameter("amt"));
String adr=request.getParameter("adr");
long mno=Long.parseLong(request.getParameter("mno"));
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","sdfc","sdfc");
PreparedStatement ps=con.prepareStatement("insert into account values(?,?,?,?,?,?,?)");
ps.setLong(1,acno);
ps.setString(2,name);
ps.setString(3,psw);
ps.setString(4,cpsw);
ps.setDouble(5,amt);
ps.setString(6,adr);
ps.setLong(7,mno);
int i=ps.executeUpdate();
out.print(i+"New Acoount Successfully Opened");
con.close();
}
    catch (Exception e)
  {
	out.print(e);
  }
%>

</body>
</html>