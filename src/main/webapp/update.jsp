<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%!Connection con = null;
	PreparedStatement ps = null;
	String url = "jdbc:mysql://localhost:3306/mydb";
	String username = "root";
	String password = "java";
	String query = "update book set name=? where isbn=?";%>
	<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	con = DriverManager.getConnection(url, username, password);
	ps = con.prepareStatement(query);
	ps.setString(1, request.getParameter("name"));
	ps.setString(2, request.getParameter("isbn"));
	
	int row=ps.executeUpdate();
	if(row>0){
		response.sendRedirect("list.jsp");
	}
	else{
		%>
		<h1 style="text-align: center; color: red;">Updation Failed</h1><%
	}
	%>
</body>
</html>