<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <style>
        p.serif{font-family:"Courier New", Courier, monospace;}
    </style>
<title>Retrieve Patient Information By Number</title>
</head>
<table>
    <tbody>
    <tr>
        <td>
            <form>
                <div style="letter-spacing:12px;" align="center">Find Patient Details</div>
            </form>
        </td>
    </tr>
    </tbody>
</table>
<img src="./images/all-in-one.png" style="float:right" align="top" alt="" width="250" height="250">
<div style="font-family:verdana;padding:20px;border-radius:100px;border:50px solid #EE872A;">
<form action="Search">
<table>
    <tbody>
    <tr>
        <td><p class="serif" align="left">Specify the Patient Reference Number to search for patient details</p></td>
    </tr>
    <tr>
        <td></td>
        <td></td>
        <td><p class="serif" align="left">Patient Number</p></td>
        <td><input type="text" name="patientNumber" size="20"></td>
    </tr>
    <tr>
        <td></td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td></td>
        <td></td>
        <td><input type="submit" name="submit" value="Search">
            <input type="reset" value="Reset"></td>
    </tr>
    <tr>
        <td></td>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <td></td>
        <td></td>
        <td>
            <form>
                <li><a href="landingPage.jsp">Home</a></li>
            </form>
        </td>
    </tr>
    </tbody>
</table>
</form>
<form action="LogoutServlet" method="post">
<input type="submit" value="Logout" >
</form>
</div>
</body>
</html>