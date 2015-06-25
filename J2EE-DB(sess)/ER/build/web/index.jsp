<%-- 
    Document   : index
    Created on : Jul 2, 2014, 10:41:27 AM
    Author     : Lakmal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="Ers" method="POST">
        <table>
            
            <tr>
                <td>User Name</td>
                <td><input type="text" name="uname" /></td>
                
            </tr>
            <tr>
                <td>Password</td>
                <td><input type="password" name="pass" /></td>
                
            </tr>
            <tr>
                <td><input type="submit" name="ac" value="ok"/></td>
                
            </tr>
          
        </table>
        </form>
    </body>
</html>
