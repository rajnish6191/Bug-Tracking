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
.style2 {
	color: #000000;
	font-weight: bold;
}
.style3 {font-weight: bold}
.style4 {color: #000000}
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
	 if(((String)session.getAttribute("role")).equals("admin"))
	 {
	 %>
	 <jsp:include page="Adminoptions.html"/> 
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
	    <table width="714" height="255" border="0">
          <tr>
            <td width="138" height="208" valign="top"><img src="images/img07.jpg" alt="" width="114" height="114" class="left" /></td>
            <td width="566" valign="top">
            
         <fieldset>
               <legend class="style1">Search</legend>
               <br /> 
            <form id="form1" method="post" action="Search.jsp">
            <%CoreHash dCoreHash = null;
	          CoreHash pCoreHash = null;
	          CoreHash prCoreHash = null;
	     try{
            
             int status = 0;
             BugDAO bugdao = new BugDAO();
             pCoreHash = new BugDAO().getPriorities();
             dCoreHash = bugdao.getBugs();
             prCoreHash = new ProjectsDAO().getAllProject();
             %>    
              <table width="538" border="0" align="center">
<tr>
                     <td width="23" height="28"><span class="style2">Bug</span></td>
<td width="126"><label>
                       <select name="Bugid" id="select3">
                       <option>--Select--</option>
                       <%
                        Enumeration enu = dCoreHash.keys();
                        int id= 0;
                        while(enu.hasMoreElements())
                        {
                           id = ((Integer)enu.nextElement()).intValue();
                        %>
                        
                        <option value="<%=id%>"><%=((Bug)dCoreHash.get(new Integer(id))).getBugName()%></option>
                        <%} %>
                       </select>
                     </label></td>
                  
                <td width="43" height="26"><span class="style2">Project</span></td>
<td width="113"><label>
                       <select name="Projectid" id="select">
                         <option>--Select--</option>
                       <%
                        enu = prCoreHash.keys();
                        id= 0;
                        while(enu.hasMoreElements())
                        {
                           id = ((Integer)enu.nextElement()).intValue();
                        %>
                        
                        <option value="<%=id%>"><%=(((Project)prCoreHash.get(new Integer(id))).getProjectName())%></option>
                        <%} %>
                       </select>
                     </label></td>
                  
                <td width="57" height="27"><span class="style2">Priority</span></td>
<td width="150"><label>
                       <select name="Priorityid" id="select2">
                         <option>--Select--</option>
                       <%
                        enu = pCoreHash.keys();
                        id= 0;
                        while(enu.hasMoreElements())
                        {
                           id = ((Integer)enu.nextElement()).intValue();
                        %>
                        
                        <option value="<%=id%>"><%=(((Bug)pCoreHash.get(new Integer(id))).getPriorityName())%></option>
                        <%} %>
                       </select>
                     </label></td>
                </tr>
                   <tr>
                     <td colspan="6"><div align="center">
                       <input type="submit" name="button" id="button" value="Search" />
                     </div></td>
                   </tr>
                   <tr>
                     <td height="8" colspan="6"></td>
                </tr>
              </table>
          </form>
          <%
             if(request.getParameter("Bugid")!=null)
             {
           %>
            <table  border="0" align="center" bordercolor="#8692E3">
                  <tr bgcolor="#509C16">
                    <%
         String bugname = request.getParameter("Bugid");
         String projectname = request.getParameter("Projectid");
         String priorityname = request.getParameter("Priorityid");
	     String role = (String) session.getAttribute("role");
	     dCoreHash = null;
	     pCoreHash = null;
	    
             int bugid = 0;
             status = 0;
             bugdao = new BugDAO();
             pCoreHash = new BugDAO().getPriorities();
             dCoreHash = bugdao.getBugs(bugname, priorityname, projectname);     
             session.setAttribute("bugs",dCoreHash);
             if(!pCoreHash.isEmpty())
         	{
        %>
               <td width="50" bgcolor="#E7B04F"><div align="center" class="style8 style2 style4"><strong>Bug ID</strong></div></td>
               <td width="129" bgcolor="#E7B04F"><div align="center" class="style8 style2 style4"><strong>Bug Name</strong></div></td>
               <td width="116" bgcolor="#E7B04F" class="style3"><div align="center" class="style4"><strong>Raised Date</strong></div></td>
               <td width="116" bgcolor="#E7B04F" class="style3"><div align="center" class="style4"><strong>Priority</strong></div></td>
               <td width="113"  bgcolor="#E7B04F" class="style3"><div align="center" class="style4"><strong>Status</strong></div></td>
                <td width="75"  bgcolor="#E7B04F" class="style3"><div align="center" class="style4"><strong>Solution</strong></div></td>
              </tr>
                  <%
          	enu = dCoreHash.elements();
            Bug aBug;
          	while (enu.hasMoreElements()) {
          	aBug = (Bug) enu.nextElement();
            bugid = aBug.getBugID(); 
          				         				
          %>
                  <tr bgcolor="#CEC9FA">
                  <td bgcolor="#C3D7BA"><div align="center" class="style7"><%=bugid%></div></td>
                  <td bgcolor="#C3D7BA"><div align="center" class="style7"><%=(aBug.getBugName())%></div></td>
                  <td bgcolor="#C3D7BA"><div align="center" class="style7"><%=DateWrapper.parseDate(aBug.getRaisedDate1())%></div></td>
                  <td bgcolor="#C3D7BA"><div align="center" class="style7"><%=((Bug)pCoreHash.get(new Integer(aBug.getPriorityID()))).getPriorityName() %></div></td>
                  <td bgcolor="#C3D7BA"><div align="center" class="style7"><%=(aBug.getStatus())%></div></td>
                  <td bgcolor="#C3D7BA">
                  <%
                  if((aBug.getStatus()).equals("Completed"))
                  {%>
                  <div align="center" class="style7"><a href="ViewSolution.jsp?id=<%=bugid%>" target="_new">View</a></div>
                 <% }
                   %>                  </td>
             </tr>
                  <%
      	}
      		} else {
      %>
                  <tr>
                    <td height="24" colspan="8"><div align="center" class="style3"><strong>No Records Found</strong></div></td>
                  </tr>
                  <%
      	}
      	%>
      	</table>
      	<%}
      	} catch (Exception e) {
      		LoggerManager.writeLogWarning(e);
      	}
      	%>       
            
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
