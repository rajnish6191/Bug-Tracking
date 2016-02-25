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
.style3 {color: #000000}
.style5 {color: #000000; font-weight: bold; }
-->
</style>
 <script type="text/javascript" src="scripts/general.js"> </script>
   <script type="text/javascript" src="scripts/ts_picker.js"> </script>
<script language="javascript">
function validate()
{
   var temp = document.register;
   if(temp.fname.value=="" || temp.lname.value=="" || temp.bdate.value=="" || temp.loginname.value=="" || temp.password.value=="" || temp.sanswer.value=="")
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
function check()
{
    var form = document.register;
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
	   <%
     String memberlogin = request.getParameter("id");
     CoreHash dCoreHash = (CoreHash)session.getAttribute("members");
     Profile profile = (Profile)dCoreHash.get(memberlogin); 
%>
	    <table width="646" height="255" border="0">
          <tr>
            <td width="255" height="208" valign="top"><img src="images/img07.jpg" alt="" width="114" height="114" class="left" /></td>
            <td width="381" valign="top"><p>&nbsp;</p>
            
            <fieldset>
               <legend class="style1">Update Member</legend>
               <br /> 
            <form name="register" method="post" action="UpdateMemberAction.jsp">
                    <input type="hidden" name="loginname" value="<%=memberlogin%>"/>
                    <input type="hidden" name="tpage" value="<%=request.getParameter("tpage")%>"/>
                    <input type="hidden" name="role" value="<%=request.getParameter("role") %>"/>
                       <table border="0" align="center">
                        <tr>
                          <td width="98" class="style3 tiny"><span class="style5">First Name </span></td>
                          <td width="182"><input type="text" name="fname" class="textfield" value="<%=profile.getFirstName() %>"/>                          </td>
                        </tr>
                        <tr>
                          <td><span class="style3 style13"><strong>Last Name </strong></span></td>
                          <td><input type="text" name="lname" class="textfield" value="<%=profile.getLastName() %>"/>                          </td>
                        </tr>
                        <tr>
                          <td><span class="style3 style13"><strong>Birth Date </strong></span></td>
                          <td><input type="text" name="bdate" readonly="readonly" value="<%=DateWrapper.parseDate(profile.getBirthDate1())%>"/>
                            <a href="javascript:show_calendar('document.register.bdate', document.register.bdate.value);"> <img src="images/cal.gif" alt="a" width="18" height="18" border="0"/></a> </td>
                        </tr>
                        <tr>
                          <td class="style3 style13"><strong>House No</strong></td>
                          <td><input type="text" name="hno" class="textfield" value="<%=profile.getHno() %>"/></td>
                        </tr>
                        <tr>
                          <td class="style3 style13"><strong>Street</strong></td>
                          <td><input type="text" name="street" class="textfield" value="<%=profile.getStreet() %>"/></td>
                        </tr>
                        <tr>
                          <td><span class="style3 style13"><strong>City</strong></span></td>
                          <td><select name="city">
                              <option><%=profile.getCity()%></option>
                              <option>Hyderabad</option>
                              <option>Mumbai</option>
                            </select>                          </td>
                        </tr>
                        <tr>
                          <td><span class="style3 style13"><strong>State</strong></span></td>
                          <td><select name="state">
                              <option><%=profile.getState() %>
                              <option>Andhra pradesh</option>
                              <option>Maharashtra</option>
                            </select>                          </td>
                        </tr>
                        <tr>
                          <td><span class="style3 style13"><strong>Country</strong></span></td>
                          <td><select name="country">
                            <option><%=profile.getCountry() %></option>
                              <option>India</option>
                            </select>                          </td>
                        </tr>
                        <tr>
                          <td class="style3 style13"><strong>Pincode</strong></td>
                          <td><input type="text" name="pincode" class="textfield" value="<%=profile.getPincode() %>"/></td>
                        </tr>
                        <tr>
                          <td class="style3 style13"><strong>Contact No</strong></td>
                          <td><input type="text" name="phoneno" class="textfield" value="<%=profile.getPhoneNo() %>"/></td>
                        </tr>
                        <tr>
                          <td class="style3 style13"><strong>Email</strong></td>
                          <td><input type="text" name="email" class="textfield" value="<%=profile.getEmail() %>"/></td>
                        </tr>
                        <tr>
                          <td height="11" colspan="2"></td>
                        </tr>
                        <tr>
                          <td colspan="2"><div align="center">
                              <input name="Input" type="submit" value="Update" />&nbsp;<input name="Input" type="button" value="Back" onclick="javascript:history.back(-1);"/>
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
