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
    
    <title>My JSP 'NewProjectAction.jsp' starting page</title>
    
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
         String projectname = request.getParameter("projectname");
         String startdate = DateWrapper.parseDate(request.getParameter("sdate"));
         String enddate = DateWrapper.parseDate(request.getParameter("edate"));
         String managerid = request.getParameter("managerid");
         
         
         Project project = new Project();
         project.setProjectName(projectname);
         project.setStartDate(startdate);
         project.setEndDate(enddate);
         project.setAssignedTo(managerid);
         project.setStatus("Process");
         
         new ProjectsDAO().addProject(project);
         
      }
      catch(Exception e)
      { 
         LoggerManager.writeLogWarning(e); 
      }
      response.sendRedirect("ViewProjects.jsp?header=list");
     %>
  </body>
</html>
