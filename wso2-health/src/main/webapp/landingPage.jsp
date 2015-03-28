<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        p.serif{font-family:"Courier New", Courier, monospace;}
    </style>
    <title>WSO2 Health Portal Home</title>
</head>
<body>
<%
//allow access only if session exists
String user = (String) session.getAttribute("user");
String userName = null;
String sessionID = null;
Cookie[] cookies = request.getCookies();
if(cookies !=null){
for(Cookie cookie : cookies){
    if(cookie.getName().equals("user")) userName = (String) request.getSession(false).getAttribute("user");
    if(cookie.getName().equals("JSESSIONID")) sessionID = cookie.getValue();
}
}
%>
<table>
    <tbody>
    <tr>
        <td>
            <form>
                <div style="letter-spacing:12px;" align="center">WSO2 Health Portal Home</div>
            </form>
        </td>
    </tr>
    </tbody>
</table>
<div style="opacity:0.5;position:absolute;right:50px;width:300px;height:500px;background-color:#40B3DF;"></div>
<img src="./images/all-in-one.png" style="float:right" align="top" alt="" width="250" height="250">
<div style="font-family:verdana;padding:20px;border-radius:100px;border:50px solid #EE872A;">
<div style="opacity:0.3;position:absolute;right:120px;width:400px;height:600px;background-color:#8AC007;"></div>
  <table>
      <tbody>
      <tr>
      <td></td>
      <td></td>
      <td >
      <h3>Hi <%=userName %>, Login successful. Welcome to WSO2 Health Portal</h3>
      <p>Your Session ID=<%=sessionID %></p>
      <br/>
	  </td>
	  </tr>
      <tr>
          <td></td>
          <td></td>
          <td>
              <form>
              <li><a href="getPatientDetails.jsp">Search for patient records</a></li>
              </form>
          </td>
      </tr>
      <tr>
          <td></td>
          <td></td>
          <td>
              <form>
                  <li><a href="addPatient.jsp">Register a new patient</a></li>
              </form>
          </td>
      </tr>
            <tr>
          <td></td>
          <td></td>
          <td>          
          	<form action="LogoutServlet" method="post">
		  		<input type="submit" value="Logout" >
		  	</form>
		  </td>
      </tr>
      </tbody>
      </table>
</div>
  </body>
</html>