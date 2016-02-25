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
	    <table width="646" height="255" border="0">
          <tr>
            <td width="255" height="208" valign="top"><img src="images/img07.jpg" alt="" width="114" height="114" class="left" /></td>
            <td width="381" valign="top"><p>&nbsp;</p>
            
            <fieldset>
               <legend class="style1">Update Priority</legend>
               <br /> 
            <form id="form1" method="post" action="EditPriorityAction.jsp" name="register">
            <%
			   CoreHash aCoreHash = (CoreHash)session.getAttribute("priorities");
			   Integer priorityid = new Integer(request.getParameter("id"));
			   Bug aBug = (Bug)aCoreHash.get(priorityid);
			%>
			
              <table width="345" border="0" align="center">
        <tr>
                     <td width="158" height="22"><span class="style2">Priority ID</span></td>
                     <td width="177">
                       
                  <div align="left">
                    <input type="text" name="priorityid" id="textfield" value="<%=aBug.getPriorityID()%>" readonly/>
                  </div>               </td>
                </tr>
                   <tr>
                     <td width="158" height="22"><span class="style2">Type</span></td>
                     <td width="177">
                       
                  <div align="left">
                    <input type="text" name="type" id="textfield" value="<%=aBug.getPriorityName()%>"/>
                    
                  </div>               </td>
                </tr>
                   <tr>
                     <td colspan="2"><div align="center">
                       <input type="submit" name="button" id="button" value="Update" />
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
