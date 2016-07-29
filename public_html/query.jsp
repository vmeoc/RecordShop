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
  Server IP Address: <%=serverAddress %><br />
  Server Hostname: <%=hostname %> 
  <h2>Sample MySQL Data</h2>
  <h3>Record Shop Inventory</h3>
  <table border="1">
  	<tr>
  		<td>Author</td>
  		<td>Title</td>
  		<td>Year</td>
  		<td>Quantity</td>
  		<td>Price</td>
  	</tr>
    <c:forEach var="row" items="${rs.rows}">
    <tr>
		<td>${row.author}</td>
		<td>${row.title}</td>
		<td>${row.year}</td>
		<td>${row.qty}</td>
		<td>\$${row.price}</td>
    </tr>
    </c:forEach>
  </table>
</body>
</html>