<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/main.css">
<script src ="resources/jquery-3.2.1.min.js"></script>
<style type="text/css">
#ar {background-image: url('resources/img/mainView2.png');}
</style>
</head>
<body>
<div id="page">
	 <header>
			<%@include file="header.jsp" %>
	 </header>
	 <article>
		 <div id="ar">
		 	<%@include file="textarea.jsp" %>
			<%@include file="mainview.jsp" %>
			<%@include file="sign_Up.jsp" %>
			<%@include file="consingup.jsp" %>
		  </div>
	 </article>
	 <section>
	 	<div id="ar2"> 
	 		<%@include file="table.jsp" %>
	 		<%@include file="game.jsp" %>
	 	</div>
	 </section>
	 <footer>
		 <div id="ar3">
		  	<%@include file="socket_test.jsp" %>
		  </div>
		 <div id="ar4">
		 </div>
	</footer>
</div>
</body>
</html>