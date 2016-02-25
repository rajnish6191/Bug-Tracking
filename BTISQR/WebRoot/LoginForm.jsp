<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
a:link {
	text-decoration: none;
}
a:visited {
	text-decoration: none;
}
a:hover {
	text-decoration: none;
}
a:active {
	text-decoration: none;
}
-->
</style>
<script language="javascript">

function validate()
{
   if(document.login.username.value=="" || document.login.password.value=="")
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
		<jsp:include page="generaloptions.html"/>
	</ul>
</div>
<!-- end header -->
<hr />
<!-- start latest post -->
<div id="latest-post" class="wide-post">
	<h1 class="title"><a href="#">Welcome to Bug Tracking System!</a></h1>
	<div class="entry">
	  <p>&nbsp;</p>
	    <table width="683" height="249" border="0">
          <tr>
            <td width="139" height="245" valign="top"><img src="images/img07.jpg" alt="" width="114" height="114" class="left" /></td>
            <td width="263" valign="top"><p align="justify">&nbsp;</p>
            <p align="justify">&nbsp;</p></td>
            <td width="10" align="center" valign="middle"><img src="images/img13.gif" alt="s" width="3" height="218" /></td>
            <td width="253" valign="top"><p>&nbsp;</p>
            
            <fieldset>
               <legend class="style1">Login</legend>
               <br /> <div align="center">
                    <%
					  if(request.getParameter("ls")!=null)
					  {
					%>
                    <span class="style2"><%=request.getParameter("ls")%>					</span>
                    <%
					  }
					%>     
                                   </div> <br />
          <form id="form1" method="post" action="LoginAction.jsp" name="login" onsubmit="return validate()">
              <table width="225" border="0" align="right">
                   <tr>
                     <td width="67"><strong>Username</strong></td>
               <td width="142"><label>
                       <input type="text" name="username" id="textfield" />
                     </label></td>
                   </tr>
                   <tr>
                     <td height="31"><strong>Password</strong></td>
                     <td><label>
                       <input type="password" name="password" id="textfield2" />
                     </label></td>
                   </tr>
                   <tr>
                     <td></td>
                     <td></td>
                   </tr>
                   <tr>
                     <td colspan="2">
                       <div align="center">
                         <input type="submit" name="button" id="button" value="Sign In" />
                       </div>                     </td>
                   </tr>
                   <tr>
                     <td colspan="2"><p align="center"><a href="RecoverPassword.jsp">Forgot your password?</a></p>
					
					</td>
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
