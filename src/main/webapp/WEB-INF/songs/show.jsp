<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Show Song Page</title>
</head>
<body>
	<a href="/songs">Dashboard</a>
	<h1><c:out value="${thisSong.id}"/></h1>
	<p>Name: <c:out value="${thisSong.title}"/></p>
	<p>Creator: <c:out value="${thisSong.artist}"/></p>
	<p>Rating(1-10): <c:out value="${thisSong.rating}"/></p>
	<form action="/songs/${thisSong.id}" method="post">
    	<input type="hidden" name="_method" value="delete">
    	<input type="submit" value="Delete">
	</form>
	
</body>
</html>