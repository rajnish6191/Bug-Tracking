<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

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
-->
</style>
<script language="javascript" src="scripts/general.js"></script>
<script language="javascript">
function validate()
{
   if(document.changepassword.username.value=="" || document.changepassword.oldpassword.value=="" || document.changepassword.newpassword.value=="")
   {
       alert("All Fields are manditory");
	   return false;
   }
   return true;
}
</script>
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
	    <table width="646" height="255" border="0">
          <tr>
            <td width="255" height="208" valign="top"><img src="images/img07.jpg" alt="" width="114" height="114" class="left" /></td>
            <td width="381" valign="top"><p>&nbsp;</p>
            
            <fieldset>
               <legend class="style1">Change Password</legend>
               <br /> 
            <div align="center"><br /> 
                      <% if(request.getParameter("status")!=null)
					  {%>
                          <span class="style5"><%=request.getParameter("status")%></span>
                          <%}%>
                    </div>
            <form name="changepassword" action="ChangepasswordAction.jsp" onSubmit="return validate()">
              <table width="261" border="0" align="center">
                <tr>
                  <td class="style36"><span class="style3 style2"><strong>User Name</strong></span></td>
                  <td><label>
                    <input type="text" name="username" emsg="Username is required" value="<%=(String)session.getAttribute("user") %>"/>
                  </label></td>
                </tr>
                <tr>
                  <td class="style36"><span class="style3 style2"><strong>Old Password</strong></span></td>
                  <td><label>
                    <input type="password" name="oldpassword" emsg="Password is required" />
                  </label></td>
                </tr>
                <tr>
                  <td class="style36"><span class="style3 style2"><strong>New Password </strong></span></td>
                  <td><label>
                    <input type="password" name="newpassword" emsg="Password is required" />
                  </label></td>
                </tr>
                <tr>
                  <td colspan="2"><label>
                      <div align="center">
                        <input type="submit" name="Submit" value="Change" />
                        &nbsp;
                        <input type="reset" name="Submit2" value="Reset" />
                      </div>
                    </label></td>
                </tr>
              </table>
                      <div align="center"></div>
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
