<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.zan.entity.Student" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Halaman Selamat Datang</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        table {
            border-collapse: collapse;
            width: 60%;
            margin: 20px auto;
        }

        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        /* Styling for the popup */
        .popup {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            padding: 20px;
            background-color: white;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3);
            z-index: 9999;
        }
    </style>
</head>
<body>
<h2>Selamat Datang</h2>
<%
    // Buat sebuah List untuk menyimpan data mahasiswa
    List<Student> students = new ArrayList<>();
    students.add(new Student("S001", "Arya", "DEP001", 35));
    students.add(new Student("S002", "Ayu", "DEP001", 70));
    students.add(new Student("S003", "Adi", "DEP001", 60));
    students.add(new Student("S004", "Dimas", "DEP001", 90));
    students.add(new Student("S005", "Heru", "DEP002", 30));
    students.add(new Student("S006", "Jafar", "DEP003", 32));
    students.add(new Student("S007", "Fauzan", "DEP003", 70));
    students.add(new Student("S008", "Yova", "DEP003", 20));

    // Buat sebuah Map untuk menyimpan data mahasiswa berdasarkan departemen
    Map<String, Map<String, Integer>> studentDataByDepartment = new HashMap<>();

    // Isi data ke dalam Map studentDataByDepartment
    for (Student student : students) {
        String department = student.getDepartment();
        Map<String, Integer> departmentStudents = studentDataByDepartment.getOrDefault(department, new HashMap<String, Integer>());
        departmentStudents.put(student.getStudentID(), student.getMark());
        studentDataByDepartment.put(department, departmentStudents);
    }
%>
<table>
    <tr>
        <th>Departemen</th>
        <th>Student Id</th>
        <th>Marks</th>
    </tr>
    <% for (Map.Entry<String, Map<String, Integer>> entry : studentDataByDepartment.entrySet()) { %>
    <tr>
        <td rowspan="<%= entry.getValue().size() + 1 %>"><%= entry.getKey() %></td>
    </tr>
    <% int totalStudents = entry.getValue().size(); %>
    <% int passCount = 0; %>
    <% for (Map.Entry<String, Integer> studentEntry : entry.getValue().entrySet()) { %>
    <tr>
        <td><a href="#" onclick="showPopup('<%= studentEntry.getKey() %>')"><%= studentEntry.getKey() %></a></td>
        <td><%= studentEntry.getValue() %></td>
        <% if (studentEntry.getValue() >= 40) { passCount++; } %>
    </tr>
    <% } %>
    <% double passPercentage = (passCount * 100.0) / totalStudents; %>
    <tr>
        <!-- Kolom Pass % diberi atribut colspan untuk menggabungkan kolom ke kanan -->
        <td colspan="2">Pass %:</td>
        <td colspan="2"><%= String.format("%.2f", passPercentage) %> %</td>
    </tr>
    <% } %>
</table>

<!-- Popup -->
<div class="popup" id="popup">
    <h3 id="popupStudentName"></h3>
    <button onclick="hidePopup()">Close</button>
</div>

<script>
    function showPopup(studentId) {
        const student = getStudentById(studentId);
        if (student) {
            const popup = document.getElementById('popup');
            const popupStudentName = document.getElementById('popupStudentName');
            popupStudentName.innerText = 'Student Name: ' + student.studentName;
            popup.style.display = 'block';
        }
    }

    function hidePopup() {
        const popup = document.getElementById('popup');
        popup.style.display = 'none';
    }

    function getStudentById(studentId) {
        const studentList = <%= new Gson().toJson(students) %>;
        return studentList.find(student => student.studentID === studentId);
    }
</script>

</body>
</html>
