<%@ page import="java.util.*, com.db.Employee, com.dao.EmployeeDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Employee List</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #f0f4f8, #d9e2ec);
            color: #1a1a1a;
            margin: 0;
            padding: 0;
        }

        .dark {
            background: linear-gradient(135deg, #1e1e1e, #333);
            color: #eaeaea;
        }

        h2 {
            text-align: center;
            margin-top: 40px;
            font-size: 2rem;
        }

        .add-btn, .sort-btn {
            display: inline-block;
            margin: 10px 10px;
            padding: 10px 25px;
            font-weight: 600;
            background: linear-gradient(to right, #00b4db, #0083b0);
            color: white;
            border-radius: 40px;
            text-decoration: none;
            box-shadow: 0 4px 15px rgba(0, 132, 255, 0.4);
            transition: all 0.3s ease;
            border: none;
            cursor: pointer;
        }

        .add-btn:hover, .sort-btn:hover {
            background: linear-gradient(to right, #0083b0, #00b4db);
            transform: scale(1.05);
            box-shadow: 0 6px 20px rgba(0, 132, 255, 0.6);
        }

        #buttonWrapper {
            text-align: center;
        }

        #searchInput {
            display: block;
            margin: 10px auto 20px;
            padding: 10px 20px;
            border-radius: 30px;
            width: 60%;
            border: 1px solid #ccc;
            text-align: center;
            outline: none;
        }

        table {
            width: 90%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
            border-radius: 12px;
            overflow: hidden;
        }

        .dark table {
            background-color: #2a2a2a;
        }

        th, td {
            padding: 15px;
            text-align: center;
        }

        thead tr {
            background-color: #007bff;
            color: white;
        }

        tbody tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .dark thead tr {
            background-color: #444;
        }

        .dark tbody tr:nth-child(even) {
            background-color: #3a3a3a;
        }

        .edit-btn, .delete-btn {
            border: none;
            padding: 8px 15px;
            border-radius: 20px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .edit-btn {
            background-color: #4caf50;
            color: white;
        }

        .edit-btn:hover {
            background-color: #43a047;
            transform: scale(1.05);
        }

        .delete-btn {
            background-color: #f44336;
            color: white;
        }

        .delete-btn:hover {
            background-color: #e53935;
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
        let nameSortAsc = true;

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

        function searchTable() {
            const input = document.getElementById("searchInput");
            const filter = input.value.toLowerCase();
            const rows = document.querySelectorAll("table tbody tr");

            rows.forEach(row => {
                const text = row.textContent.toLowerCase();
                row.style.display = text.includes(filter) ? "" : "none";
            });
        }

        function sortByName() {
            const table = document.querySelector("table tbody");
            const rows = Array.from(table.rows);

            rows.sort((a, b) => {
                const nameA = a.cells[1].textContent.toLowerCase();
                const nameB = b.cells[1].textContent.toLowerCase();

                if (nameA < nameB) return nameSortAsc ? -1 : 1;
                if (nameA > nameB) return nameSortAsc ? 1 : -1;
                return 0;
            });

            table.innerHTML = "";
            rows.forEach(row => table.appendChild(row));

            // Update button icon
            const icon = document.getElementById("sortIcon");
            icon.textContent = nameSortAsc ? "▲" : "▼";

            nameSortAsc = !nameSortAsc;
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

<h2>Employee List</h2>

<div id="buttonWrapper">
    <a href="add.jsp" class="add-btn">+ Add New Employee</a>
    <button class="sort-btn" onclick="sortByName()">Sort by Name <span id="sortIcon">▲</span></button>
</div>

<input type="text" id="searchInput" placeholder="Search employees..." onkeyup="searchTable()">

<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Department</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <%
        List<Employee> list = EmployeeDAO.getAllEmployees();
        for(Employee e : list){
    %>
    <tr>
        <td><%= e.getId() %></td>
        <td><%= e.getName() %></td>
        <td><%= e.getEmail() %></td>
        <td><%= e.getDepartment() %></td>
        <td>
            <a href="edit.jsp?id=<%= e.getId() %>"><button class="edit-btn">Edit</button></a>
            <a href="DeleteEmployeeServlet?id=<%= e.getId() %>" onclick="return confirm('Are you sure you want to delete this employee?')">
                <button class="delete-btn">Delete</button>
            </a>
        </td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>
</body>
</html>
