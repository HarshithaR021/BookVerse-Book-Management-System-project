
<%@ page import="java.util.ArrayList" %>
<%@ page import="Beans.BookBean" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    ArrayList<BookBean> books =
        (ArrayList<BookBean>) session.getAttribute("AllBooks");

    if (books == null) {
        books = new ArrayList<>();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>BookVerse - All Books</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #fffaf1;
            margin: 0;
            padding: 30px;
            color: #101c2d;
        }

        h1 {
            text-align: center;
            color: #101c2d;
        }

        table {
            width: 85%;
            margin: 30px auto;
            border-collapse: collapse;
            background: white;
        }

        th, td {
            padding: 15px;
            border: 1px solid #ddd;
            text-align: center;
        }

        th {
            background: #101c2d;
            color: white;
        }

        tr:nth-child(even) {
            background: #f5f0e7;
        }

        a {
            display: inline-block;
            margin: 10px;
            padding: 12px 20px;
            background: #101c2d;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }

        .buttons {
            text-align: center;
        }
    </style>
</head>

<body>

<h1>BookVerse - All Books</h1>

<table>
    <tr>
        <th>Book ID</th>
        <th>Book Name</th>
        <th>Book Price</th>
    </tr>

    <% if (books.isEmpty()) { %>
        <tr>
            <td colspan="3">No Books Available</td>
        </tr>
    <% } else { %>

        <% for (BookBean book : books) { %>
            <tr>
                <td><%= book.getBookId() %></td>
                <td><%= book.getBookName() %></td>
                <td>₹<%= book.getBookPrice() %></td>
            </tr>
        <% } %>

    <% } %>
</table>

<div class="buttons">
    <a href="index.html">Back to Home</a>
    <a href="AddBook.html">Add New Book</a>
</div>

</body>
</html>
