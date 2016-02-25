<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page import="com.dts.core.dao.*,com.dts.core.model.*,com.dts.dae.dao.*,com.dts.dae.model.*,com.dts.btisqr.dao.*,com.dts.btisqr.model.*"%>
<%@ page import="com.dts.core.util.*,java.util.*"%>
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
 <script type="text/javascript" src="scripts/general.js"> </script>
   <script type="text/javascript" src="scripts/ts_picker.js"> </script>

</head>
<body>
<!-- start header -->
<div id="logo">
	<h1><jsp:include page="header.html"/></h1>
	
</div>
<div id="menu">
	<ul>
	 <jsp:include page="Testeroptions.html"/> 
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
               <legend class="style1">Send Bug</legend>
               <br /> 
            <form id="form1" method="post" action="SendBugAction.jsp" name="register">
            <%
            try
            {
             %>
              <table width="376" border="0" align="center">
        <tr>
                     <td width="123" height="22"><span class="style2">Bug Name</span></td>
                     <td width="243">
                       
                  <div align="left">
                    <input type="text" name="bugname" id="bugname" />
                  </div>               </td>
                </tr>
                   <tr>
                     <td height="24" class="style2">Project Name</td>
                     <td>
                     <%
                        Project aProject = new ProjectsDAO().getProject((String)session.getAttribute("user"));
                     %>
                       <input type="hidden" name="projectid" id="projectname" readonly value="<%=aProject.getProjectID() %>"/>
                       <input type="text" name="projectname" id="projectname" readonly value="<%=aProject.getProjectName() %>"/>
                     </td>
                   </tr>
                   <tr>
                     <td height="24"><span class="style2">Raised Date</span></td>
                     <td>
                       
                     <div align="left">
                       <input type="te" name="rdate" id="textfield2"  readonly="readonly" value="<%=DateWrapper.parseDate(new Date())%>"/>
                     </div>                     </td>
                   </tr>
                   <tr>
                     <td height="25"><span class="style2">Priority</span></td>
                     <td>
                       <select name="priorityid" id="priorityid">
                      <%
                         		Bug bug = new Bug();
                                BugDAO bugdao = new BugDAO();               
             					CoreHash dCoreHash = bugdao.getPriorities();    
             					session.setAttribute("priorities",dCoreHash);
             					Enumeration enu = dCoreHash.elements();
             					while(enu.hasMoreElements())
             					{
             					   bug = (Bug)enu.nextElement();
                       %>
                                 <option value="<%=bug.getPriorityID()%>"><%=bug.getPriorityName()%></option> 
                               <%} %>
                                             </select>
                     </td>
                   </tr>
                   <tr>
                     <td height="7"><span class="style2">Description</span></td>
                     <td><label>
                       <textarea name="desc" id="textarea" cols="30" rows="5"></textarea>
                     </label></td>
                   </tr>
                   <tr>
                     <td colspan="2"><div align="center">
                       <input type="submit" name="button" id="button" value="Send" />
                     </div></td>
                   </tr>
              </table>
            </form>
            </fieldset></td>
          </tr>
      </table>
    <%}
    catch(Exception e)
    {
       LoggerManager.writeLogWarning(e);
    } %>
	  
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
