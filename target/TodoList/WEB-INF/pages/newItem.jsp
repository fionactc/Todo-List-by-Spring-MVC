<%--
  Created by IntelliJ IDEA.
  User: Fiona
  Date: 26/7/2017
  Time: 12:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>ToDo List</title>
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <link href="/resources/css/styles.css" rel="stylesheet"/>

</head>
<body>
<c:set var="url" value="${requestScope['javax.servlet.forward.servlet_path']}" />
<div class="container">
    <c:choose>
        <c:when test="${fn:contains(url, '/newItem')}">
            <h1 class="title">Add new item</h1>
        </c:when>
        <c:when test="${fn:contains(url, '/update')}">
            <h1 class="title">Update item</h1>
        </c:when>
    </c:choose>
    <form:form action="${url}" commandName="item">
        <c:if test="${item.isUrgent}">
            <span class="glyphicon glyphicon-alert" aria-hidden="true" style="color:crimson"></span>
        </c:if>
        <div class="form-group">
            <label for="new-item">Item Name:</label>
            <form:input path="name" type="text" class="form-control" id="new-item" placeholder="e.g. prepare breakfast" name="name" />
        </div>
        <div class="radio">
            <p style="font-weight: bold">Is the item urgent?</p>
            <label class="radio-inline">
                <form:radiobutton path="isUrgent" id="urgent-true" value="true" name="isUrgent" />Yes
            </label>
            <label class="radio-inline">
                <form:radiobutton path="isUrgent" id="urgent-false" value="false" name="isUrgent" />No
            </label>
        </div>
        <div class="buttons">
            <c:choose>
                <c:when test="${fn:contains(url, '/newItem')}">
                    <button type="submit" class="btn btn-primary">Submit</button>
                </c:when>
                <c:when test="${fn:contains(url, '/update')}">
                    <button type="submit" class="btn btn-success">Update</button>
                </c:when>
            </c:choose>
            <a href="/" type="button" class="btn btn-link">Cancel</a>
        </div>
    </form:form>
</div>
</body>
</html>
