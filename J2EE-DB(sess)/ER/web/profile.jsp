<%-- 
    Document   : profile
    Created on : Jul 2, 2014, 10:51:21 AM
    Author     : Lakmal
--%>

<%@page import="java.util.Set"%>

<%@page import="DB.Privilage"%>
<%@page import="org.hibernate.Session"%>
<%@page import="DB.LoginSession"%>
<%@page import="Connection.NewHibernateUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <ul>
        <%
         
         Session sess=NewHibernateUtil.getSessionFactory().openSession();
         
         LoginSession u=(LoginSession)sess.load(LoginSession.class, Integer.parseInt(request.getSession().getAttribute("a").toString()));
         Set<Privilage> p=u.getUserLogin().getUser().getUserType().getPrivilages();
         
         for(Privilage pr:p){
             
         
        %>
        <li>
            <a href="<%=pr.getInterfaces().getUrl()%>"/>
              <%=pr.getInterfaces().getDisplayName()%>
            </a>
        </li>
        <%}%>
        </ul>
    </body>
</html>
