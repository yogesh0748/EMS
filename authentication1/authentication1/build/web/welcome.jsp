<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String name = (String) session.getAttribute("name");
    if (name == null) {
        response.sendRedirect("login.jsp");
    }
%>
<html>
<head>
    <title>Welcome</title>
    <style>
       body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #f8f9fa, #e0e0e0);
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }

        .login-container {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.2);
            text-align: center;
            width: 300px;
            transition: all 0.3s ease-in-out;
        }

        .login-container:hover {
            transform: scale(1.02);
            box-shadow: 0 6px 18px rgba(0, 0, 0, 0.3);
        }

        input[type="text"], input[type="password"] {
            width: 90%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            transition: border-color 0.3s, box-shadow 0.3s;
        }

        input[type="text"]:focus, input[type="password"]:focus {
            border-color: #007bff;
            box-shadow: 0 0 6px rgba(0, 123, 255, 0.5);
            outline: none;
        }

        input[type="submit"] {
            background-color: #28a745;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
            transition: background-color 0.3s, transform 0.2s;
        }

        input[type="submit"]:hover {
            background-color: #218838;
            transform: translateY(-2px);
        }

        a {
            text-decoration: none;
            color: #007bff;
            transition: color 0.3s;
        }

        a:hover {
            color: #0056b3;
        }

        .dark {
            background: linear-gradient(to right, #232526, #414345) !important;
            color: #f0f0f0 !important;
        }

        .dark .login-container {
            background: #2c2c2c;
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

    <div class="welcome-container">
        <h2>Welcome, <%= name %>!</h2>
        <a href="logout.jsp">Logout</a>
    </div>
</body>
</html>
