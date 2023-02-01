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
	PreparedStatement ps=con.prepareStatement("select amount from account where name=? and password=? and account_number=?");
	ps.setString(1,name);
	ps.setString(2,psw);
	ps.setLong(3,acno);
    ResultSet rs=ps.executeQuery();
    ResultSetMetaData rsmd=rs.getMetaData();
    out.print("<table border='1'>");
    int n=rsmd.getColumnCount();
    for (int i=1;i<=n;i++)
    	out.println("<td><font color=blue size=3>"+"<br>"+rsmd.getColumnName(i));
    out.println("<tr>"+"Welcome "+name);
    while(rs.next())
	{
    	for(int i=1;i<=n;i++)
    		out.println("<td>+<br>"+rs.getString(i));
    	out.print("<tr>");
	}
    out.println("</table></body></html>");
    con.close();
		
}
catch (Exception e)
{
	out.print(e);		
}
%>



</body>
</html>