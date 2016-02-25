<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page import="com.dts.core.dao.*,com.dts.core.model.*,com.dts.core.util.*,com.dts.btisqr.model.*,com.dts.btisqr.dao.*" %>
<%@ page import="java.util.*"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="default.css" rel="stylesheet" type="text/css" media="screen" />
<style type="text/css">
<!--
.style1 {
	font-size: 16px;
	font-weight: bold;
}
.style2 {color: #000000}
.style3 {color: #000000; font-weight: bold; }
-->
</style>
<script type="text/javascript" src="scripts/general.js"></script>
</head>
<body>
<!-- start header -->
<div id="logo">
	<h1><jsp:include page="header.html"/></h1>
	
</div>
<div id="menu">
	<ul>
	 <jsp:include page="Manageroptions.html"/>  
	</ul>
</div>
<!-- end header -->
<hr />
<!-- start latest post -->
<div id="latest-post" class="wide-post">
	<h1 class="title"><a href="#">Welcome to Bug Tracking System!</a></h1>
	<div class="entry">
	  <p>&nbsp;</p>
	    <table width="687" height="255" border="0">
          <tr>
            <td width="138" height="208" valign="top"><img src="images/img07.jpg" alt="" width="114" height="114" class="left" /></td>
            <td width="539" valign="top"><p>&nbsp;</p>
            
            <fieldset>
               <legend class="style1">View Projects</legend>
               <br /> 
            <form name="f" method="post" action="DeleteProjectAction.jsp">
             
                <input type="hidden" name="page" value="ViewProjects.jsp"/>
                <table width="509" border="0" bordercolor="#8692E3">
                  <tr bgcolor="#509C16">
                    <%
         String header = request.getParameter("header");
	     String role = (String) session.getAttribute("role");
	     String loginname = (String)session.getAttribute("user");
	      CoreList aCoreList = new CoreList();
	      CoreHash dCoreHash = new CoreHash();
	     try{
             int projectid = 0;
             int status = 0;
             ProjectsDAO projectsdao = new ProjectsDAO();
             
             dCoreHash = projectsdao.getManagerProjects(loginname);  
             session.setAttribute("projects",dCoreHash);
             if(!dCoreHash.isEmpty())
         	{
        %>
                    <td width="175" bgcolor="#E7B04F"><div align="center" class="style2 style8"><strong>Project Name</strong></div></td>
                    <td width="111" bgcolor="#E7B04F"><div align="center" class="style2 style8"><strong>Start Date</strong></div></td>
                    <td width="108" bgcolor="#E7B04F"><div align="center" class="style2 style8"><strong>End Date</strong></div></td>
                    <td width="75" bgcolor="#E7B04F"><div align="center" class="style2 style8"><strong>Status</strong></div></td>
                  </tr>
                  <%
          	Enumeration enu = dCoreHash.elements();
          			Project aProject;
          			while (enu.hasMoreElements()) {
          				aProject = (Project) enu.nextElement();
          				projectid = aProject.getProjectID();
          				         				
          %>
                  <tr bgcolor="#CEC9FA">
                  
                    <td bgcolor="#C3D7BA"><div align="center" class="style7"><%=(aProject.getProjectName())%></div></td>
                    <td bgcolor="#C3D7BA"><div align="center" class="style7"><%=DateWrapper.parseDate(aProject.getStartDate1())%></div></td>
                    <td bgcolor="#C3D7BA"><div align="center"><span class="style7"><%=DateWrapper.parseDate(aProject.getEndDate1())%></span></div></td>
                    <td bgcolor="#C3D7BA"><div align="center"><span class="style7"><%=(aProject.getStatus())%></span></div></td>
                  </tr>
                  <%
      	}
      		} else {
      %>
                  <tr>
                    <td height="24" colspan="5"><div align="center" class="style3"><strong>No Records Found</strong></div></td>
                  </tr>
                  <%
      	}
      	} catch (Exception e) {
      		LoggerManager.writeLogWarning(e);
      	}
      
       %>
                </table>
            </form>
            </fieldset></td>
          </tr>
      </table>
    
	  
  </div>
  <div class="bottom"></div>
</div>
<!-- end latest post -->
<!-- start recent posts & comments -->
<div id="recents" class="two-columns"></div>
<!-- end recent posts & comments -->
<!-- start submenu -->
<div id="submenu"></div>
<!-- end submenu -->

</body>
</html>
