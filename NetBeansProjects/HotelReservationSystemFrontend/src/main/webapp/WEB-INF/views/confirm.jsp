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
	<p class="header_title">Hotel Reservation System</p>
	<p class="errors">${error}</p>
</div>
</div>


<div class="row">
<div class="col">
<p><span class="badge badge-secondary">Room ID : ${room.id}</span></p>
<p><span class="badge badge-secondary">From : ${datefrom}  </span></p>
<p><span class="badge badge-secondary">To : ${dateto} </span></p>
</div>

<div class="col">
<p><span class="badge badge-secondary">Category : ${room.category}</span></p>
<p><span class="badge badge-secondary">Rate/Day : $${room.price}</span></p>
<p><span class="badge badge-secondary">Total :  $${totalcost}</span></p>
</div>
</div>

<div class="row">
<div class="col">
     <form:form method="POST" action="confirm" modelAttribute="guest">
     				<div class="form-group">
                    <form:label path="fname">First Name</form:label>
                    <form:errors path="fname" class="errors"/>
                    <form:input path="fname" class="form-control" value="${saved_guest.fname}"/>
                    </div>
                    
                    <div class="form-group">
                    <form:label path="lname">Last Name</form:label>
                    <form:errors path="lname" class="errors"/>
                    <form:input path="lname" class="form-control" value="${saved_guest.lname}"/>
                    </div>
                   
                  	 <div class="form-group">
                    <form:label path="phone">Phone</form:label>
                    <form:errors path="phone" class="errors"/>
                    <form:input path="phone" class="form-control" value="${saved_guest.phone}"/>
                    </div>
                    
                    <div class="form-group">
                    <form:label path="email">Email</form:label>
                    <form:errors path="email" class="errors" />
                    <form:input path="email" class="form-control" value="${saved_guest.email}"/>
                    </div>
                    <p class="action_button">
                    <input type="submit" value="Book" class="btn btn-lg btn-success btn-block"/> 
                    <a class="btn btn-lg btn-primary btn-block" href="${path}/">Back</a> </p>
        </form:form>

</div>
</div>

</div>
</body>
</html>