
<%@ page import="java.util.ArrayList" %>
<%@ page import="Beans.BookBean" %>

<%
    ArrayList<BookBean> cart =
            (ArrayList<BookBean>) session.getAttribute("Cart");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BookVerse | My Cart</title>

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
            background: var(--light);
            font-family: 'DM Sans', sans-serif;
            color: var(--navy);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
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

        .page-header {
            background: var(--navy);
            color: white;
            padding: 40px 0;
        }

        .page-header h1 {
            font-family: 'Playfair Display', serif;
        }

        .page-header span {
            color: var(--gold);
        }

        .cart-card {
            background: white;
            padding: 22px;
            border-radius: 12px;
            box-shadow: 0 5px 20px rgba(16, 28, 45, 0.07);
            height: 100%;
        }

        .book-icon {
            font-size: 32px;
            color: #bd8c43;
        }

        .book-name {
            font-family: 'Playfair Display', serif;
            font-size: 21px;
            font-weight: bold;
        }

        .book-price {
            color: #bd8c43;
            font-weight: bold;
            font-size: 19px;
        }

        .empty-cart {
            background: white;
            text-align: center;
            padding: 55px 20px;
            border-radius: 14px;
            box-shadow: 0 5px 20px rgba(16, 28, 45, 0.07);
        }

        .empty-cart i {
            font-size: 55px;
            color: #bd8c43;
        }

        .btn-shop {
            background: var(--navy);
            color: white;
            padding: 11px 22px;
            border-radius: 8px;
            text-decoration: none;
        }

        .btn-shop:hover {
            background: #243a56;
            color: white;
        }

        footer {
            background: var(--navy);
            color: #ddd;
            text-align: center;
            padding: 18px;
            margin-top: auto;
        }
    </style>
</head>

<body>

<nav class="navbar">
    <div class="container">
        <a class="navbar-brand text-decoration-none" href="index.html">
            <i class="bi bi-book-half"></i> BookVerse
        </a>
    </div>
</nav>

<section class="page-header">
    <div class="container">
        <h1><span><i class="bi bi-cart3"></i> My Cart</span></h1>
        <p class="mb-0">Your selected books are waiting for you.</p>
    </div>
</section>

<section class="container py-5">

    <h2 class="mb-4" style="font-family: 'Playfair Display', serif;">
        Your Selected Books
    </h2>

    <div class="row g-4">

        <%
            if (cart != null && !cart.isEmpty()) {
                for (BookBean book : cart) {
        %>

        <div class="col-md-6 col-lg-4">
            <div class="cart-card">

                <div class="book-icon mb-3">
                    <i class="bi bi-book"></i>
                </div>

                <p class="text-secondary small mb-1">
                    BOOK ID: <%= book.getBookId() %>
                </p>

                <div class="book-name mb-2">
                    <%= book.getBookName() %>
                </div>

                <div class="book-price">
                    ₹ <%= book.getBookPrice() %>
                </div>

            </div>
        </div>

        <%
                }
            } else {
        %>

        <div class="col-12">
            <div class="empty-cart">
                <i class="bi bi-cart-x"></i>
                <h3 class="mt-3">Your Cart is Empty!</h3>
                <p class="text-secondary">
                    You haven't added any books to your cart yet.
                </p>

                <a href="UserHome.jsp" class="btn-shop">
                    <i class="bi bi-book"></i> Explore Books
                </a>
            </div>
        </div>

        <%
            }
        %>

    </div>

    <div class="mt-4">
        <a href="UserHome.jsp" class="btn-shop">
            <i class="bi bi-arrow-left"></i> Continue Shopping
        </a>
    </div>

</section>

<footer>
    © 2026 BookVerse. Your Reading Journey Starts Here.
</footer>

</body>
</html>
