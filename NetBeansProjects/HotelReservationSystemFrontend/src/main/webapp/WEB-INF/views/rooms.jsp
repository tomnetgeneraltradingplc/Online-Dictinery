<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>    
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="${contextPath}/resources/css/index.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js" integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em" crossorigin="anonymous"></script>
<script
  src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
  integrity="sha256-3edrmyuQ0w65f8gfBsqowzjJe2iM6n0nKciPUp8y+7E="
  crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="${contextPath}/resources/js/index.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hotel Reservation System</title>
</head>
<body>

<div class="container">
<div class="row">
<div class="col">
   <div class="header"><p class="header_title">Hotel Reservation System</p></div>
	<p class="errors">${error}</p>
</div>
</div>

<div class="row">
<div class="col">
<p><span class="badge badge-secondary">From : ${datefrom}  </span></p>
<p><span class="badge badge-secondary">To : ${dateto} </span></p>
<p><span class="badge badge-secondary">Available Rooms : ${available_rooms} </span></p>
</div></div>

<div class="row">
	<div class="col">
	
	<c:choose>
    <c:when test="${available_rooms==0}">
        <p style="text-align: center;">No rooms are available in the selected date range</p>
        <br />
    </c:when>    
    <c:otherwise>
	<table class="table table-striped">
	<th scope="col">ID</th>
	<th scope="col">Size</th>
	<th scope="col">Floor</th>
	<th scope="col">Category</th>
	<th scope="col">Rate/Day</th>
	<th scope="col"></th>
	<c:forEach items="${rooms}" var="room">
    	<tr>
    	<td>${room.id} </td>
        <td>${room.size}</td>
        <td>${room.floor}</td>
        <td>${room.category}</td>
        <td>$${room.price}</td>
        <td><a class="btn btn-primary" href="book/${room.id}">Select</a></td>
    	</tr>
	</c:forEach>
	</table> 
        <br />
    </c:otherwise>
</c:choose>
	<p class="action_button"> <a class="btn btn-lg btn-primary btn-block" href="${path}/">Back</a> </p>
	</div>
</div>
</div>


</body>
</html>