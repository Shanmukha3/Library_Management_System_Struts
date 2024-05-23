<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.util.List" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="com.example.Book" %>
<%@ page import="com.example.FactoryProvider" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Book</title>
    <style>
        /* Add your CSS styles here */
        body {
            font-family: Arial, sans-serif;
        }
        h1 {
            color: #333;
        }
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        form {
            width: 50%;
            margin: 20px auto;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        input {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
        }
        button {
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<h1>List of Books</h1>
    
    <table>
        <tr>
        	<th>Id</th>
            <th>Title</th>
            <th>Author</th>
            <th>ISBN</th>
            <th>Genre</th>
            <th>Copies Available</th>
        </tr>
        
        <% 
   
            Session session1 = FactoryProvider.getFactory().openSession();
            
            try {
                session1.beginTransaction();
                List<Book> books = session1.createQuery("from Book").getResultList();
                
                for (Book book : books) {
        %>
                <tr>
                	<td><%= book.getId() %></td>
                    <td><%= book.getTitle() %></td>
                    <td><%= book.getAuthor() %></td>
                    <td><%= book.getIsbn() %></td>
                    <td><%= book.getGenre() %></td>
                    <td><%= book.getNumCopies() %></td>
                </tr>
        <%
                }
                session1.getTransaction().commit();
            } finally {
                if (session1 != null && session1.isOpen()) {
                    session1.close();
                }
            }
        %>
        <div class="container text-center mt-2">
        	<a href="index.jsp" class="btn btn-primary">Home</a>
        </div>
    </table>
    
    <h1>Update Book</h1>
    
    <form action="UpdateBookAction" method="post">
        <label for="id">Book ID:</label>
        <input type="text" id="id" name="id" placeholder="Enter Book ID" required />

        <label for="title">Title:</label>
        <input type="text" id="title" name="book.title" placeholder="Enter Title" required />

        <label for="author">Author:</label>
        <input type="text" id="author" name="book.author" placeholder="Enter Author" required />

        <label for="isbn">ISBN:</label>
        <input type="text" id="isbn" name="book.isbn" placeholder="Enter ISBN" required />

        <label for="genre">Genre:</label>
        <input type="text" id="genre" name="book.genre" placeholder="Enter Genre" required />

        <label for="numCopies">Copies Available:</label>
        <input type="text" id="numCopies" name="book.numCopies" placeholder="Enter Copies Available" required />

        <button type="submit">Update Book</button>
    </form>
</body>
</html>
