<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="com.example.Book" %>
<%@ page import="com.example.FactoryProvider" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search Books</title>
    <style>
        /* Add your CSS styles here */
	       body {
	    font-family: Arial, sans-serif;
	    background-color: #f7f7f7;
	    margin: 0;
	    padding: 0;
		}
		
		h1 {
		    color: #333;
		    text-align: center;
		}
		
		form {
		    text-align: center;
		    margin-top: 20px;
		}
		
		form input[type="text"] {
		    padding: 10px;
		    width: 300px;
		    border-radius: 5px;
		    border: 1px solid #ccc;
		    margin-right: 10px;
		}
		
		form input[type="submit"] {
		    padding: 10px 20px;
		    background-color: #007bff;
		    color: #fff;
		    border: none;
		    border-radius: 5px;
		    cursor: pointer;
		}
		
		form input[type="submit"]:hover {
		    background-color: #0056b3;
		}
		
		.container {
		    text-align: center;
		    margin-top: 20px;
		}
		
		table {
		    width: 90%;
		    margin: 20px auto;
		    border-collapse: collapse;
		    background-color: #fff;
		}
		
		th, td {
		    border: 1px solid #ccc;
		    padding: 8px;
		    text-align: left;
		}
		
		th {
		    background-color: #f2f2f2;
		}
		
		.btn {
		    background-color: #007bff;
		    color: #fff;
		    padding: 10px 20px;
		    border: none;
		    border-radius: 5px;
		    text-decoration: none;
		}
		
		.btn:hover {
		    background-color: #0056b3;
		}

    </style>
</head>
<body>
    <h1>Search Books</h1>
    
    <form action="searchBook.jsp" method="get">
        <label for="title">Title:</label>
        <input type="text" name="title" />
        <input type="submit" value="Search" />
    </form>

    <% 
        String title = request.getParameter("title");
        
        if (title != null && !title.isEmpty()) {
            Session searchSession = FactoryProvider.getFactory().openSession();
            try {
                searchSession.beginTransaction();
                List<Book> books = searchSession.createQuery("from Book where title like :title")
                                            .setParameter("title", "%" + title + "%")
                                            .getResultList();
                searchSession.getTransaction().commit();
                
                if (!books.isEmpty()) {
    %>
                    <table>
                        <tr>
                            <th>Id</th>
                            <th>Title</th>
                            <th>Author</th>
                            <th>ISBN</th>
                            <th>Genre</th>
                            <th>Copies Available</th>
                        </tr>
                        
                        <% for (Book book : books) { %>
                            <tr>
                                <td><%= book.getId() %></td>
                                <td><%= book.getTitle() %></td>
                                <td><%= book.getAuthor() %></td>
                                <td><%= book.getIsbn() %></td>
                                <td><%= book.getGenre() %></td>
                                <td><%= book.getNumCopies() %></td>
                            </tr>
                        <% } %>
                    </table>
    <%          } else { %>
                    <p>No books found with the title <%= title %>.</p>
    <%          }
            } finally {
                if (searchSession != null && searchSession.isOpen()) {
                    searchSession.close();
                }
            }
        }
    %>
    
    <div class="container">
        <a href="index.jsp" class="btn">Home</a>
    </div>
</body>
</html>