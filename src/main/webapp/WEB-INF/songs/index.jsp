<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Lookify Home</title>
</head>
<body>
	<h1>All Songs</h1>
	<a href="/search/topTen">Top 5 Songs</a>
	<form action="/search" method="post">
    	<p>
        	<input name="artist"/>
    	</p>
    	<input type="submit" value="Search Artists"/>
	</form> 
	<table>
    	<thead>
        	<tr>
            	<th>Title</th>
            	<th>Artist</th>
            	<th>Rating</th>
            	<th>Action</th>
        	</tr>
    	</thead>
    	<tbody>
        	<c:forEach items="${songs}" var="song">
        		<tr>
            		<td><a href="/songs/${song.id}"><c:out value="${song.title}"/></a></td>
            		<td><c:out value="${song.artist}"/></td>
            		<td><c:out value="${song.rating}"/></td>
            		<td>
            			<form action="/songs/${song.id}" method="post">
    						<input type="hidden" name="_method" value="delete">
    						<input type="submit" value="Delete">
						</form>
					</td>
        		</tr>
        	</c:forEach>
    	</tbody>
	</table>
<a href="/songs/new">New Song</a>
</body>
</html>