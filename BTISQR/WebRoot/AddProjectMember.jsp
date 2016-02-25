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
.style2 {
	color: #000000;
	font-weight: bold;
}
-->
</style>
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
	    <table width="646" height="255" border="0">
          <tr>
            <td width="255" height="208" valign="top"><img src="images/img07.jpg" alt="" width="114" height="114" class="left" /></td>
            <td width="381" valign="top"><p>&nbsp;</p>
            
            <fieldset>
               <legend class="style1">Add Member to Project</legend>
               <br /> 
            <form id="form1" method="post" action="AddMemberAction.jsp" name="anp">
            <%
              try
              {
              
               String loginname = (String)session.getAttribute("user");
               CoreHash aCoreHash = new ProjectsDAO().getManagerProjects(loginname);
               CoreHash mCoreHash = null;
               if(request.getParameter("role")!=null)
               {
                   mCoreHash = new ProjectsDAO().getFreeMemebers(request.getParameter("role"));   
               }   
                 
                    
                   
             
             %>
              <table width="280" border="0" align="center">
             <tr>
                     <td width="118" height="27"><span class="style2">Project Name</span></td>
                     <td width="152">
                       
                  <div align="left">
                    <label>
                    <select name="projectid" id="projectid">
                    <%
                        Enumeration enu = aCoreHash.elements();
                        Project aProject = null;
                        String select = "";
                        while(enu.hasMoreElements())
                        {
                           select = "";
                           aProject = (Project)enu.nextElement();
                           if(request.getParameter("projectid")!=null)
                           {
                           		if(Integer.parseInt(request.getParameter("projectid"))==aProject.getProjectID())
                           		{
                              		select = "selected";
                           		}
                           }
                      %>
                      <option value="<%=aProject.getProjectID()%>" <%=select%>><%=aProject.getProjectName()%></option>
                      <%
                      } %>
                     
                    </select>
                    </label>
                  </div>               </td>
                </tr>
                   <tr>
                     <td height="28"><span class="style2">Role</span></td>
                     <td>
                       
                     <div align="left">
                       <label>
                       <select name="role" id="role" onChange="javascript:location.href='AddProjectMember.jsp?role='+document.anp.role.value+'&projectid='+document.anp.projectid.value">
                               <option>--Select--</option>
                                <%
                                select = "";
                                if(request.getParameter("role")!=null)
                          		{
                          		   if(request.getParameter("role").equals("tester"))
                          		   {  
                          		   		select = "selected";
                          		   }
                          		}   
                          		%>
                               <option value="developer" <%=select%>>Developer</option>
                               <option value="tester" <%=select%>>Tester</option>
                       </select>
                       </label>
                     </div>                     </td>
                   </tr>
                   <tr>
                     <td height="27"><span class="style2">Member</span></td>
                     <td><label>
                       <select name="member" id="member">
                       <%
                          if(request.getParameter("role")!=null)
                          {
                          	enu = mCoreHash.elements();
                        	aProject = null;
                        	
                        	while(enu.hasMoreElements())
                        	{
                                aProject = (Project)enu.nextElement();
                           %>
                      <option><%=aProject.getMemberName()%></option>
                      <%
                      }} %>
                     </select>
                     </label></td>
                   </tr>
                   <tr>
                     <td height="7">                                          </td>
                     <td></td>
                   </tr>
                   <tr>
                     <td colspan="2"><div align="center">
                       <input type="submit" name="button" id="button" value="Add" />
                     </div></td>
                   </tr>
              </table>
              <%
              }
              catch(Exception e)
              {
                 LoggerManager.writeLogWarning(e);
              }
              
               %>
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
