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
	//테이블 값 콜벡함수
	function tableinit(e){
		var i =1;
		for(var key in e){
			$("#table tr").eq(i).find('td').eq(0).text(e[key].seq);
			$("#table tr").eq(i).find('td').eq(1).text(e[key].title);
			$("#table tr").eq(i).find('td').eq(2).text(e[key].likecount);
			$("#table tr").eq(i).find('td').eq(3).text(e[key].hatecount);
			$("#table tr").eq(i).find('td').eq(4).text(e[key].viewcount);
			i++;
		}
		var temp = $("#table tr").eq(i-1).find('td').eq(0).text();
		if(i<8){
			for(i;i<8;i++){
				$("#table tr").eq(i).find('td').eq(0).text(++temp);
				$("#table tr").eq(i).find('td').eq(1).text('');
				$("#table tr").eq(i).find('td').eq(2).text(0);
				$("#table tr").eq(i).find('td').eq(3).text(0);
				$("#table tr").eq(i).find('td').eq(4).text(0);
			}
		}
	}
	//테이블 사이즈 얻어오는 콜백
	function tableSize(e){
		$("#table_foot").text('');
		
		for(var i=0; i<e.length/7; i++)
			$("#table_foot ").eq(0).append("<div> _"+(i+1)+"_ &nbsp</div>");
		
		for(var i=0;i<e.length/7;i++){
			$("#table_foot div").eq(i).on("click",function(e){
				var arraynum = $(this).text().split("_");
				var checkItem = $("#table tr").eq(1).find('td').eq(0).text();
				//조건문
				if(((arraynum[1]-1)*7)<checkItem  &&arraynum[1]*7> checkItem)return; 
				tableView((arraynum[1]-1)*7,arraynum[1]*7,tableinit);
			});
		}
		
		if("<%=session.getAttribute("name") %>" == "없음" || "<%=session.getAttribute("name") %>" == "null")return;
		$("#table_foot").append('<button>글쓰기</button>');
		$("#table_foot button").on("click",function(){
			textareaHandle(0);
			tableView(0,70,tableSize);
		});
	}
	//실행 함수
	function tableView(first,second,fun) {
		$.ajax({ 
			url:'<%=request.getContextPath()%>/textareaReadALL',
			type: 'post' , 
			dataType: 'json' ,
			data:{'first':first,'second':second},
			success: function(e){fun(e);}
		});
	}
	//init
	tableView(0,7,tableinit);
	tableView(0,999,tableSize);
	//제목 클릭 활성화
	for(var i=1;i<8;i++){
		$("#table tr").eq(i).find('td').eq(1).on("click",function(){
			if($(this).text()=='')return;
			resetsign_Up();
			$.ajax({ 
				url:'<%=request.getContextPath()%>/textareaRead',
				data: {'seq':$(this).parent().find('td').eq(0).text()},
				type: 'get' , 
				dataType: 'json' ,
				success: function(e){textareainsert(e.title,e.writer,e.contents,e.seq);}
			});
			textareaHandle(1);
		});
	}
	
	$("#table_background div").eq(1).on("click",function(){
		if("<%=session.getAttribute("name") %>" == "없음" || "<%=session.getAttribute("name") %>" == "null")return;
		$("#table_background").hide();
		$("#game_back").show();
		
	});
});
</script>
<style type="text/css">
#table_background{background-image: url('resources/img/board.png');}
</style>
</head>
<body >
<div id="table_background">
<div>게시판/</div><div>게임</div> 
<table id="table">
	<tr id= table_title><td>번호</td><td>제목</td><td>추천</td><td>반대</td><td>본수</td></tr>
	<tr><td></td><td></td><td></td><td></td><td></td></tr>
	<tr><td></td><td></td><td></td><td></td><td></td></tr>
	<tr><td></td><td></td><td></td><td></td><td></td></tr>
	<tr><td></td><td></td><td></td><td></td><td></td></tr>
	<tr><td></td><td></td><td></td><td></td><td></td></tr>
	<tr><td></td><td></td><td></td><td></td><td></td></tr>
	<tr><td></td><td></td><td></td><td></td><td></td></tr>
	<col width="10%">
	<col width="60%">
	<col width="10%">
	<col width="10%">
	<col width="10%">
</table>
<div id="table_foot" ></div>
</div>
</body>
</html>