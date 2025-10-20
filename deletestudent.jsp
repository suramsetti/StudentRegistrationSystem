<%@page import="com.lbrce.it.jspdao.StudentDAO,com.lbrce.it.jspjdbcusingbean.StudentBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Student</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f5f6fa;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
        }
        .card {
            background-color: #ffffff;
            padding: 40px 50px;
            border-radius: 15px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            width: 420px;
            text-align: center;
        }
        h2 {
            color: #e84118;
            margin-bottom: 20px;
        }
        p {
            color: #353b48;
            font-size: 15px;
        }
        .details {
            text-align: left;
            background-color: #f1f2f6;
            padding: 15px;
            border-radius: 10px;
            margin-top: 15px;
            margin-bottom: 25px;
        }
        .details p {
            margin: 6px 0;
        }
        .btn {
            padding: 10px 20px;
            border-radius: 10px;
            border: none;
            color: white;
            font-size: 15px;
            cursor: pointer;
            transition: background-color 0.3s;
            margin: 0 10px;
        }
        .delete {
            background-color: #e84118;
        }
        .delete:hover {
            background-color: #c23616;
        }
        .cancel {
            background-color: #718093;
        }
        .cancel:hover {
            background-color: #636e72;
        }
        .success {
            color: green;
            font-weight: bold;
        }
        .error {
            color: red;
            font-weight: bold;
        }
    </style>
</head>
<body>
<%
    String id = request.getParameter("id");
    StudentBean u = StudentDAO.getRecordById(id);  // ✅ FIXED

    // Confirmation check
    String confirm = request.getParameter("confirm");
    if (confirm != null && confirm.equals("yes")) {
        int status = StudentDAO.mydelete(u);  // ✅ FIXED
        if (status > 0) {
            out.println("<div class='card'><h2>✅ Student Deleted</h2>");
            out.println("<p class='success'>Student record deleted successfully!</p>");
            out.println("<button class='btn cancel' onclick=\"window.location.href='studentsdisplay.jsp'\">Back to Students</button></div>");
        } else {
            out.println("<div class='card'><h2>❌ Error</h2>");
            out.println("<p class='error'>Unable to delete the record. Please try again.</p>");
            out.println("<button class='btn cancel' onclick=\"window.location.href='studentsdisplay.jsp'\">Back</button></div>");
        }
        return;
    }
%>

<div class="card">
    <h2>Confirm Deletion</h2>
    <p>Are you sure you want to delete this student?</p>

    <div class="details">
        <p><b>Roll No:</b> <%= u.getsrollno() %></p>
        <p><b>Name:</b> <%= u.getsname() %></p>
        <p><b>Email:</b> <%= u.getsemail() %></p>
        <p><b>Branch:</b> <%= u.getsbranch() %></p>
        <p><b>Year:</b> <%= u.getsyear() %></p>
        <p><b>Section:</b> <%= u.getssec() %></p>
    </div>

    <form method="post" action="deletestudent.jsp">
        <input type="hidden" name="id" value="<%= u.getsrollno() %>">
        <input type="hidden" name="confirm" value="yes">
        <button type="submit" class="btn delete">Delete</button>
        <button type="button" class="btn cancel" onclick="window.location.href='studentsdisplay.jsp'">Cancel</button>
    </form>
</div>

</body>
</html>
