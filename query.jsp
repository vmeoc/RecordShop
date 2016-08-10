<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page import="java.net.*" %> 
<%
String hostname, serverAddress;
hostname = "error";
serverAddress = "error";
try {

        InetAddress inetAddress = InetAddress.getLocalHost();
        serverAddress = inetAddress.getHostAddress();
        hostname = inetAddress.getHostName();
} catch (UnknownHostException e) {

        e.printStackTrace();
}
%>

<sql:setDataSource var="ds" dataSource="jdbc/$resource_name" />
<sql:query sql="select author, title, year, price, qty from records" var="rs" dataSource="${ds}" />

<html>
    <head><title>Sample WebApp</title></head>
    <body>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
        Server IP Address: <%=serverAddress %><br />
        Server Hostname: <%=hostname %> 
        <h2>Sample MySQL Data</h2>
        <h3>Record Shop Inventory</h3>
        <table border="1" class="table table-striped">
            <thead>
                <tr>
                    <th>Author</th>
                    <th>Title</th>
                    <th>Year</th>
                    <th>Quantity</th>
                    <th>Price</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach var="row" items="${rs.rows}">
                <tr>
                    <td>${row.author}</td>
                    <td>${row.title}</td>
                    <td>${row.year}</td>
                    <td>${row.qty}</td>
                    <td>\$${row.price}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </body>
</html>
