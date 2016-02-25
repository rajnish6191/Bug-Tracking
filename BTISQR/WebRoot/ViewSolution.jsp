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
.style6 {color: #000000; font-weight: bold; font-size: 12; }
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
               <legend class="style1">Solution</legend>
               <br /> 
            <form name="f" method="post" action="ChangeStatus.jsp">
            <%
               Bug aBug = new BugDAO().getBugSolution(Integer.parseInt(request.getParameter("id")));
               CoreHash pCoreHash = new ProjectsDAO().getAllProject();
               CoreHash bCoreHash = new BugDAO().getPriorities();
             %>
            <table width="314" border="0" align="center">
              <tr>
                <td width="128" height="26"><span class="style6">Project Name</span></td>
                <td width="176"><label>
                  <input type="text" name="textfield" id="textfield" value="<%=(((Project)pCoreHash.get(new Integer(aBug.getProjectID()))).getProjectName())%>" readonly/>
                </label></td>
              </tr>
              <tr>
                <td height="25"><span class="style6">Bug Name</span></td>
                <td><input type="text" name="textfield2" id="textfield2" value="<%=aBug.getBugName()%>" readonly /></td>
              </tr>
              <tr>
                <td><span class="style6">Priority</span></td>
                <td><input type="text" name="textfield3" id="textfield3" value="<%=(((Bug)bCoreHash.get(new Integer(aBug.getPriorityID()))).getPriorityName()) %>" readonly /></td>
              </tr>
              <tr>
                <td><span class="style6">Raised By</span></td>
                <td><input type="text" name="textfield4" id="textfield4" value="<%=aBug.getRaisedBy()%>" readonly /></td>
              </tr>
              <tr>
                <td><span class="style6">Raised Date</span></td>
                <td><input type="text" name="textfield5" id="textfield5" value="<%=DateWrapper.parseDate(aBug.getRaisedDate1()) %>" readonly /></td>
              </tr>
              <tr>
                <td><span class="style6">Description</span></td>
                <td><textarea name="textarea2" id="textarea2" cols="23" rows="5" readonly> <%=aBug.getDescription() %></textarea></td>
              </tr>
              <tr>
                <td><span class="style6">Assigned To</span></td>
                <td><input type="text" name="textfield7" id="textfield7" value="<%=aBug.getAssignedTo() %>" readonly  /></td>
              </tr>
              <tr>
                <td><span class="style6">Assigned Date</span></td>
                <td><input type="text" name="textfield8" id="textfield8" value="<%=DateWrapper.parseDate(aBug.getAssignedDate1()) %>" readonly  /></td>
              </tr>
              <tr>
                <td><span class="style6">Resolved By</span></td>
                <td><input type="text" name="textfield9" id="textfield9" value="<%=aBug.getSolvedBy()%>" readonly  /></td>
              </tr>
              <tr>
                <td><span class="style6">Resolved Date</span></td>
                <td><input type="text" name="textfield10" id="textfield10" value="<%=DateWrapper.parseDate(aBug.getRaisedDate1()) %>" readonly  /></td>
              </tr>
              <tr>
                <td><span class="style6">Solution</span></td>
                <td><label>
                  <textarea name="textarea" id="textarea" cols="23" rows="5"  readonly><%=aBug.getSolution()%></textarea>
                </label></td>
              </tr>
              <tr>
                <td colspan="2" align="center"> <input type="button" value="Close" onclick="javascript:window.close()"/></td>
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
