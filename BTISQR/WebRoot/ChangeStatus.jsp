
<%@ page import="com.dts.dae.dao.ProfileDAO,com.dts.core.util.LoggerManager"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'UDInventoryAction.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	

  </head>
  
  <body>
     <%
         String target=request.getParameter("page")+"?header=list&area="+request.getParameter("area1");
      try{
            ProfileDAO aProfiledao = new ProfileDAO();
            String ch[] = request.getParameterValues("ch");
            
            for(int i=1;i<ch.length;i++)
            {
            
                aProfiledao.changeAccountStatus(ch[i].substring(0,ch[i].lastIndexOf(",")), Integer.parseInt(ch[i].substring(ch[i].lastIndexOf(",")+1,ch[i].length())));
            }
         }
         catch(Exception e)
         {
           LoggerManager.writeLogWarning(e);
         }
        response.sendRedirect(target);
                
     %>
  </body>
</html>
