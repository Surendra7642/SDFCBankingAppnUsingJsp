<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>BALANCE</title>
<center>
<h1>SDFC BANK</h1>
</center>
&emsp;<img src="sdfc.jpg" width="250" height="50">
<center>
<h2>EXTRORDINARY SERVICES</h2>
</center>
<table  border="1">
<tr>
<th style="background-color:skyBlue;">
<a href ="home.jsp">Home</a>&emsp;&emsp;
<a href ="newaccount.jsp">New Account</a>&emsp;&emsp;
<a href ="deposite.jsp">Deposite</a>&emsp;&emsp;
<a href ="balance.jsp">Balance</a>&emsp;&emsp;
<a href ="withdraw.jsp">Withdraw</a>&emsp;&emsp;
<a href ="transfer.jsp">Transfer</a>&emsp;&emsp;
<a href ="closeact.jsp">Close A/C</a>&emsp;&emsp;
<a href ="about.jsp">Home</a>
</tr>
</th>
</table>
</center>
</head>
<body>
<center>
<table borderf="1">
<tr>
<th>
<h1 style="background-color:DodgerBlue;">BALANCE FORM</h1>
</th>
</tr>
</table>
<form action ="BalanceCode.jsp" method="post"><p></p>
Account No:<input type="text" name="acno"><p></p>
Name:<input type="text" name="name"><p></p>
Password :<input type="text" name="psw"><p></p>
<input type="submit" value="submit">&emsp;&emsp;
<input type="reset" value="clear">&emsp;
</form>
</center>
</body>
</html>