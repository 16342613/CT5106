<%-- 
    Document   : displayCustomerSummary
    Created on : 18-Oct-2018, 13:21:44
    Author     : Irish
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="javax.servlet.http.HttpSession" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customers Summary</title>
    </head>
    <body>
        <h1>Summary Customer Information</h1>
        <table border="1">
            <tr>
                <strong>
                    <th style="padding: 10px; text-align: center;">Customer ID</th>
                    <th>Name</th> 
                    <th>City</th>
                    <th>Credit Limit</th>
                </strong>
            </tr>
            <c:forEach var="customer" items="${customers}">
                <tr>
                    <td style="padding: 10px; text-align: center;">${customer.getCustomerNumber()}</td> 
                    <td>${customer.getCustomerName()}</td> 
                    <td>${customer.getCustomerCity()}</td> 
                    <td>${customer.getCustomerCreditLimit()}</td> 
                    <td>
                        <div>
                            <form style="padding: 10px;" method="post" action="displayCustomerDetails.jsp">
                                <input type="hidden" name="customerID" value="${customer.getCustomerNumber()}"/> 
                                <input type="submit" value="Details"/>
                            </form>
                        </div>        
                    </td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
