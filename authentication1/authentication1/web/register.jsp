<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #0f0f0f, #1c1c1c);
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
            transition: background 0.4s ease-in-out;
        }

        .register-container {
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(15px);
            padding: 35px 25px;
            border-radius: 30% 70% 70% 30% / 30% 30% 70% 70%;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.4);
            text-align: center;
            width: 320px;
            transition: all 0.3s ease-in-out;
            color: #fff;
        }

        .register-container:hover {
            transform: scale(1.03);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.5);
        }

        input[type="text"], input[type="password"] {
            width: 90%;
            padding: 10px;
            margin: 10px 0;
            background: rgba(255,255,255,0.08);
            border: 1px solid #666;
            border-radius: 5px;
            color: #f0f0f0;
            transition: 0.3s;
        }

        input[type="text"]:focus, input[type="password"]:focus {
            border-color: #00bfff;
            box-shadow: 0 0 6px rgba(0, 191, 255, 0.7);
            outline: none;
        }

        input[type="submit"] {
            background-color: #00b894;
            color: white;
            padding: 10px 25px;
            border: none;
            border-radius: 25px;
            font-weight: bold;
            cursor: pointer;
            margin-top: 10px;
            transition: background-color 0.3s, transform 0.2s;
        }

        input[type="submit"]:hover {
            background-color: #00a17a;
            transform: translateY(-2px);
        }

        a {
            text-decoration: none;
            color: #00bfff;
            transition: color 0.3s;
        }

        a:hover {
            color: #89f7fe;
        }

        .dark {
            background: linear-gradient(to right, #0f0c29, #302b63, #24243e);
        }

        .dark .register-container {
            background: rgba(40, 40, 40, 0.9);
        }

        .dark input[type="text"], .dark input[type="password"] {
            background-color: #2a2a2a;
            color: white;
            border: 1px solid #555;
        }

        .dark input[type="submit"] {
            background-color: #666;
        }

        .dark input[type="submit"]:hover {
            background-color: #888;
        }

        .dark a {
            color: #66ccff;
        }

        .dark a:hover {
            color: #99e6ff;
        }

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
            background-color: #ccc;
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
            background-color: #2196F3;
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

    <div class="register-container">
        <h2>Register</h2>
        <form action="Register" method="post">
            <input type="text" name="name" placeholder="Name"><br>
            <input type="text" name="email" placeholder="Email"><br>
            <input type="password" name="password" placeholder="Password"><br>
            <input type="submit" value="Register">
        </form>
        <p>Already have an account? <a href="login.jsp">Login here</a></p>
    </div>
</body>
</html>
