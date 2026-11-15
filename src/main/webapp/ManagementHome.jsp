
<%
    if (session.getAttribute("ManagementDetails") == null) {
        response.sendRedirect("ManagementLogin.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BookVerse | Management Dashboard</title>

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
            font-size: 30px;
            font-weight: bold;
        }

        .admin-card {
            background: white;
            border: none;
            border-radius: 14px;
            padding: 28px;
            height: 100%;
            box-shadow: 0 5px 20px rgba(16, 28, 45, 0.07);
            transition: 0.3s;
        }

        .admin-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(16, 28, 45, 0.12);
        }

        .admin-icon {
            font-size: 36px;
            color: #bd8c43;
            margin-bottom: 15px;
        }

        .admin-card h4 {
            font-family: 'Playfair Display', serif;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .admin-card p {
            color: #777;
            min-height: 48px;
        }

        .btn-manage {
            background: var(--navy);
            color: white;
            border-radius: 7px;
            padding: 9px 18px;
        }

        .btn-manage:hover {
            background: #243a56;
            color: white;
        }

        .logout-link {
            color: white;
            text-decoration: none;
            border: 1px solid var(--gold);
            padding: 9px 17px;
            border-radius: 7px;
        }

        .logout-link:hover {
            background: var(--gold);
            color: var(--navy);
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

<nav class="navbar">
    <div class="container d-flex justify-content-between align-items-center">
        <a class="navbar-brand text-decoration-none" href="index.html">
            <i class="bi bi-book-half"></i> BookVerse
        </a>

        <a href="ManagementLogout" class="logout-link">
            <i class="bi bi-box-arrow-right"></i> Logout
        </a>
    </div>
</nav>

<section class="welcome-section">
    <div class="container">
        <h1>Management <span>Dashboard</span></h1>
        <p class="mt-3 mb-0">
            Welcome, Admin! Manage your bookstore and keep your collection updated.
        </p>
    </div>
</section>

<section class="container py-5">

    <h2 class="section-title mb-2">Manage Your Books</h2>
    <p class="text-secondary mb-4">
        Select an operation to manage the BookVerse collection.
    </p>

    <div class="row g-4">

        <div class="col-sm-6 col-lg-4">
            <div class="admin-card">
                <div class="admin-icon"><i class="bi bi-plus-circle"></i></div>
                <h4>Add New Book</h4>
                <p>Add a new book to the BookVerse collection.</p>
                <a href="AddBook.html" class="btn btn-manage">
                    Add Book <i class="bi bi-arrow-right"></i>
                </a>
            </div>
        </div>

        <div class="col-sm-6 col-lg-4">
            <div class="admin-card">
                <div class="admin-icon"><i class="bi bi-journals"></i></div>
                <h4>Show All Books</h4>
                <p>View all books currently available in the collection.</p>
                <a href="ShowAllBooks" class="btn btn-manage">
                    View Books <i class="bi bi-arrow-right"></i>
                </a>
            </div>
        </div>

        <div class="col-sm-6 col-lg-4">
            <div class="admin-card">
                <div class="admin-icon"><i class="bi bi-pencil-square"></i></div>
                <h4>Update Book</h4>
                <p>Modify the details and price of an existing book.</p>
                <a href="UpdateBook.jsp" class="btn btn-manage">
                    Update Book <i class="bi bi-arrow-right"></i>
                </a>
            </div>
        </div>

        <div class="col-sm-6 col-lg-4">
            <div class="admin-card">
                <div class="admin-icon"><i class="bi bi-trash3"></i></div>
                <h4>Delete Book</h4>
                <p>Remove a book from the bookstore collection.</p>
                <a href="DeleteBookUsingId.jsp" class="btn btn-manage">
                    Delete Book <i class="bi bi-arrow-right"></i>
                </a>
            </div>
        </div>

        <div class="col-sm-6 col-lg-4">
            <div class="admin-card">
                <div class="admin-icon"><i class="bi bi-search"></i></div>
                <h4>Search Book</h4>
                <p>Find a particular book using its Book ID.</p>
                <a href="ShowBookUsingId.jsp" class="btn btn-manage">
                    Search Book <i class="bi bi-arrow-right"></i>
                </a>
            </div>
        </div>

    </div>
</section>

<footer>
    <p class="mb-0">© 2026 BookVerse. Management Portal.</p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
