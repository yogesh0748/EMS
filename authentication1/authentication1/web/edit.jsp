<%@ page import="java.util.*, com.db.Employee, com.dao.EmployeeDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    Employee e = EmployeeDAO.getEmployeeById(id);
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Employee</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap" rel="stylesheet">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #f0f4f8, #d9e2ec);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            overflow: hidden;
        }

        .dark {
            background: linear-gradient(135deg, #1e1e1e, #333);
            color: #eaeaea;
        }

        .form-container {
            background: white;
            padding: 50px 30px;
            border-radius: 60% 40% 30% 70% / 60% 30% 70% 40%;
            box-shadow: 0 0 25px rgba(0, 123, 255, 0.6);
            width: 100%;
            max-width: 420px;
            transition: all 0.4s ease-in-out;
            text-align: center;
            animation: pop 0.6s ease forwards;
        }

        @keyframes pop {
            0% {
                transform: scale(0.7);
                opacity: 0;
            }
            100% {
                transform: scale(1);
                opacity: 1;
            }
        }

        .dark .form-container {
            background-color: #2a2a2a;
            box-shadow: 0 0 25px rgba(0, 183, 255, 0.7);
        }

        .form-container h2 {
            margin-bottom: 25px;
            font-weight: 600;
        }

        input[type="text"], input[type="email"] {
            width: 100%;
            padding: 12px 20px;
            margin-bottom: 20px;
            border: none;
            border-radius: 30px;
            font-size: 16px;
            box-shadow: 0 0 8px rgba(0, 123, 255, 0.15);
            transition: all 0.3s ease;
        }

        input[type="text"]:focus, input[type="email"]:focus {
            outline: none;
            box-shadow: 0 0 12px rgba(0, 123, 255, 0.4);
        }

        .dark input[type="text"], .dark input[type="email"] {
            background-color: #444;
            color: #fff;
            box-shadow: none;
        }

        input[type="submit"] {
            background: linear-gradient(to right, #00b4db, #0083b0);
            color: white;
            padding: 12px 30px;
            border: none;
            border-radius: 30px;
            font-weight: 600;
            width: 100%;
            transition: all 0.3s ease;
        }

        input[type="submit"]:hover {
            background: linear-gradient(to right, #0083b0, #00b4db);
            transform: scale(1.05);
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

<div class="form-container">
    <h2>Edit Employee</h2>
    <form action="UpdateEmployeeServlet" method="post">
        <input type="hidden" name="id" value="<%= e.getId() %>">
        <input type="text" name="name" placeholder="Name" value="<%= e.getName() %>" required>
        <input type="email" name="email" placeholder="Email" value="<%= e.getEmail() %>" required>
        <input type="text" name="department" placeholder="Department" value="<%= e.getDepartment() %>" required>
        <input type="submit" value="Update Employee">
    </form>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
