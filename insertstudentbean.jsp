<%@page import="com.lbrce.it.jspdao.StudentDAO,java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Student</title>
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
            width: 400px;
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
        input[type="submit"] {
            background-color: #44bd32;
            color: white;
            border: none;
            margin-top: 20px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        input[type="submit"]:hover {
            background-color: #4cd137;
        }
        .view-btn {
            display: block;
            margin: 20px auto;
            background-color: #0097e6;
            color: white;
            padding: 8px 16px;
            border-radius: 8px;
            text-align: center;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="card">
        <h3>Student Registration</h3>
        <form method="POST" action="insertstudentbean.jsp">
            <label>Enter Roll No:</label>
            <input type="text" name="srollno" required>

            <label>Enter Name:</label>
            <input type="text" name="sname" required>

            <label>Enter Email:</label>
            <input type="email" name="semail" required>

            <label>Choose Branch:</label>
            <select name="sbranch" required>
                <option value="">Select</option>
                <option value="IT">IT</option>
                <option value="CSE">CSE</option>
                <option value="ECE">ECE</option>
                <option value="EEE">EEE</option>
            </select>

            <label>Choose Year:</label>
            <select name="syear" required>
                <option value="">Select</option>
                <option value="I">I</option>
                <option value="II">II</option>
                <option value="III">III</option>
                <option value="IV">IV</option>
            </select>

            <label>Choose Section:</label>
            <select name="ssec" required>
                <option value="">Select</option>
                <option value="A">A</option>
                <option value="B">B</option>
            </select>

            <input type="submit" value="Add Student">
        </form>

        <jsp:useBean id="stu" class="com.lbrce.it.jspjdbcusingbean.StudentBean" scope="request" />
        <jsp:setProperty name="stu" property="*" />

        <%
            int count = 0;
            count = StudentDAO.myinsert(stu);
            if(count == 0){
                out.println("<p style='color:red;text-align:center;'>❌ Registration failed!</p>");
            } else {
                out.println("<p style='color:green;text-align:center;'>✅ Registration successful!</p>");
            }
        %>

        <a href="studentsdisplay.jsp" class="view-btn">View All Students</a>
    </div>
</body>
</html>
