
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BookVerse | User Registration</title>

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

        .register-section {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 40px 15px;
        }

        .register-card {
            background: white;
            width: 100%;
            max-width: 460px;
            padding: 40px;
            border-radius: 16px;
            box-shadow: 0 8px 30px rgba(16, 28, 45, 0.10);
        }

        .register-icon {
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

        .register-card h2 {
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

        .btn-register {
            background: var(--navy);
            color: white;
            padding: 12px;
            border-radius: 8px;
            font-weight: 600;
            width: 100%;
        }

        .btn-register:hover {
            background: #243a56;
            color: white;
        }

        .login-link {
            color: #a87932;
            font-weight: 600;
            text-decoration: none;
        }

        .login-link:hover {
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

<section class="register-section">
    <div class="register-card">

        <div class="register-icon">
            <i class="bi bi-person-plus"></i>
        </div>

        <h2 class="text-center">Create Account</h2>
        <p class="text-secondary text-center mb-4">
            Join BookVerse and start your reading journey.
        </p>

        <form action="UserRegistration" method="post">

            <div class="mb-3">
                <label class="form-label">Full Name</label>
                <input type="text"
                       name="userName"
                       class="form-control"
                       placeholder="Enter your full name"
                       required>
            </div>

            <div class="mb-3">
                <label class="form-label">Password</label>
                <input type="password"
                       name="userPassword"
                       class="form-control"
                       placeholder="Create a password"
                       required>
            </div>

            <div class="mb-4">
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

            <button type="submit" class="btn btn-register">
                Register <i class="bi bi-arrow-right"></i>
            </button>

        </form>

        <div class="text-center mt-4">
            <p class="mb-2">Already have an account?</p>
            <a href="UserLogin.jsp" class="login-link">
                Login Here
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
