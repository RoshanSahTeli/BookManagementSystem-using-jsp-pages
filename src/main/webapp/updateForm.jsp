<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Book</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;	
        }
        
        .container {
            width: 50%;
            margin: 50px auto;
            padding: 20px;
            background-color: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        
        h2 {
            text-align: center;
            color: #333;
        }
        
        label {
            font-weight: bold;
            margin-bottom: 8px;
            display: block;
            color: #555;
        }
        
        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
        }

        .back-link a {
            text-decoration: none;
            color: #007bff;
            font-size: 16px;
        }

        .back-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Update Book Information</h2>

        <!-- Form for updating book information -->
        <form action="update.jsp" method="POST">
            <label for="isbn">ISBN:</label>
            <input type="text" id="isbn" name="isbn" value="<%= request.getParameter("isbn") %>" readonly/><br>

            <label for="name">Book Name:</label>
            <input type="text" id="name" name="name" value="<%= request.getParameter("name") != null ? request.getParameter("name") : "" %>" required/><br>
            <input type="submit" value="Update Book">
        </form>

        <div class="back-link">
            <a href="list.jsp">Back to Book List</a>
        </div>
    </div>

</body>
</html>
