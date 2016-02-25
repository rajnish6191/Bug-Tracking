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
	    <table width="687" height="255" border="0">
          <tr>
            <td width="138" height="208" valign="top"><img src="images/img07.jpg" alt="" width="114" height="114" class="left" /></td>
            <td width="539" valign="top"><p>&nbsp;</p>
            
            <fieldset>
               <legend class="style1">Resolved Bugs</legend>
               <br /> 
            <form name="f" method="post" action="DeletePriorityAction.jsp">
             
                <input type="hidden" name="page" value="ViewPriorities.jsp"/>
                <table  border="0" align="center" bordercolor="#8692E3">
                  <tr bgcolor="#509C16">
                    <%
         String header = request.getParameter("header");
	     String role = (String) session.getAttribute("role");
	     CoreHash dCoreHash = null;
	     CoreHash pCoreHash = null;
	     try{
             int bugid = 0;
             int status = 0;
             BugDAO bugdao = new BugDAO();
             pCoreHash = new BugDAO().getPriorities();
             dCoreHash = bugdao.getBugs();    
             session.setAttribute("bugs",dCoreHash);
             if(!pCoreHash.isEmpty())
         	{
        %>
               <td width="50" bgcolor="#E7B04F"><div align="center" class="style2 style8"><strong>Bug ID</strong></div></td>
               <td width="129" bgcolor="#E7B04F"><div align="center" class="style2 style8"><strong>Bug Name</strong></div></td>
               <td width="116" bgcolor="#E7B04F" class="style3"><div align="center">Raised Date</div></td>
               <td width="116" bgcolor="#E7B04F" class="style3"><div align="center">Priority</div></td>
               <td width="113"  bgcolor="#E7B04F" class="style3"><div align="center">Status</div></td>
                <td width="75"  bgcolor="#E7B04F" class="style3"><div align="center">Solution</div></td>
               </tr>
                  <%
          	Enumeration enu = dCoreHash.elements();
            Bug aBug;
          	while (enu.hasMoreElements()) {
          	aBug = (Bug) enu.nextElement();
            bugid = aBug.getBugID(); 
            if(aBug.getStatus().equals("Completed"))
          	{
          				         				
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
                  <div align="center" class="style7"><a href="ViewSolution.jsp?id=<%=bugid %>" target="_new">View</a></div>
                 <% }
                   %>
                  </td>
             </tr>
                  <%
      	}}
      		} else {
      %>
                  <tr>
                    <td height="24" colspan="8"><div align="center" class="style3"><strong>No Records Found</strong></div></td>
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
