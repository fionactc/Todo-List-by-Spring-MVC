<%--
  Created by IntelliJ IDEA.
  User: Fiona
  Date: 26/7/2017
  Time: 10:59 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <title>ToDo List</title>
    <spring:url value="/resources/css/styles.css" var="mainStyle"/>
    <link href="/resources/css/styles.css" rel="stylesheet"/>
    <script src="http://code.jquery.com/jquery-3.2.1.min.js"
            integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
            crossorigin="anonymous" ></script>
    <script defer>
        $(document).ready(function(){
            $('.itemCheckbox').click(function() {
                if ($(this)[0].checked) {
                    let itemId = $(this).attr('id');
                    $.ajax({
                        type: "POST",
                        url: "${pageContext.request.contextPath}/finish",
                        dataType: "json",
                        data: { itemId },
                        success: function(data) {
                            console.log("Success");
                            $('#' + itemId + '-row').remove();
                        },
                        error: function(err) {
                            console.log('this is error ', err);
                        }
                    })
                }
            })
        })
    </script>
</head>
<body>
    <c:set var="items" value="${sessionScope.items.items}" />
    <div class="container">
       <h1 class="title">Todo List</h1>
        <c:if test="${items.size() <= 0 }">
            <span>The list is empty</span>
        </c:if>
        <table class="table table-hover">
            <c:forEach items="${items}" var="item" varStatus="loop">
               <tr id="${loop.index}-row">
                   <td>
                       <input class="itemCheckbox"
                              id="${loop.index}"
                              type="checkbox" />
                   </td>
                   <td>
                       <c:if test="${item.isUrgent}">
                           <span class="glyphicon glyphicon-alert" aria-hidden="true" style="color:crimson"></span>
                       </c:if>
                   </td>
                   <td>
                       ${item.name}
                   </td>
                   <td>
                       <a href="/update/${loop.index}"
                          class="glyphicon glyphicon-pencil"
                          aria-hidden="true"></a>
                   </td>
                   <td>
                       <a href="/delete/${loop.index}"
                          class="glyphicon glyphicon-trash"
                          aria-hidden="true"></a>
                   </td>
               </tr>
            </c:forEach>
        </table>
        <a class="btn btn-primary" href="/newItem">
            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
            New item
        </a>
    </div>
</body>
</html>
