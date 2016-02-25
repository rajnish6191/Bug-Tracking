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
.style2 {font-weight: bold}
.style3 {
	color: #000000;
	font-weight: bold;
}
-->
</style>
 <script type="text/javascript" src="scripts/general.js"> </script>
<script language="javascript">
function validateQues()
{
   var temp = document.recover;
   if(temp.username.value=="" ||  temp.sanswer.value=="")
   {
       alert("All Fields are manditory");
       return false;
   }
   if(temp.ch.checked && temp.ownquest.value=="")
   {
       alert("All Fields are manditory");
       return false;
   }
   return true;
}
function validate()
{
   if(document.login.username.value=="" || document.login.password.value=="")
   {
       alert("All Fields are manditory");
	   return false;
   }
   return true;
}
function check()
{
    var form = document.recover;
    if(!form.ch.checked){
          form.ownquest.disabled=true;
          form.squest.disabled=false;
    }
    else{
          form.ownquest.disabled=false;
          form.squest.disabled=true;
    }
}
</script>
 
   <script type="text/javascript" src="scripts/ts_picker.js"> </script>
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
	    <table width="683" height="255" border="0">
          <tr>
            <td width="139" height="208" valign="top"><img src="images/img07.jpg" alt="" width="114" height="114" class="left" /></td>
            <td valign="top"><p align="justify">&nbsp;</p>
                 
            
            <fieldset>
               <legend class="style1">Recover Password</legend>
               <br /> <div align="center">
<form action="RecoverPasswordAction.jsp" method="post" name="recover" onsubmit="return validateQues()" ><fieldset>
					  <div align="center">
                    <%
					  if(request.getParameter("status")!=null)
					  {
					%>
                    <span class="style2"><%=request.getParameter("status")%>					</span>
                    <%
					  }
					%>     
                    </div>
                    <br />
                    <table border="0" align="center">
                      <tr>
                        <td><div align="left"><span class="style3">Login Name </span></div></td>
                        <td><div align="left">
                          <input type="text" name="username" />                        
                        </div></td>
                      </tr>
                      <tr>
                        <td><div align="left"><span class="style3">Secret Question</span></div></td>
                        <td><div align="left">
                          <select name="squest">
                            <option value="1">What is your favorite pastime?</option>
                            <option value="2">Who was your childhood hero?</option>
                            <option value="3">What was the name of your first school?</option>
                            <option value="4">Where did you meet your spouse?</option>
                            <option value="5">What is your favorite sports team?</option>
                            <option value="6">What is your father's middle name?</option>
                            <option value="7">What was your high school mascot?</option>
                            <option value="8">What make was your first car or bike?</option>
                            <option value="9">What is your pet's name?</option>
                          </select>
                        </div></td>
                      </tr>
                      <tr>
                        <td colspan="2"><div align="left"><span class="style3">
                        <input type="checkbox" name="ch" value="1" onclick="check(recover)" />
                        Own Question </span></div></td>
                      </tr>
                      <tr>
                        <td><div align="left"><span class="style3">Own Question </span></div></td>
                        <td><div align="left">
                          <input type="text" name="ownquest" disabled="disabled" />                        
                        </div></td>
                      </tr>
                      <tr>
                        <td><div align="left"><span class="style3">Secret Answer </span></div></td>
                        <td><div align="left">
                          <input name="sanswer" type="text" />
                        </div></td>
                      </tr>
                      <tr>
                        <td colspan="2"><div align="center">
                            <div align="center">
                          <input name="Input" type="submit" value="Recover" />
                          &nbsp;</div></td>
                      </tr>
                    </table>
  </fieldset>
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
