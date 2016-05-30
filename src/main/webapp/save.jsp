<%@page import="java.util.Calendar"%>
<%@page import="com.leapfrog.jspwebproject.entity.Department"%>
<%@page import="com.leapfrog.jspwebproject.dao.impl.DepartmentDAOImpl"%>
<%@page import="com.leapfrog.jspwebproject.dao.DepartmentDAO"%>
<%
    if(!request.getMethod().equalsIgnoreCase("POST"))
    {
        response.sendRedirect("index.jsp?error");
    }
    int id=0;
    
    DepartmentDAO deptDAO=new DepartmentDAOImpl();
    Department d=new Department();
    d.setName(request.getParameter("dept_name"));
    d.setDescription(request.getParameter("dept_desc"));
    d.setStatus((request.getParameter("status")!=null)?true:false);
    try{
        if(request.getParameter("id")!=null && request.getParameter("id").isEmpty())
        {    
            if(deptDAO.insert(d) >0){
                response.sendRedirect("index.jsp?success");
            }
            else{
                out.println("<h1>ERROR!!!!</h1>");
                out.println("<a href='javascript:history.back()'>Something went wrong please go back</a>");
            }
        }
        else{
            d.setId(Integer.parseInt(request.getParameter("id")));
            d.setModifiedDate(Calendar.getInstance().getTime());
            if(deptDAO.update(d) >0){
                response.sendRedirect("index.jsp?success");
            }
            else{
                out.println("<h1>ERROR!!!!</h1>");
                out.println("<a href='javascript:history.back()'>Something went wrong please go back</a>");
            }            
        }
    }catch(Exception e){
        out.println(e.getMessage());
    }
    
    
%>