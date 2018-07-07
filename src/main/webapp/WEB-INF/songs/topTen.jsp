<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Top Ten Songs</title>
</head>
<body>
	<h1>Top Ten Songs:</h1>
		<ul>
			<c:forEach items="${songs}" var="song">
				<li><c:out value="${song.rating}"/>-<c:out value="${song.title}"/>-<c:out value="${song.artist}"/></li>
			</c:forEach>
		</ul>
</body>
</html>