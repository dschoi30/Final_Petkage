<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>

<p>
	<a href="${ path }/market/product-write">상품 등록</a><br><br>
	<a href="${ path }/market/product-list">상품 목록</a>
</p>
</body>
</html>
