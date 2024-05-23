<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Library Management</title>
    <style>
    /* Add your CSS styles here */
    body {
        font-family: Arial, sans-serif;
        background-color: #f7f7f7; /* Updated background color */
        margin: 0;
        padding: 0;
    }
    h1 {
        color: #333;
        text-align: center;
        padding: 20px 0;
        background-color: #007bff;
        color: #fff;
        margin: 0;
    }
    .operation-links {
        text-align: center;
        margin-top: 20px;
    }
    .operation-links a {
        margin: 0 10px;
        text-decoration: none;
        padding: 10px 20px;
        background-color: #28a745; /* Updated button background color */
        color: #fff; /* Updated button text color */
        border: 1px solid #218838; /* Updated button border color */
        border-radius: 5px;
        transition: background-color 0.3s;
    }
    .operation-links a:hover {
        background-color: #218838; /* Updated button hover background color */
    }
</style>

</head>
<body>
    <h1>Library Management</h1>
    
    <div class="operation-links">
        <s:a href="addBook.jsp">Add Book</s:a>
        <s:a href="displayBooks.jsp">Display Books</s:a>
        <s:a href="updateBook.jsp">Update Book</s:a>
        <s:a href="deleteBook.jsp">Delete Book</s:a>
        <s:a href="searchBook.jsp">Search Book</s:a>
    </div>
</body>
</html>
