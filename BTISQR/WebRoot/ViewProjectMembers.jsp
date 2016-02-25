<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page import="com.dts.core.dao.*,com.dts.core.model.*,com.dts.core.util.*,com.dts.btisqr.model.*,com.dts.btisqr.dao.*" %>
<%@ page import="java.util.*,com.dts.dae.dao.*,com.dts.dae.model.*"%>
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
	    <table width="709" height="255" border="0">
          <tr>
            <td width="138" height="208" valign="top"><img src="images/img07.jpg" alt="" width="114" height="114" class="left" /></td>
            <td width="561" valign="top"><p>&nbsp;</p>
            
            <fieldset>
               <legend class="style1">View Project Members</legend>
               <br /> 
            <form name="f" method="post" action="ChangeStatus.jsp">
 <input type="hidden" name="page" value="ViewMembers.jsp"/>

    <table width="550" border="0" align="center" bordercolor="#8692E3">
    
      <tr bgcolor="#EEC26F">
      <%
         String loginname = (String)session.getAttribute("user");
	     String role = (String) session.getAttribute("role");
	     CoreHash aCoreHash = null;
	     try{
             
             int status = 0;
             
             aCoreHash = new ProjectsDAO().getProjectMembers(loginname);
             session.setAttribute("members",aCoreHash); 
             if(!aCoreHash.isEmpty())
         	{
         %>
         <td width="118"><div align="center" class="style2 style8"><strong>Project Name</strong></div></td>
        <td width="138"><div align="center" class="style2 style8"><strong>Member Name</strong></div></td>
        <td width="138"><div align="center" class="style2 style8"><strong>Role</strong></div></td>
            
        </tr>
          <%
          	 int projectid = 0;
			 Enumeration enu = aCoreHash.elements();
			 Project project = null;
			 String select = "";
			 while(enu.hasMoreElements())
			 {
			        project = (Project)enu.nextElement();
			        projectid = project.getProjectID();
          				         				
          %>
      <tr bgcolor="#CEC9FA">
     
        <td bgcolor="#C3D7BA"><div align="center" class="style7"><%=(project.getProjectName())%></div></td> 
        <td bgcolor="#C3D7BA"><div align="center" class="style7"><%=(project.getMemberName())%></div></td>
        <td bgcolor="#C3D7BA"><div align="center" class="style7"><%=(project.getRole())%></div></td>
        
        </tr>
      <%
      	}
      		} else {
      %>
         <tr><td height="24" colspan="5"><div align="center" class="style3"><strong>No Records Found</strong></div></td>
         </tr>
      <%
      	}
      	} catch (Exception e) {
      		LoggerManager.writeLogWarning(e);
      	}
      	
      %>
      <tr>
        <td colspan="5"><div align="center">
         
          <input type="button" name="button" id="button" value="Add New" onClick="javascript:location.href='DispatchController?page=AddProjectMember.jsp&tpage=ViewMembers.jsp?header=list'"/>
          &nbsp;
         
        </div></td>
      </tr>
      
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
