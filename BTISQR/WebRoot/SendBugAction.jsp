<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="com.dts.core.dao.*,com.dts.core.model.*,com.dts.dae.dao.*,com.dts.dae.model.*,com.dts.btisqr.dao.*,com.dts.btisqr.model.*"%>
<%@ page import="com.dts.core.util.*,java.util.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'SendBugAction.jsp' starting page</title>
    
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
         String bugname = request.getParameter("bugname");
         int projectid = Integer.parseInt(request.getParameter("projectid"));
         String rdate = (request.getParameter("rdate"));
         String raisedby = (String)session.getAttribute("user");
         int priorityid = Integer.parseInt(request.getParameter("priorityid"));
         String desc = request.getParameter("desc");
         String status = "Pending";
         
         Bug bug = new Bug();
         bug.setBugName(bugname);
         bug.setProjectID(projectid); 
         bug.setRaisedDate(rdate);
         bug.setRaisedBy(raisedby);
         bug.setPriorityID(priorityid);
         bug.setDescription(desc);
         bug.setStatus(status);
         
         new BugDAO().addBug(bug);
      }
      catch(Exception e)
      {
         LoggerManager.writeLogInfo(e);
      }
      response.sendRedirect("ViewBugStatus.jsp");
    %>
  </body>
</html>
