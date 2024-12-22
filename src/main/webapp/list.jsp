
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Driver"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

table {
	width: 80%;
	margin-top: 20px;
	border-collapse: collapse;
	background-color: #fff;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

th, td {
	padding: 12px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

th {
	background-color: #2196F3;
	color: white;
}

tr:hover {
	background-color: #f1f1f1;
}

a {
	text-decoration: none;
	padding: 6px 12px;
	border-radius: 4px;
	color: white;
	display: inline-block;
}

.update-link {
	background-color: #4CAF50;
}

.update-link:hover {
	background-color: #45a049;
}

.delete-link {
	background-color: #f44336;
}

.delete-link:hover {
	background-color: #e53935;
}
</style>
</head>
<body>
	<%!Connection con = null;
	Statement st = null;
	String url = "jdbc:mysql://localhost:3306/mydb";
	String username = "root";
	String password = "java";
	String query = "select * from book";%>
	<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	con = DriverManager.getConnection(url, username, password);
	st = con.createStatement();
	ResultSet rs = st.executeQuery(query);
	%>
	<h2 style="margin: 10px">Book List</h2>
	<table>
		<thead>
			<tr>
				<th>ISBN</th>
				<th>Book Name</th>
				<th>Update</th>
				<th>Delete</th>
			</tr>
		</thead>
		<tbody>

			<tr>
				<%
				while (rs.next()) {
				%>
			</tr>
			<tr>
				<td><%=rs.getString("isbn")%></td>
				<td><%=rs.getString("name")%></td>
				<td><a
					href="updateForm.jsp?isbn=<%=rs.getString("isbn")%>&name=<%=rs.getString("name")%>"
					class="update-link">Update</a>
				</td>
				<td><a
					href="delete.jsp?isbn=<%=rs.getString("isbn")%>"
					class="delete-link">Delete</a></td>
					
					
			</tr>
			<%
			}
			%>
		
</body>
</html>