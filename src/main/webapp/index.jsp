<%@page import="com.leapfrog.jspwebproject.dao.impl.DepartmentDAOImpl"%>
<%@page import="com.leapfrog.jspwebproject.dao.DepartmentDAO"%>
<%@page import="com.leapfrog.jspwebproject.entity.Department"%>
<%@include file="header.jsp" %>
<h1>Department</h1>

<%
    DepartmentDAO deptDAO=new DepartmentDAOImpl();
%>

<div class="pull-right">
    <p>
       <a href="add.jsp" class="btn btn-primary">
           <span class="glyphicon glyphicon-plus"/>
       </a> 
    </p>
</div>
<table class="table table-bordered table-hover table-striped">
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Description</th>
        <th>Added Date</th>
        <th>Modified Date</th>
        <th>Status</th>
        <th>Action</th>
    </tr>
    <% 
   
        for(Department d: deptDAO.getAll()){
    %>
    <tr>
        <td><%=d.getId()%></td>
        <td><%=d.getName()%></td>
        <td><%=d.getDescription()%></td>
        <td><%=d.getAddedDate()%></td>
        <td><%
        if(d.getModifiedDate()!=null){
            out.println(d.getModifiedDate());
        }
        %></td>
        <td><%=d.isStatus()%></td>
        <td>
            <a href="edit.jsp?id=<%=d.getId()%>" class="btn btn-success">
                <span class="glyphicon glyphicon-pencil"/>
            </a>
            <a href="delete.jsp?id=<%=d.getId()%>" class="btn btn-danger" onclick="return confirm('Are you sure want to delete?')">
            <span class="glyphicon glyphicon-trash"/>
            </a>
        </td>
    </tr>
    <%
        }
   
    %>
</table>
<%@include file="footer.jsp" %>