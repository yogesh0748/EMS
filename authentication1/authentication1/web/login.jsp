<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link href="https://fonts.googleapis.com/css2?family=Orbitron&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            padding: 0;
            font-family: 'Orbitron', sans-serif;
            height: 100vh;
            background: linear-gradient(135deg, #0f0f0f, #1c1c1c, #000000);
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
        }

        .glass-form {
            position: relative;
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(12px);
            -webkit-backdrop-filter: blur(12px);
            border-radius: 30px 80px 30px 80px;
            padding: 40px;
            width: 340px;
            box-shadow: 0 0 30px rgba(0, 255, 255, 0.2);
            transform: rotate(-3deg);
            animation: floatCard 5s ease-in-out infinite;
        }

        @keyframes floatCard {
            0%, 100% { transform: rotate(-3deg) translateY(0); }
            50% { transform: rotate(-3deg) translateY(-10px); }
        }

        .glass-form h2 {
            color: #00ffe7;
            margin-bottom: 30px;
            font-size: 22px;
        }

        .input-group {
            position: relative;
            margin-bottom: 20px;
        }

        .input-group input {
            width: 100%;
            padding: 12px 15px;
            background: rgba(255, 255, 255, 0.1);
            border: none;
            border-radius: 12px;
            color: #fff;
            font-size: 14px;
            outline: none;
            transition: background 0.3s;
        }

        .input-group input::placeholder {
            color: #aaa;
        }

        .input-group input:focus {
            background: rgba(255, 255, 255, 0.2);
        }

        .glass-form input[type="submit"] {
            width: 100%;
            padding: 12px;
            background: #00ffe7;
            border: none;
            border-radius: 12px;
            font-weight: bold;
            font-size: 15px;
            color: #000;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .glass-form input[type="submit"]:hover {
            background: #00cccc;
            transform: translateY(-2px);
        }

        .glass-form .signup {
            margin-top: 15px;
            font-size: 13px;
            color: #ccc;
        }

        .glass-form .signup a {
            color: #00ffe7;
            text-decoration: none;
        }

        .error-message {
            color: #ff4d4d;
            font-size: 13px;
            margin-bottom: 15px;
        }

        /* Toggle switch */
        .dark-mode-toggle {
            position: absolute;
            top: 20px;
            right: 20px;
        }

        .switch {
            position: relative;
            display: inline-block;
            width: 50px;
            height: 24px;
        }

        .switch input {
            opacity: 0;
            width: 0;
            height: 0;
        }

        .slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #555;
            transition: 0.4s;
            border-radius: 24px;
        }

        .slider:before {
            position: absolute;
            content: "";
            height: 18px;
            width: 18px;
            left: 4px;
            bottom: 3px;
            background-color: white;
            transition: 0.4s;
            border-radius: 50%;
        }

        input:checked + .slider {
            background-color: #00ffe7;
        }

        input:checked + .slider:before {
            transform: translateX(26px);
        }
    </style>
    <script>
        window.onload = () => {
            const isDark = localStorage.getItem('dark-mode') === 'true';
            document.body.classList.toggle('dark', isDark);
            document.getElementById('modeToggle').checked = isDark;
        };

        function toggleDarkMode() {
            const enabled = document.getElementById('modeToggle').checked;
            document.body.classList.toggle('dark', enabled);
            localStorage.setItem('dark-mode', enabled);
        }
    </script>
</head>
<body>
    <div class="dark-mode-toggle">
        <label class="switch">
            <input type="checkbox" id="modeToggle" onchange="toggleDarkMode()">
            <span class="slider"></span>
        </label>
    </div>

    <div class="glass-form">
        <h2>Sign In Securely</h2>
        <% String error = (String) request.getAttribute("errorMessage"); %>
        <% if (error != null) { %>
            <p class="error-message"><%= error %></p>
        <% } %>
        <form action="LogServlet" method="post">
            <div class="input-group">
                <input type="text" name="email" placeholder="Email" required>
            </div>
            <div class="input-group">
                <input type="password" name="password" placeholder="Password" required>
            </div>
            <input type="submit" value="Login">
        </form>
        <div class="signup">
            Don’t have an account? <a href="register.jsp">Register here</a>
        </div>
    </div>
</body>
</html>
