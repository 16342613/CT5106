<%-- 
    Document   : displayCustomerDetails
    Created on : 19-Oct-2018, 14:26:48
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
        <title>Customer Details</title>
    </head>
    <body>
        <c:forEach var="customer" items="${customers}">
            <c:if test = "${param.customerID == customer.getCustomerNumber()}">
                <h1>Customer Details:${customer.getCustomerName()}</h1>
                <div style="padding: 10px; text-align: center;">
                    <table border="1">
                        <tr>
                            <th style="padding: 10px;">Contact</th>
                            <td style="padding: 10px">${customer.getCustomerContactName()}</td>
                        </tr>
                        <tr>
                            <th style="padding: 10px;">Phone</th>
                            <td style="padding: 10px;">${customer.getCustomerPhone()}</td>
                        </tr>  
                        <tr>
                            <th style="padding: 10px;">Address</th>
                            <td style="padding: 10px;">
                                ${customer.getCustomerAddressLine1()}
                                <br><br>
                                ${customer.getCustomerCity()}
                                <br><br>
                                ${customer.getCustomerPostCode()}
                                <br>
                                ${customer.getCustomerCountry()}
                            </td>
                        </tr>
                    </table>
                </div>
            </c:if>                   
        </c:forEach>                     
    </body>
</html>
