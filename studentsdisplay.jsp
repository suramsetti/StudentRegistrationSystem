<%@page import="com.lbrce.it.jspdao.StudentDAO,java.util.*,com.lbrce.it.jspjdbcusingbean.StudentBean" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student List</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f5f6fa;
            margin: 0;
            padding: 20px;
        }
        h2 {
            text-align: center;
            color: #2f3640;
        }
        .card-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 20px;
            padding: 30px;
        }
        .card {
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
            padding: 20px;
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
        }
        .card h3 {
            color: #273c75;
            margin-bottom: 10px;
        }
        .details p {
            margin: 5px 0;
            color: #353b48;
        }
        .buttons {
            margin-top: 15px;
        }
        .btn {
            padding: 6px 12px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            text-decoration: none;
            font-size: 14px;
            margin-right: 10px;
        }
        .edit {
            background-color: #00a8ff;
            color: white;
        }
        .edit:hover {
            background-color: #0097e6;
        }
        .delete {
            background-color: #e84118;
            color: white;
        }
        .delete:hover {
            background-color: #c23616;
        }
        .add-btn {
            display: block;
            margin: 20px auto;
            background-color: #44bd32;
            color: white;
            padding: 10px 18px;
            border-radius: 10px;
            text-align: center;
            width: fit-content;
            font-size: 16px;
            text-decoration: none;
        }
        .add-btn:hover {
            background-color: #4cd137;
        }
    </style>
</head>
<body>

<%
    // Fetch all student records
    List<StudentBean> list = StudentDAO.getAllRecords();
    request.setAttribute("list1", list);
%>

<h2>Registered Students</h2>

<div class="card-container">
    <c:forEach var="u" items="${list1}">
        <div class="card">
            <h3>${u.sname}</h3>
            <div class="details">
                <p><b>Roll No:</b> ${u.srollno}</p>
                <p><b>Email:</b> ${u.semail}</p>
                <p><b>Branch:</b> ${u.sbranch}</p>
                <p><b>Year:</b> ${u.syear}</p>
                <p><b>Section:</b> ${u.ssec}</p>
            </div>
            <div class="buttons">
                <a href="editform.jsp?id=${u.srollno}" class="btn edit">Edit</a>
                <a href="deletestudent.jsp?id=${u.srollno}" class="btn delete">Delete</a>
            </div>
        </div>
    </c:forEach>
</div>

<a href="insertstudentbean.jsp" class="add-btn">+ Add New Student</a>

</body>
</html>
