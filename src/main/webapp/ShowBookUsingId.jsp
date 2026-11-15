
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BookVerse | Search Book</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;600;700&family=Playfair+Display:wght@600;700&display=swap" rel="stylesheet">

    <style>
        :root {
            --navy: #101c2d;
            --gold: #e8bb72;
            --light: #f6f3ec;
        }

        body {
            background: var(--light);
            font-family: 'DM Sans', sans-serif;
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

        .main-section {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 45px 15px;
        }

        .form-card {
            background: white;
            width: 100%;
            max-width: 460px;
            padding: 38px;
            border-radius: 16px;
            box-shadow: 0 8px 30px rgba(16, 28, 45, 0.08);
        }

        .form-icon {
            font-size: 48px;
            color: #bd8c43;
        }

        h2 {
            font-family: 'Playfair Display', serif;
            color: var(--navy);
        }

        .form-label {
            font-weight: 600;
            color: var(--navy);
        }

        .form-control {
            padding: 12px;
            border-radius: 8px;
        }

        .form-control:focus {
            border-color: #bd8c43;
            box-shadow: 0 0 0 0.2rem rgba(189, 140, 67, 0.15);
        }

        .btn-search {
            background: var(--navy);
            color: white;
            padding: 12px;
            border: none;
            border-radius: 8px;
            width: 100%;
            font-weight: 600;
        }

        .btn-search:hover {
            background: #243a56;
            color: var(--gold);
        }

        .back-link {
            color: #9a6b2f;
            text-decoration: none;
            font-weight: 600;
        }

        .back-link:hover {
            text-decoration: underline;
        }

        footer {
            background: var(--navy);
            color: #ddd;
            padding: 18px;
            text-align: center;
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

<section class="main-section">

    <div class="form-card">

        <div class="text-center mb-4">
            <div class="form-icon mb-2">
                <i class="bi bi-search"></i>
            </div>

            <h2>Search Book</h2>

            <p class="text-secondary">
                Find a book using its unique Book ID.
            </p>
        </div>

        <form action="ShowBookUsingId" method="post">

            <div class="mb-4">
                <label class="form-label">Book ID</label>

                <input type="number"
                       class="form-control"
                       name="bookId"
                       placeholder="Enter Book ID"
                       required>
            </div>

            <button type="submit" class="btn-search">
                <i class="bi bi-search me-2"></i>
                Search Book
            </button>

        </form>

        <div class="text-center mt-4">
            <a href="ManagementHome.jsp" class="back-link">
                <i class="bi bi-arrow-left"></i> Back to Dashboard
            </a>
        </div>

    </div>

</section>

<footer>
    © 2026 BookVerse. Your Reading Journey Starts Here.
</footer>

</body>
</html>
