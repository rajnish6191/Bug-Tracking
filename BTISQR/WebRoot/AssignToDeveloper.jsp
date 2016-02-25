<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="com.dts.core.dao.*,com.dts.core.model.*,com.dts.core.util.*,com.dts.btisqr.model.*,com.dts.btisqr.dao.*" %>
<%@ page import="java.util.*,com.dts.dae.dao.*,com.dts.dae.model.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'AssignToDeveloper.jsp' starting page</title>
    
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
       try
       {
           int bugid = Integer.parseInt(request.getParameter("bugid"));
           String membername = request.getParameter("member");
           
           Bug aBug = new Bug();
           aBug.setBugID(bugid);
           aBug.setAssignedTo(membername);
           
           new BugDAO().assignBug(aBug);
       }
       catch(Exception e)
       {
          LoggerManager.writeLogWarning(e);
       }
       response.sendRedirect("ViewManagerBugs.jsp");
     %>
  </body>
</html>
