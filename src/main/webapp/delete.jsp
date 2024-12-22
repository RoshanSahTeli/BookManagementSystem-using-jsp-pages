<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%!Connection con = null;
	PreparedStatement ps = null;
	String url = "jdbc:mysql://localhost:3306/mydb";
	String username = "root";
	String password = "java";
	String query = "delete from book where isbn=?";%>
	<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	con = DriverManager.getConnection(url, username, password);
	ps = con.prepareStatement(query);
	ps.setString(1, request.getParameter("isbn"));
	int row=ps.executeUpdate();
	if(row>0){
		response.sendRedirect("list.jsp");
	}
	else{
		%>
		<h1 style="text-align: center; color: red;">Deletion Failed</h1><%
	}
	%>
</body>
</html>