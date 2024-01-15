<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Activity" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>List of Activities</title>
  	 <link rel="stylesheet" href="<c:url value='/resources/css/listOfActivities.css' />">
</head>
<body >
<jsp:include page="header.jsp" />


<% List<Activity> activityList = (List<Activity>) request.getAttribute("activityList"); %>

<div class="main-container">
		<table>
    <thead>
        <tr>
            <th>Activity Name</th>
            <th>Activity Date</th>
            <th>Activity Location</th>
        </tr>
    </thead>
    <tbody>
        <% for (Activity activity : activityList) { %>
            <tr>
                <td><%= activity.getActivityName() %></td>
                <td><%= activity.getActivityDate() %></td>
                <td><%= activity.getActivityLocation() %></td>
            </tr>
        <% } %>
    </tbody>
</table>
		
</div>


<jsp:include page="footer.jsp" />

</body>
</html>
