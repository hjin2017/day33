<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
$(document).ready(function(){
	$("#game_back div").eq(0).on("click",function(){
		$("#game_back").hide();
		$("#table_background").show();
	});
	$("#right_menu div").eq(0).on("click",function(){
		$("#right_menu img").show();
	});
		
	$("#right_menu div").eq(1).on("click",function(){
		$("#right_menu img").hide();
	});
	
});
</script>
<style type="text/css">
#game_back div{
float: left;
}
#game_back{
background-color:white;
width: 820px;
height: 100%;
}
</style>
</head>
<body>
<div id ="game_back" style="display: none; background-color: white;">
	<div>게시판/</div><div>게임</div><br>
	<div id="left_menu" style="width: 410px; height: 90%">
		<div style="width: 410px; height: 40%;">
		<img alt="monster" src="resources/img/gob.jpg" style="width:90px; height:90px; float: left;">
		<div style=" width: 20%;"> 힘 :</div><div>10</div><br>
		<div style=" width: 20%;">속도 :</div><div>10</div><br>
		<div style=" width: 20%;">민첩 :</div><div>10</div><br>
		<div style=" width: 20%;">골드 :</div><div>0</div><br>
		</div>
		<div style="width: 410px; height: 60%;">
		<div>상태</div><br>
		<di>몬스터와 전투중</di><br>
		</div>
	</div>
 	<div id="right_menu" style="width: 410px; height: 90%">
 		<div >지도/</div><div>소원</div> 
		<img alt="map" src="resources/img/map.jpg" style="width:410px; height:90%; float: left;display: none;"><br>
	</div>
</div>
</body>
<!-- <div id="top_menu" style="background-color: black; width: 410px; height: 30%;" >
이미지 스텟
</div> -->
</html>