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
	 <jsp:include page="Adminoptions.html"/>  
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
               <legend class="style1">View Bugs</legend>
               <br /> 
            <form name="f" method="post" action="DeleteBugAction.jsp">
             
                <input type="hidden" name="page" value="ViewBugs.jsp"/>
                <table width="509" border="0" bordercolor="#8692E3">
                  <tr bgcolor="#509C16">
                    <%
         String header = request.getParameter("header");
	     String role = (String) session.getAttribute("role");
	     CoreHash dCoreHash = null;
	     try{
             int bugid = 0;
             int status = 0;
             BugDAO bugdao = new BugDAO();
             
             dCoreHash = bugdao.getBugs();
             session.setAttribute("Bugs",dCoreHash);
             if(!dCoreHash.isEmpty())
         	{
         if(header.equals("list") && role.equals("admin"))
         {
       %>
                    <td width="18" bgcolor="#E7B04F"><div align="center" class="style3">
                        <input type="checkbox" name="ch" id="checkbox" onclick="SetChecked('ch')"/>
                    </div></td>
                    <%
        	}
        %>
                    <td width="175" bgcolor="#E7B04F"><div align="center" class="style2 style8"><strong>Bug ID</strong></div></td>
                    <td width="111" bgcolor="#E7B04F"><div align="center" class="style2 style8"><strong>Name</strong></div></td>
                    <td width="111" bgcolor="#E7B04F"><div align="center" class="style2 style8"><strong>Priority</strong></div></td>
                    <td width="111" bgcolor="#E7B04F"><div align="center" class="style2 style8"><strong>Raised Date</strong></div></td>
                    <td width="111" bgcolor="#E7B04F"><div align="center" class="style2 style8"><strong>Solution</strong></div></td>
                    </tr>
                  <%
          	Enumeration enu = dCoreHash.elements();
          			Bug aBug;
          			while (enu.hasMoreElements()) {
          				aBug = (Bug) enu.nextElement();
          				bugid = aBug.getBugID();
          				         				
          %>
                  <tr bgcolor="#CEC9FA">
                    <%
      	String flag = "false";
      				if (header.equals("list")) {
      					flag = "true";
      %>
                    <td bgcolor="#C3D7BA"><input name="ch" type="checkbox" id="checkbox2" onclick="check1()" value="<%=bugid%>"/></td>
                    <%
 	}
 %>
                    <td bgcolor="#C3D7BA"><div align="center" class="style7"><%=(aBug.getBugID())%></div></td>
                    <td bgcolor="#C3D7BA"><div align="center" class="style7"><%=(aBug.getBugName())%></div></td>
                    <td bgcolor="#C3D7BA"><div align="center" class="style7"><%=(aBug.getPriorityID())%></div></td>
                    <td bgcolor="#C3D7BA"><div align="center" class="style7"><%=DateWrapper.parseDate(aBug.getRaisedDate1())%></div></td>
                    <td bgcolor="#C3D7BA"><div align="center" class="style7"><a href="ViewSolution.jsp?id=<%=aBug.getBugID()%>" target="_new">Solution</a></div></td>
                    
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
      	if (header.equals("list")) {
      %>
                  <tr>
                    <td colspan="5"><div align="center">
                        <input type="button" name="button" id="button" value="Add Priority" onclick="javascript:location.href='DispatchController?page=AddNewPriority.jsp'"/>
                      &nbsp;
                      <%
          	if (!dCoreHash.isEmpty()) {
          %>
                      <input type="submit" name="button2" id="button2" value="Delete"/>
                      <%
          	}
          %>
                    </div></td>
                  </tr>
                  <%
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
