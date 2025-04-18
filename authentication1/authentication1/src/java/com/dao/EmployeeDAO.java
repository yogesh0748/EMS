//package com.dao;
//
//import java.sql.*;
//import java.util.*;
//import com.db.Employee;
//import com.db.DBConnection;
//
//public class EmployeeDAO {
//
//    public static List<Employee> getAllEmployees() {
//        List<Employee> list = new ArrayList<>();
//        try (Connection conn = DBConnection.getConnection();
//             Statement stmt = conn.createStatement();
//             ResultSet rs = stmt.executeQuery("SELECT * FROM employees")) {
//
//            while (rs.next()) {
//                Employee e = new Employee();
//                e.setId(rs.getInt("id"));
//                e.setName(rs.getString("name"));
//                e.setEmail(rs.getString("email"));
//                e.setDepartment(rs.getString("department"));
//                list.add(e);
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return list;
//    }
//
//    public static Employee getEmployeeById(int id) {
//        Employee e = new Employee();
//        try (Connection conn = DBConnection.getConnection();
//             PreparedStatement ps = conn.prepareStatement("SELECT * FROM employees WHERE id=?")) {
//
//            ps.setInt(1, id);
//            ResultSet rs = ps.executeQuery();
//            if (rs.next()) {
//                e.setId(rs.getInt("id"));
//                e.setName(rs.getString("name"));
//                e.setEmail(rs.getString("email"));
//                e.setDepartment(rs.getString("department"));
//            }
//        } catch (Exception ex) {
//            ex.printStackTrace();
//        }
//        return e;
//    }
//
//    public static int addEmployee(Employee emp) {
//        int status = 0;
//        try (Connection conn = DBConnection.getConnection();
//             PreparedStatement ps = conn.prepareStatement(
//                     "INSERT INTO employees(name, email, department) VALUES (?, ?, ?)")) {
//
//            ps.setString(1, emp.getName());
//            ps.setString(2, emp.getEmail());
//            ps.setString(3, emp.getDepartment());
//            status = ps.executeUpdate();
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return status;
//    }
//
//    public static int updateEmployee(Employee emp) {
//        int status = 0;
//        try (Connection conn = DBConnection.getConnection();
//             PreparedStatement ps = conn.prepareStatement(
//                     "UPDATE employees SET name=?, email=?, department=? WHERE id=?")) {
//
//            ps.setString(1, emp.getName());
//            ps.setString(2, emp.getEmail());
//            ps.setString(3, emp.getDepartment());
//            ps.setInt(4, emp.getId());
//            status = ps.executeUpdate();
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return status;
//    }
//
//    public static int deleteEmployee(int id) {
//        int status = 0;
//        try (Connection conn = DBConnection.getConnection();
//             PreparedStatement ps = conn.prepareStatement("DELETE FROM employees WHERE id=?")) {
//
//            ps.setInt(1, id);
//            status = ps.executeUpdate();
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return status;
//    }
//}
package com.dao;

import java.sql.*;
import java.util.*;
import com.db.Employee;
import com.db.DBConnection;

public class EmployeeDAO {

    public static List<Employee> getAllEmployees() {
        List<Employee> list = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM employees")) {

            while (rs.next()) {
                Employee e = new Employee();
                e.setId(rs.getInt("id"));
                e.setName(rs.getString("name"));
                e.setEmail(rs.getString("email"));
                e.setDepartment(rs.getString("department"));
                list.add(e);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static Employee getEmployeeById(int id) {
        Employee e = new Employee();
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement("SELECT * FROM employees WHERE id=?")) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                e.setId(rs.getInt("id"));
                e.setName(rs.getString("name"));
                e.setEmail(rs.getString("email"));
                e.setDepartment(rs.getString("department"));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return e;
    }

    public static int addEmployee(Employee emp) {
        int status = 0;
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(
                     "INSERT INTO employees(name, email, department) VALUES (?, ?, ?)")) {

            ps.setString(1, emp.getName());
            ps.setString(2, emp.getEmail());
            ps.setString(3, emp.getDepartment());
            status = ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    public static int updateEmployee(Employee emp) {
        int status = 0;
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(
                     "UPDATE employees SET name=?, email=?, department=? WHERE id=?")) {

            ps.setString(1, emp.getName());
            ps.setString(2, emp.getEmail());
            ps.setString(3, emp.getDepartment());
            ps.setInt(4, emp.getId());
            status = ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    public static int deleteEmployee(int id) {
        int status = 0;
        try (Connection conn = DBConnection.getConnection()) {

            // Delete employee
            try (PreparedStatement ps = conn.prepareStatement("DELETE FROM employees WHERE id=?")) {
                ps.setInt(1, id);
                status = ps.executeUpdate();
            }

            // Renumber IDs and reset AUTO_INCREMENT
            try (Statement stmt = conn.createStatement()) {
                stmt.execute("SET @count = 0");
                stmt.execute("UPDATE employees SET id = (@count := @count + 1)");
                stmt.execute("ALTER TABLE employees AUTO_INCREMENT = 1");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
}
