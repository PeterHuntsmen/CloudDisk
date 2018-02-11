<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>


<html>
  <head>
    
  </head>
  
  <body>
    <%
    session.invalidate();
    response.sendRedirect("index.jsp");
    %>
  </body>
</html>
