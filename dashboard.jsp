<%@page import="com.lbrce.it.jspdao.StudentDAO, com.lbrce.it.jspjdbcusingbean.StudentBean, java.util.List"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="header.jsp" />

<%
    List<StudentBean> list = StudentDAO.getAllRecords();
    int totalStudents = list.size();
    int itCount = 0, cseCount = 0, eceCount = 0, eeeCount = 0;

    for (StudentBean s : list) {
        String branch = s.getsbranch().trim();
        if (branch.equalsIgnoreCase("IT")) itCount++;
        else if (branch.equalsIgnoreCase("CSE")) cseCount++;
        else if (branch.equalsIgnoreCase("ECE")) eceCount++;
        else if (branch.equalsIgnoreCase("EEE")) eeeCount++;
    }
%>

<div class="container mt-5">
    <h1 class="text-center mb-4">LBRCE Student Dashboard</h1>
    <div class="row g-4 justify-content-center">
        <div class="col-md-3">
            <div class="card text-white bg-primary shadow">
                <div class="card-body text-center">
                    <h5>Total Students</h5>
                    <h2><%= totalStudents %></h2>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card text-white bg-success shadow">
                <div class="card-body text-center">
                    <h5>IT</h5>
                    <h2><%= itCount %></h2>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card text-white bg-info shadow">
                <div class="card-body text-center">
                    <h5>CSE</h5>
                    <h2><%= cseCount %></h2>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card text-dark bg-warning shadow">
                <div class="card-body text-center">
                    <h5>ECE</h5>
                    <h2><%= eceCount %></h2>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card text-white bg-danger shadow">
                <div class="card-body text-center">
                    <h5>EEE</h5>
                    <h2><%= eeeCount %></h2>
                </div>
            </div>
        </div>
    </div>

    <!-- Pie Chart -->
    <div class="row mt-5">
        <div class="col-md-6 mx-auto">
            <canvas id="branchChart"></canvas>
        </div>
    </div>

    <!-- Quick Actions -->
    <div class="text-center mt-5">
        <button class="btn btn-outline-primary mx-2" onclick="window.location.href='insertstudentbean.jsp'">➕ Add Student</button>
        <button class="btn btn-outline-success mx-2" onclick="window.location.href='studentsdisplay.jsp'">📋 View Students</button>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    const ctx = document.getElementById('branchChart').getContext('2d');
    new Chart(ctx, {
        type: 'pie',
        data: {
            labels: ['IT', 'CSE', 'ECE', 'EEE'],
            datasets: [{
                data: [<%= itCount %>, <%= cseCount %>, <%= eceCount %>, <%= eeeCount %>],
                backgroundColor: ['#198754', '#0dcaf0', '#ffc107', '#dc3545'],
                borderWidth: 1
            }]
        },
        options: {
            plugins: {
                legend: { position: 'bottom' }
            }
        }
    });
</script>

<jsp:include page="footer.jsp" />
