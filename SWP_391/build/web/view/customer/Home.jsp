<%-- 
    Document   : Home
    Created on : Jan 10, 2024, 8:47:09 AM
    Author     : ifyou
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World From Home Page. The content is coming soon.</h1>
        <c:if test="${sessionScope.user !=null}">
            <a href="#" class="nav-link dropdown-toggle"
               data-bs-toggle="dropdown">${sessionScope.user.name}</a>
            <ul class="dropitems">
                <li class="m-8"><a href="profile?aid=${sessionScope.user.id}">My
                        Profile</a></li>
                <li class="m-8"><a href="myorder">My Orders</a></li>
                <li class="m-8"><a href="/SWP_391/logout">Logout</a></li>
            </ul>
        </div>
        <c:url value="/cart" var="completeURL">
            <c:param name="action" value="gocart" />
            <c:forEach items="${carts}" var="c">
                <c:param name="pid" value="${c.value.product.productId}" />
            </c:forEach>

        </c:url>
        <a class="shopping-cart nav-item nav-link" href="${completeURL}">
            <i class="fas fa-shopping-cart"></i></a>

    </c:if>
</body>
</html>
