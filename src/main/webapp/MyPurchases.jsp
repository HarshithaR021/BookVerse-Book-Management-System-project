
<%@ page import="java.util.ArrayList" %>
<%@ page import="Beans.UserBean" %>
<%@ page import="Beans.BookUserBean" %>
<%@ page import="BookDAO.BookUserDAO" %>

<%
    UserBean user =
        (UserBean) session.getAttribute("UserDetails");

    if (user == null) {
        response.sendRedirect("UserLogin.jsp");
        return;
    }

    ArrayList<BookUserBean> purchases =
        new BookUserDAO().getUserPurchases(user.getUserId());
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BookVerse | My Purchases</title>

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

        .purchase-card {
            background: white;
            border-radius: 13px;
            padding: 25px;
            height: 100%;
            box-shadow: 0 5px 20px rgba(16, 28, 45, 0.07);
            transition: 0.3s;
        }

        .purchase-card:hover {
            transform: translateY(-4px);
        }

        .purchase-icon {
            font-size: 35px;
            color: #bd8c43;
        }

        .purchase-label {
            color: #777;
            font-size: 13px;
        }

        .purchase-value {
            font-weight: bold;
            font-size: 21px;
        }

        .purchase-price {
            color: #bd8c43;
        }

        .empty-message {
            background: white;
            border-radius: 14px;
            padding: 50px 20px;
            text-align: center;
            box-shadow: 0 5px 20px rgba(16, 28, 45, 0.07);
        }

        .empty-message i {
            font-size: 55px;
            color: #bd8c43;
        }

        .btn-home {
            background: var(--navy);
            color: white;
            text-decoration: none;
            padding: 11px 22px;
            border-radius: 8px;
            display: inline-block;
        }

        .btn-home:hover {
            background: #243a56;
            color: white;
        }

        footer {
            background: var(--navy);
            color: #ddd;
            padding: 18px;
            text-align: center;
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
        <h1><span><i class="bi bi-bag-check"></i> My Purchases</span></h1>
        <p class="mb-0">
            Hello, <%= user.getUserName() %>! Here are the books you've purchased.
        </p>
    </div>
</section>

<section class="container py-5">

    <h2 class="mb-4" style="font-family: 'Playfair Display', serif;">
        Your Purchase History
    </h2>

    <div class="row g-4">

        <%
            if (purchases != null && !purchases.isEmpty()) {
                for (BookUserBean purchase : purchases) {
        %>

        <div class="col-sm-6 col-lg-4">
            <div class="purchase-card">

                <div class="purchase-icon mb-3">
                    <i class="bi bi-book-half"></i>
                </div>

                <p class="purchase-label mb-1">BOOK ID</p>
                <div class="purchase-value mb-3">
                    #<%= purchase.getBookId() %>
                </div>

                <p class="purchase-label mb-1">PURCHASE PRICE</p>
                <div class="purchase-value purchase-price">
                    ₹ <%= purchase.getPrice() %>
                </div>

            </div>
        </div>

        <%
                }
            } else {
        %>

        <div class="col-12">
            <div class="empty-message">
                <i class="bi bi-bag-x"></i>
                <h3 class="mt-3">No Purchases Yet!</h3>
                <p class="text-secondary">
                    You haven't purchased any books. Explore our collection!
                </p>
            </div>
        </div>

        <%
            }
        %>

    </div>

    <div class="mt-4">
        <a href="UserHome.jsp" class="btn-home">
            <i class="bi bi-arrow-left"></i> Back to Dashboard
        </a>
    </div>

</section>

<footer>
    © 2026 BookVerse. Your Reading Journey Starts Here.
</footer>

</body>
</html>
