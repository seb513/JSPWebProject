<%@page import="com.leapfrog.jspwebproject.dao.impl.DepartmentDAOImpl"%>
<%@page import="com.leapfrog.jspwebproject.dao.DepartmentDAO"%>
<%@page import="com.leapfrog.jspwebproject.entity.Department"%>
<%@include file="header.jsp" %>
<h1>Department</h1>

<%
    try{
    DepartmentDAO deptDAO=new DepartmentDAOImpl();
    int id = Integer.parseInt(request.getParameter("id"));
    deptDAO.delete(id);
    response.sendRedirect("index.jsp?success");
    }catch(Exception e){
        out.println(e.getMessage());
    }
%>

<%@include file="footer.jsp" %>