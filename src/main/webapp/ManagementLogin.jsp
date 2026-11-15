
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BookVerse | Management Login</title>

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

        .login-section {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 50px 15px;
        }

        .login-card {
            background: white;
            width: 100%;
            max-width: 430px;
            padding: 40px;
            border-radius: 16px;
            box-shadow: 0 8px 30px rgba(16, 28, 45, 0.09);
        }

        .login-icon {
            font-size: 45px;
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

        .btn-login {
            background: var(--navy);
            color: white;
            padding: 12px;
            border-radius: 8px;
            font-weight: 600;
            width: 100%;
            border: none;
        }

        .btn-login:hover {
            background: #243a56;
            color: var(--gold);
        }

        .home-link {
            color: #9a6b2f;
            text-decoration: none;
            font-weight: 600;
        }

        .home-link:hover {
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

<section class="login-section">

    <div class="login-card text-center">

        <div class="login-icon mb-3">
            <i class="bi bi-shield-lock-fill"></i>
        </div>

        <h2 class="mb-2">Management Login</h2>

        <p class="text-secondary mb-4">
            Sign in to manage your BookVerse collection.
        </p>

        <form action="managementLogin" method="post">

            <div class="text-start mb-3">
                <label class="form-label">Admin ID</label>
                <input type="text"
                       class="form-control"
                       name="adminId"
                       placeholder="Enter Admin ID"
                       required>
            </div>

            <div class="text-start mb-4">
                <label class="form-label">Password</label>
                <input type="password"
                       class="form-control"
                       name="adminPassword"
                       placeholder="Enter Password"
                       required>
            </div>

            <button type="submit" class="btn btn-login">
                <i class="bi bi-box-arrow-in-right me-2"></i>
                Login
            </button>

        </form>

        <div class="mt-4">
            <a href="index.html" class="home-link">
                <i class="bi bi-arrow-left"></i> Back to Home
            </a>
        </div>

    </div>

</section>

<footer>
    © 2026 BookVerse. Your Reading Journey Starts Here.
</footer>

</body>
</html>
