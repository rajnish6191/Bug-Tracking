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
	 <%
	  if(((String)session.getAttribute("role")).equals("tester"))
	  {
	 %>
	 <jsp:include page="Testeroptions.html"/> 
	 <%}
	 if(((String)session.getAttribute("role")).equals("developer"))
	 {
	 %>
	 <jsp:include page="Developeroptions.html"/> 
	 <%}
	 if(((String)session.getAttribute("role")).equals("manager"))
	 {
	 %>
	 <jsp:include page="Manageroptions.html"/> 
	 <%}
	  %>
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
               <legend class="style1">Bug Details</legend>
               <br /> 
              
               <%
	 if(((String)session.getAttribute("role")).equals("developer"))
	 {
	 %>
           <form id="form1" method="post" action="Solution.jsp" name="register">
	 <%}
	 if(((String)session.getAttribute("role")).equals("manager"))
	 {
	 %>
         <form id="form1" method="post" action="AssignToDeveloper.jsp" name="register">
	 <%}
	  %>
	
            
            
            <%
            try
            {
              int bugid = Integer.parseInt(request.getParameter("id"));
              CoreHash bCoreHash = (CoreHash)session.getAttribute("bugs");
              Bug aBug = (Bug)bCoreHash.get(new Integer(bugid));
              
             %>
             <input type="hidden" name="bugid" id="bugid" value="<%=aBug.getBugID()%>"/>
             <table width="376" border="0" align="center">
        <tr>
                     <td width="123" height="22"><span class="style2">Bug Name</span></td>
                     <td width="243">
                       
                  <div align="left">
                    <input type="text" name="bugname" id="bugname" value="<%=aBug.getBugName() %>" readonly/>
                  </div>               </td>
                </tr>
                   <tr>
                     <td height="24" class="style2">Project Name</td>
                     <td>
                     <%
                        CoreHash pCoreHash = new ProjectsDAO().getAllProject();
                     %> 
                       <input type="hidden" name="projectid" id="projectname" readonly value="<%=(aBug.getProjectID()) %>"/>
                       <input type="text" name="projectname" id="projectname" readonly value="<%=(((Project)pCoreHash.get(new Integer(aBug.getProjectID()))).getProjectName()) %>"/>
                     </td>
                   </tr>
                   <tr>
                     <td height="24"><span class="style2">Raised Date</span></td>
                     <td>
                       
                     <div align="left">
                       <input type="te" name="rdate" id="textfield2"  readonly="readonly" value="<%=(DateWrapper.parseDate(aBug.getRaisedDate1()))%>"/>
                     </div>
                     </td>
                   </tr>
                   <tr>
                     <td height="25"><span class="style2">Priority</span></td>
                     <td>
                     <%
                         		Bug bug = new Bug();
                                BugDAO bugdao = new BugDAO();               
             					CoreHash dCoreHash = bugdao.getPriorities();
                       %>
                       <input type="text" name="priorityid" id="priorityid" value="<%=((Bug)dCoreHash.get(new Integer(aBug.getPriorityID()))).getPriorityName()%>"  readonly/>
                     </td>
                   </tr>
                   <tr>
                     <td height="7"><span class="style2">Description</span></td>
                     <td><label>
                       <textarea name="desc" id="textarea" cols="30" rows="5" readonly><%=(aBug.getDescription()) %></textarea>
                     </label></td>
                   </tr>
                   <%
                 if(((String)session.getAttribute("role")).equals("manager"))
	    		 {
	   			%>
                   <tr>
                     <td height="7"><span class="style2">Member</span></td>
                     <td><label>
                       <select name="member">
                       <%
                           CoreHash aCoreHash = new ProjectsDAO().getProjectMembers((String)session.getAttribute("user"));
                           Enumeration enu = aCoreHash.elements();
                           Project aProject = null;
                           while(enu.hasMoreElements())
                           {
                               aProject = (Project)enu.nextElement();
                               if(aProject.getRole().equals("developer")) 
                               {
                        %>
                       <option><%=(aProject.getMemberName())%></option>
                       <%  }} %>
                       </select>
                     </label></td>
                   </tr>
                   <%} else{%>
                   <tr>
                     <td height="7"><span class="style2">Solution</span></td>
                     <td><label>
                       <textarea name="solution" id="textarea" cols="30" rows="5" ></textarea>
                     </label></td>
                   </tr>
                 <%}
                 if(((String)session.getAttribute("role")).equals("manager"))
	    		 {
	   			%>
	   			 <tr>
                     <td colspan="2"><div align="center">
                       <input type="submit" name="button" id="button" value="Assign" />
                     </div></td>
                   </tr>
                <%} 
                 if(((String)session.getAttribute("role")).equals("developer"))
	    		 {
	   			%>
	   			 <tr>
                     <td colspan="2"><div align="center">
                       <input type="submit" name="button" id="button" value="Resolve" />
                     </div></td>
                   </tr>
                <%}%>
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
