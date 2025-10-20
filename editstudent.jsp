<%@page import="com.lbrce.it.jspdao.StudentDAO"%>
<jsp:useBean id="stu" class="com.lbrce.it.jspjdbcusingbean.StudentBean"></jsp:useBean>
<jsp:setProperty property="*" name="stu"/>

<%
    int status=StudentDAO.myupdate(stu);
    if(status==0){
%>
        <script>
                window.alert("Record not updated.");
                window.location = "studentsdisplay.jsp";
        </script>
<%
    }
    if(status>0){
%>
     <script>
                window.alert("Record updated successfully..................");
                window.location = "studentsdisplay.jsp";
        </script>
<%
    }
%>