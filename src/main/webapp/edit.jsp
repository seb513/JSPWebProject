<%@page import="com.leapfrog.jspwebproject.dao.impl.DepartmentDAOImpl"%>
<%@page import="com.leapfrog.jspwebproject.dao.DepartmentDAO"%>
<%@page import="com.leapfrog.jspwebproject.entity.Department"%>
<%@include file="header.jsp" %>
<h1>Edit Department</h1>

<%
    DepartmentDAO deptDAO=new DepartmentDAOImpl();
    Department d=null;
    try{
        int id=0;
        if(request.getParameter("id")==null){
            response.sendRedirect("index.jsp?error");
        }
        id=Integer.parseInt(request.getParameter("id"));
        d=deptDAO.getById(id);
        if(d==null){
            response.sendRedirect("index.jsp?error");
        }
        
    }catch(Exception e){
        
    }
%>

<form action="save.jsp" method="post">
    <div class="form-group">
        <label>Name:</label>
        <input type="text" name="dept_name" required="required" placeholder="Enter Department Name" class="form-control" value="<%=d.getName()%>"/>
    </div>
    <div class="form-group">
        <label>Description</label>
        <textarea name="dept_desc" required="required" placeholder="Enter Department Description" class="form-control"><%=d.getDescription()%></textarea>
    </div>  
    
    <div class="checkbox">
        <label>Status</label>
        <label>
            <input type="checkbox" name="status" <% out.println(d.isStatus()?"checked='checked'":""); %> /> Active</label>
    </div>  
    <input type="hidden" name="id" value="<%=d.getId()%>"/>
    <button type="submit" class="btn btn-success">Save</button>
    <a href="index.jsp" class="btn btn-danger">Back</a>
        
</form>

        
<%@include file="footer.jsp" %>