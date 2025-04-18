<%@ page import="java.util.*, com.db.Employee, com.dao.EmployeeDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Employee List</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap" rel="stylesheet">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
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

        .add-btn {
            display: block;
            margin: 20px auto;
            padding: 10px 25px;
            font-weight: 600;
            background: linear-gradient(to right, #00b4db, #0083b0);
            color: white;
            border-radius: 40px;
            text-decoration: none;
            box-shadow: 0 4px 15px rgba(0, 132, 255, 0.4);
            transition: all 0.3s ease;
        }

        .add-btn:hover {
            background: linear-gradient(to right, #0083b0, #00b4db);
            transform: scale(1.05);
            box-shadow: 0 6px 20px rgba(0, 132, 255, 0.6);
        }

        #searchInput {
            display: block;
            margin: 0 auto 20px;
            padding: 10px 20px;
            border-radius: 30px;
            width: 60%;
            border: 1px solid #ccc;
            text-align: center;
            outline: none;
        }

        table {
            width: 95%;
            margin: 30px auto;
            border-collapse: collapse;
            background-color: white;
            border-radius: 12px;
            overflow: hidden;
        }

        .dark table {
            background-color: #2a2a2a;
        }

        th, td {
            padding: 14px 10px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        thead tr {
            background-color: #007bff;
            color: white;
        }

        tbody tr:nth-child(even) {
            background-color: #f1f1f1;
        }

        tbody tr:hover {
            background-color: #d9eaf7;
            cursor: pointer;
        }

        .dark thead tr {
            background-color: #444;
        }

        .dark tbody tr:nth-child(even) {
            background-color: #3a3a3a;
        }

        .dark tbody tr:hover {
            background-color: #555;
        }

        .edit-btn, .delete-btn {
            border: none;
            padding: 8px 20px;
            border-radius: 25px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .edit-btn {
            background: linear-gradient(to right, #56ab2f, #a8e063);
            color: white;
        }

        .edit-btn:hover {
            background: linear-gradient(to right, #a8e063, #56ab2f);
            transform: scale(1.1);
        }

        .delete-btn {
            background: linear-gradient(to right, #ff416c, #ff4b2b);
            color: white;
        }

        .delete-btn:hover {
            background: linear-gradient(to right, #ff4b2b, #ff416c);
            transform: scale(1.1);
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

        /* Modal font color */
        .modal-content {
            color: black;
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

        function searchTable() {
            const input = document.getElementById("searchInput");
            const filter = input.value.toLowerCase();
            const rows = document.querySelectorAll("table tbody tr");

            rows.forEach(row => {
                const text = row.textContent.toLowerCase();
                row.style.display = text.includes(filter) ? "" : "none";
            });
        }

        function confirmEdit(id) {
            const proceed = confirm("Do you want to edit this employee (ID: " + id + ")?");
            if (proceed) {
                window.location.href = 'edit.jsp?id=' + id;
            }
            return false;
        }

        function confirmDelete(id) {
            const confirmBox = confirm("Are you absolutely sure you want to delete employee ID: " + id + "? This action cannot be undone.");
            return confirmBox;
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
<a href="add.jsp" class="add-btn" data-toggle="modal" data-target="#addEmployeeModal">+ Add New Employee</a>
<input type="text" id="searchInput" placeholder="Search employees..." onkeyup="searchTable()">

<!-- Modal -->
<div class="modal fade" id="addEmployeeModal" tabindex="-1" role="dialog" aria-labelledby="addEmployeeModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="addEmployeeModalLabel">Add New Employee</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="AddEmployeeServlet" method="post">
          <input type="text" name="name" placeholder="Employee Name" required class="form-control mb-2">
          <input type="email" name="email" placeholder="Employee Email" required class="form-control mb-2">
          <input type="text" name="department" placeholder="Department" required class="form-control mb-2">
          <input type="submit" value="Add Employee" class="btn btn-success w-100">
        </form>
      </div>
    </div>
  </div>
</div>

<table>
    <thead>
        <tr>
            <th>ID</th><th>Name</th><th>Email</th><th>Department</th><th>Actions</th>
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
                <button class="edit-btn" onclick="return confirmEdit(<%= e.getId() %>)">Edit</button>
                <a href="DeleteEmployeeServlet?id=<%= e.getId() %>" onclick="return confirmDelete(<%= e.getId() %>)">
                    <button class="delete-btn">Delete</button>
                </a>
            </td>
        </tr>
    <%
        }
    %>
    </tbody>
</table>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
