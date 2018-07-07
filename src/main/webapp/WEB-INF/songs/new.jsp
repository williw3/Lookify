<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>New Song Form</title>
</head>
<body>
	<h1>New Song</h1>
	<form:form action="/songs" method="post" modelAttribute="song">
    	<p>
        	<form:label path="title">Title</form:label>
        	<form:errors path="title"/>
        	<form:input path="title"/>
    	</p>
    	<p>
        	<form:label path="artist">Artist</form:label>
        	<form:errors path="artist"/>
        	<form:input path="artist"/>
    	</p>
    	<p>
        	<form:label path="rating">Rating</form:label>
        	<form:errors path="rating"/>
        	<form:select path="rating">
        		<% for(int i = 1; i < 11; i++) { %>
        		<form:option value="<%= i %>"><%= i %></form:option>
        		<% } %>
        	</form:select>
    	</p>
    
    	<input type="submit" value="Submit"/>
	</form:form> 
	<a href="/songs">Cancel</a>   
</body>
</html>