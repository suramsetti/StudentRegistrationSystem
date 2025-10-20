<%@page import="com.lbrce.it.jspdao.StudentDAO,com.lbrce.it.jspjdbcusingbean.StudentBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Student</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f5f6fa;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        .card {
            background-color: #ffffff;
            padding: 30px 40px;
            border-radius: 15px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            width: 420px;
        }
        h3 {
            text-align: center;
            color: #273c75;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            margin-top: 10px;
            color: #353b48;
        }
        input, select {
            margin-top: 5px;
            padding: 8px;
            border-radius: 8px;
            border: 1px solid #ccc;
            font-size: 14px;
        }
        .btn {
            margin-top: 20px;
            padding: 10px;
            border-radius: 10px;
            border: none;
            color: white;
            font-size: 15px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .update {
            background-color: #00a8ff;
        }
        .update:hover {
            background-color: #0097e6;
        }
        .cancel {
            background-color: #e84118;
        }
        .cancel:hover {
            background-color: #c23616;
        }
        .button-container {
            display: flex;
            justify-content: space-between;
        }
    </style>
</head>
<body>
<%
    String id= request.getParameter("id");
    StudentBean u = StudentDAO.getRecordById(id);
%>
 

<div class="card">
    <h3>Edit Student Details</h3>
    <form action="editstudent.jsp" method="post">
        <label>Roll No:</label>
        <input type="text" name="srollno" value="<%= u.getsrollno() %>" readonly>

        <label>Name:</label>
        <input type="text" name="sname" value="<%= u.getsname() %>" required>

        <label>Email:</label>
        <input type="email" name="semail" value="<%= u.getsemail() %>" required>

        <label>Branch:</label>
        <select name="sbranch" required>
            <option value="IT" <%= u.getsbranch().equals("IT") ? "selected" : "" %>>IT</option>
            <option value="CSE" <%= u.getsbranch().equals("CSE") ? "selected" : "" %>>CSE</option>
            <option value="ECE" <%= u.getsbranch().equals("ECE") ? "selected" : "" %>>ECE</option>
            <option value="EEE" <%= u.getsbranch().equals("EEE") ? "selected" : "" %>>EEE</option>
        </select>

        <label>Year:</label>
        <select name="syear" required>
            <option value="I" <%= u.getsyear().equals("I") ? "selected" : "" %>>I</option>
            <option value="II" <%= u.getsyear().equals("II") ? "selected" : "" %>>II</option>
            <option value="III" <%= u.getsyear().equals("III") ? "selected" : "" %>>III</option>
            <option value="IV" <%= u.getsyear().equals("IV") ? "selected" : "" %>>IV</option>
        </select>

        <label>Section:</label>
        <select name="ssec" required>
            <option value="A" <%= u.getssec().equals("A") ? "selected" : "" %>>A</option>
            <option value="B" <%= u.getssec().equals("B") ? "selected" : "" %>>B</option>
        </select>

        <div class="button-container">
            <input type="submit" value="Update" class="btn update">
            <button type="button" class="btn cancel" onclick="window.location.href='studentsdisplay.jsp'">Cancel</button>
        </div>
    </form>
</div>

</body>
</html>
