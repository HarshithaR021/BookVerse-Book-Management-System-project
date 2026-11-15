
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BookVerse | User Login</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;600;700&family=Playfair+Display:wght@600;700&display=swap" rel="stylesheet">

    <style>
        :root {
            --navy: #101c2d;
            --gold: #e8bb72;
            --cream: #fffaf1;
        }

        body {
            min-height: 100vh;
            background: var(--cream);
            font-family: 'DM Sans', sans-serif;
            display: flex;
            flex-direction: column;
        }

        .navbar {
            background: var(--navy);
            padding: 15px 0;
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
            padding: 45px 15px;
        }

        .login-card {
            background: white;
            width: 100%;
            max-width: 440px;
            padding: 40px;
            border-radius: 16px;
            box-shadow: 0 8px 30px rgba(16, 28, 45, 0.10);
        }

        .login-icon {
            width: 65px;
            height: 65px;
            background: var(--cream);
            color: #bd8c43;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 30px;
            margin: 0 auto 20px;
        }

        .login-card h2 {
            font-family: 'Playfair Display', serif;
            color: var(--navy);
            font-weight: bold;
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
            border-color: var(--gold);
            box-shadow: 0 0 0 0.2rem rgba(232, 187, 114, 0.2);
        }

        .btn-login {
            background: var(--navy);
            color: white;
            padding: 12px;
            border-radius: 8px;
            font-weight: 600;
            width: 100%;
        }

        .btn-login:hover {
            background: #243a56;
            color: white;
        }

        .register-link {
            color: #a87932;
            font-weight: 600;
            text-decoration: none;
        }

        .register-link:hover {
            text-decoration: underline;
        }

        .home-link {
            color: var(--navy);
            text-decoration: none;
        }

        .home-link:hover {
            color: #bd8c43;
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
    <div class="login-card">

        <div class="login-icon">
            <i class="bi bi-person"></i>
        </div>

        <h2 class="text-center">Welcome Back!</h2>
        <p class="text-secondary text-center mb-4">
            Login to continue your reading journey.
        </p>

        <form action="UserLogin" method="post">

            <div class="mb-3">
                <label class="form-label">Phone Number</label>
                <input type="tel"
                       name="userPhoneNumber"
                       class="form-control"
                       placeholder="Enter your 10-digit phone number"
                       pattern="[0-9]{10}"
                       maxlength="10"
                       inputmode="numeric"
                       required>
            </div>

            <div class="mb-4">
                <label class="form-label">Password</label>
                <input type="password"
                       name="userPassword"
                       class="form-control"
                       placeholder="Enter your password"
                       required>
            </div>

            <button type="submit" class="btn btn-login">
                Login <i class="bi bi-arrow-right"></i>
            </button>

        </form>

        <div class="text-center mt-4">
            <p class="mb-2">New to BookVerse?</p>
            <a href="UserRegistration.jsp" class="register-link">
                Create an Account
            </a>
        </div>

        <hr>

        <div class="text-center">
            <a href="index.html" class="home-link">
                <i class="bi bi-house"></i> Back to Home
            </a>
        </div>

    </div>
</section>

<footer>
    © 2026 BookVerse. Your Reading Journey Starts Here.
</footer>

</body>
</html>

