<%@ page language="java" pageEncoding="ISO-8859-1"%>
<%@ page
	import="com.dts.dae.dao.ProfileDAO,com.dts.dae.model.Profile,com.dts.dae.dao.SecurityDAO"%>  
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'RegisterAction.jsp' starting page</title>

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
		<br>
		<%
			String target = "LoginForm.jsp?ls=Invalid username and password";
				try{
				 Profile  rb=new Profile();
				 String username = request.getParameter("username");
		         rb.setLoginID(username);
		         rb.setPassword(request.getParameter("password"));
		         
		         String role=new SecurityDAO().loginCheck(rb);
		         if(role.equals("admin"))
		         { 
		            target = "AdminHome.jsp?status=Welcome "+username;
		            session.setAttribute("user",username);
		            session.setAttribute("role",role);
		         }
		         else if(role.equals("manager"))
		         { 
		            target = "ManagerHome.jsp?status=Welcome "+username;
		            session.setAttribute("user",username);
		            session.setAttribute("role",role);
		         } 
		         else if(role.equals("developer"))
		         {
		            int status = new SecurityDAO().checkFirstLogin(username);
		           if(status==1)
		            	target = "DeveloperHome.jsp?status=Welcome "+username;
		            else if(status==0)
		                target = "DeveloperHome.jsp?status=Welcome "+username;
		            else
		                target = "LoginForm.jsp?ls=Invalid username and password";    	
		            session.setAttribute("user",username);
		            session.setAttribute("role",role);
		         } 
		         else if(role.equals("tester"))
		         { 
		            target = "TesterHome.jsp?status=Welcome "+username;
		            session.setAttribute("user",username);
		            session.setAttribute("role",role);
		         } 
		         else  
		            target = "LoginForm.jsp?ls=Invalid username and password";
		            }catch(Exception e){e.printStackTrace();} 
		        response.sendRedirect(target);
		%>
	</body>
</html>
