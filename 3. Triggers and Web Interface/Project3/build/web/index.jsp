<%-- 
    Document   : index
    Created on : Sep 18, 2019, 10:51:02 AM
    Author     : Mital Patel
--%>

<%@ page import = "java.sql.*"%>
<%@ page import = "java.io.*"%>
<%@page import = "java.sql.Connection"%>
<%@page import = "java.sql.DriverManager"%>
<% Class.forName("oracle.jdbc.driver.OracleDriver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>SalesToDate View </h1>
        
        
        
        <% 
            String url = "jdbc:oracle:thin:@129.7.240.3:1521:orcl";
            Connection conn = DriverManager.getConnection(url, "MNPATEL", "MNPATEL#");
            Statement statement = conn.createStatement();
            ResultSet resultset = statement.executeQuery("select * from SalesToDate");
        %>
        
        
        <TABLE BORRDER = "1" BGCOLOR = "CCFFFF" width = '50%' cellspacing = '1' cellpadding = '0' bordercolor = "black" border = '1'>
            <TR>
                <TH bgcolor = "#DAA50"> <font size = '2'/> ID </TH>
                <TH bgcolor = "#DAA50"> <font size = '2'/> Description </TH>
                <TH bgcolor = "#DAA50"> <font size = '2'/> Quantity </TH>
            </TR>
            <% while (resultset.next()) {%>
            <TR>
                <TD> <font size = '2'/> <center> <%= resultset.getString(1) %> </center> </TD>
                <TD> <font size = '2'/> <<center> <%= resultset.getString(2) %> </center> </TD>
                <TD> <font size = '2'/> <center> <%= resultset.getString(3) %> </center> </TD>
            </TR>
            <% }%>
        
        </TABLE>
        
        
    </body>
</html>
