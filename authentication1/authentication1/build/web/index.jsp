<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee Management System</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Orbitron&display=swap');

        body {
            margin: 0;
            font-family: 'Orbitron', sans-serif;
            background: linear-gradient(135deg, #0f0f0f, #1c1c1c, #000000);
            color: #ffffff;
            transition: background-color 0.4s, color 0.4s;
        }

        header {
            background: linear-gradient(135deg, #000000, #434343);
            color: #fff;
            padding: 15px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        header .logo {
            font-size: 1.5rem;
            font-weight: bold;
            letter-spacing: 1px;
        }

        header .hamburger {
            display: none;
            cursor: pointer;
            flex-direction: column;
            gap: 4px;
        }

        header .hamburger div {
            background: #fff;
            height: 3px;
            width: 25px;
            transition: transform 0.3s;
        }

        nav {
            display: flex;
            gap: 20px;
        }

        nav a {
            text-decoration: none;
            color: #fff;
            font-weight: bold;
            transition: color 0.3s;
        }

        nav a:hover {
            color: #00ffe7;
        }

        .mobile-menu {
            display: none;
            flex-direction: column;
            gap: 10px;
            background: #111;
            padding: 10px;
            position: absolute;
            top: 100%;
            right: 0;
            box-shadow: 0 3px 10px rgba(0, 255, 255, 0.3);
        }

        .mobile-menu a {
            color: #fff;
            text-decoration: none;
            font-weight: 500;
        }

        .hero-section {
            background: linear-gradient(135deg, #1a1a1a, #121212);
            height: 90vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: #00ffe7;
            gap: 20px;
            padding: 0 20px;
        }

        .hero-section img {
            max-width: 100%;
            height: auto;
            border-radius: 20px;
            box-shadow: 0px 4px 20px rgba(0, 255, 255, 0.15);
        }

        .hero-content h1 {
            font-size: 3rem;
            color: #00ffe7;
            text-shadow: 0 0 5px #00ffe7;
        }

        .hero-content p {
            font-size: 1.1rem;
            color: #ccc;
        }

        .btn-primary {
            background: rgba(0, 255, 231, 0.2);
            border: 1px solid #00ffe7;
            color: #00ffe7;
            padding: 12px 30px;
            font-size: 1.1rem;
            border-radius: 50px;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease-in-out;
        }

        .btn-primary:hover {
            background: #00ffe7;
            color: #000;
            transform: scale(1.1);
        }

        footer {
            background: linear-gradient(135deg, #000, #2a2a2a);
            color: #ccc;
            padding: 15px;
            text-align: center;
            font-size: 0.9rem;
        }

        #clock {
            font-size: 0.9rem;
            font-weight: bold;
            color: #00ffe7;
        }

        @media (max-width: 768px) {
            header nav {
                display: none;
            }

            .hamburger {
                display: flex;
            }

            .mobile-menu.show {
                display: flex;
            }

            .hero-content h1 {
                font-size: 2rem;
            }
        }
    </style>
    <script>
        window.onload = function () {
            const clock = document.getElementById('clock');
            setInterval(() => {
                const now = new Date();
                clock.textContent = now.toLocaleTimeString();
            }, 1000);

            const hamburger = document.querySelector('.hamburger');
            const mobileMenu = document.querySelector('.mobile-menu');
            hamburger.addEventListener('click', () => {
                mobileMenu.classList.toggle('show');
            });
        };
    </script>
</head>
<body>
<header>
    <div class="logo">EMS</div>
    <div class="hamburger">
        <div></div>
        <div></div>
        <div></div>
    </div>
    <nav>
        <a href="#home">Home</a>
        <a href="#features">Features</a>
        <a href="#contact">Contact</a>
    </nav>
    <div id="clock"></div>
    <div class="mobile-menu">
        <a href="#home">Home</a>
        <a href="#features">Features</a>
        <a href="#contact">Contact</a>
    </div>
</header>

<div class="hero-section" id="home">
    <div class="hero-content">
        <h1>Welcome to EMS</h1>
        <p>Manage your employees efficiently with futuristic tools.</p>
        <button class="btn-primary" onclick="window.location.href='login.jsp'">Get Started</button>
    </div>
    <img src="https://via.placeholder.com/500x300?text=EMS+Dashboard" alt="EMS Illustration">
</div>

<footer>
    &copy; 2025 Employee Management System
</footer>
</body>
</html>