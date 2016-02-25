<%@ page language="java" import="java.util.*,java.sql.*"  pageEncoding="ISO-8859-1"%>
<%@ page import="com.dts.core.dao.*,com.dts.core.model.*,com.dts.core.util.*,com.dts.btisqr.model.*,com.dts.btisqr.dao.*" %>
<%@ page import="java.util.*"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    
    <title>My JSP 'InsertAction.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <% 
      String target="ListBugs.jsp?header=list";
      try{
            com.dts.btisqr.dao.BugDAO bugdao = new com.dts.btisqr.dao.BugDAO();
            String ch[] = request.getParameterValues("ch");
            
            for(int i=1;i<ch.length;i++)
            {
                bugdao.deleteBug(Integer.parseInt(ch[i]));
            }
         }
         catch(Exception e)
         {
           	e.printStackTrace();
         }
            response.sendRedirect(target);
    
    
     %>
  </body>
</html>
