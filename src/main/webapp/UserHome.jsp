
<%@ page import="java.util.ArrayList" %>
<%@ page import="Beans.UserBean" %>
<%@ page import="Beans.BookBean" %>
<%@ page import="BookDAO.BookDataBaseOperation" %>

<%
    UserBean user = (UserBean) session.getAttribute("UserDetails");

    if (user == null) {
        response.sendRedirect("UserLogin.jsp");
        return;
    }

    ArrayList<BookBean> books =
            new BookDataBaseOperation().retriveBookData();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BookVerse | User Dashboard</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;600;700&family=Playfair+Display:wght@600;700&display=swap" rel="stylesheet">

    <style>
        :root {
            --navy: #101c2d;
            --gold: #e8bb72;
            --cream: #fffaf1;
            --light: #f6f3ec;
        }

        body {
            margin: 0;
            background: var(--light);
            font-family: 'DM Sans', sans-serif;
            color: var(--navy);
        }

        .navbar {
            background: var(--navy);
            padding: 16px 0;
        }

        .navbar-brand {
            color: var(--gold);
            font-family: 'Playfair Display', serif;
            font-size: 27px;
            font-weight: bold;
        }

        .navbar-brand:hover {
            color: var(--gold);
        }

        .nav-link {
            color: white;
            margin-left: 18px;
        }

        .nav-link:hover {
            color: var(--gold);
        }

        .welcome-section {
            background: var(--navy);
            color: white;
            padding: 55px 0;
        }

        .welcome-section h1 {
            font-family: 'Playfair Display', serif;
            font-size: 38px;
        }

        .welcome-section span {
            color: var(--gold);
        }

        .section-title {
            font-family: 'Playfair Display', serif;
            font-size: 32px;
            font-weight: bold;
        }

        .book-card {
            background: white;
            border: none;
            border-radius: 14px;
            padding: 25px;
            height: 100%;
            box-shadow: 0 5px 20px rgba(16, 28, 45, 0.07);
            transition: 0.3s;
        }

        .book-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(16, 28, 45, 0.12);
        }

        .book-icon {
            font-size: 42px;
            color: #bd8c43;
            margin-bottom: 15px;
        }

        .book-id {
            color: #888;
            font-size: 13px;
        }

        .book-name {
            font-family: 'Playfair Display', serif;
            font-size: 21px;
            font-weight: bold;
            margin: 10px 0;
        }

        .book-price {
            font-size: 20px;
            font-weight: bold;
            color: #bd8c43;
            margin-bottom: 20px;
        }

        .btn-buy {
            background: var(--navy);
            color: white;
            border-radius: 7px;
            padding: 9px 16px;
            border: 1px solid var(--navy);
        }

        .btn-buy:hover {
            background: #243a56;
            color: white;
        }

        .btn-cart {
            background: var(--gold);
            color: var(--navy);
            border-radius: 7px;
            padding: 9px 16px;
            border: 1px solid var(--gold);
        }

        .btn-cart:hover {
            background: #d5a85e;
            color: var(--navy);
        }

        .empty-message {
            background: white;
            padding: 40px;
            border-radius: 12px;
            text-align: center;
        }

        footer {
            background: var(--navy);
            color: #ddd;
            padding: 22px;
            text-align: center;
            margin-top: 60px;
        }

        @media (max-width: 576px) {
            .welcome-section h1 {
                font-size: 29px;
            }
        }
    </style>
</head>

<body>

<nav class="navbar navbar-expand-lg">
    <div class="container">
        <a class="navbar-brand" href="index.html">
            <i class="bi bi-book-half"></i> BookVerse
        </a>

        <button class="navbar-toggler bg-light" type="button"
                data-bs-toggle="collapse" data-bs-target="#navbarMenu">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarMenu">
            <div class="navbar-nav ms-auto">
                <a class="nav-link" href="#books">Explore Books</a>
                <a class="nav-link" href="MyPurchases.jsp">
                    <i class="bi bi-bag"></i> My Purchases
                </a>
                <a class="nav-link" href="Cart.jsp">
                    <i class="bi bi-cart3"></i> My Cart
                </a>
                <a class="nav-link" href="UserLogout">
                    <i class="bi bi-box-arrow-right"></i> Logout
                </a>
            </div>
        </div>
    </div>
</nav>

<section class="welcome-section">
    <div class="container">
        <h1>Welcome back, <span><%= user.getUserName() %>!</span></h1>
        <p class="mt-3 mb-0">
            Discover your next favourite book. Every book opens a new world.
        </p>
    </div>
</section>

<section class="container py-5" id="books">

    <div class="d-flex justify-content-between align-items-center flex-wrap mb-4">
        <div>
            <h2 class="section-title">Explore Our Collection</h2>
            <p class="text-secondary">Find the perfect book for your next reading journey.</p>
        </div>
    </div>

    <div class="row g-4">

        <%
            if (books != null && !books.isEmpty()) {
                for (BookBean book : books) {
        %>

        <div class="col-sm-6 col-lg-4">
            <div class="book-card">

                <div class="book-icon">
                    <i class="bi bi-book"></i>
                </div>

                <div class="book-id">
                    BOOK ID: <%= book.getBookId() %>
                </div>

                <div class="book-name">
                    <%= book.getBookName() %>
                </div>

                <div class="book-price">
                    ₹ <%= book.getBookPrice() %>
                </div>

                <div class="d-flex flex-wrap gap-2">

                    <form action="BuyBook" method="post">
                        <input type="hidden" name="bookId"
                               value="<%= book.getBookId() %>">
                        <button type="submit" class="btn btn-buy">
                            <i class="bi bi-bag-check"></i> Buy Now
                        </button>
                    </form>

                    <form action="AddToCart" method="post">
                        <input type="hidden" name="bookId"
                               value="<%= book.getBookId() %>">
                        <button type="submit" class="btn btn-cart">
                            <i class="bi bi-cart-plus"></i> Add to Cart
                        </button>
                    </form>

                </div>
            </div>
        </div>

        <%
                }
            } else {
        %>

        <div class="col-12">
            <div class="empty-message">
                <i class="bi bi-book-half fs-1 text-secondary"></i>
                <h4 class="mt-3">No Books Available</h4>
                <p class="text-secondary mb-0">
                    Please check again later for new books.
                </p>
            </div>
        </div>

        <%
            }
        %>

    </div>
</section>

<footer>
    <p class="mb-0">© 2026 BookVerse. Your Reading Journey Starts Here.</p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
