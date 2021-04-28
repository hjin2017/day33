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
	//계정 로그인 확인
	if("<%=session.getAttribute("name") %>" == "없음" || "<%=session.getAttribute("name") %>" == "null"){
		$("#name").text("허진호 포트폴리오");
	}else{
		$("#a").hide();
		$("#b").hide();
		$("#c").show();
		$("#d").show();
		$("#name").text("<%=session.getAttribute("name") %>");
	}
	//조인 버튼
	$("#join_btn").on("click",function(){
		$("#sign_Up").show();
		$("#mainview").hide();
		$("#consingup").hide();
		textareaHandle(2);
	});
	//로그인 버튼
	$("#login_btn").on("click",function(){
		$.ajax({ 
			url:'<%=request.getContextPath()%>/login',
			data: {'id':$('#id').val(),'pw':$('#pw').val(),} , 
			type: 'post' , 
			dataType: 'json' ,
			success: function(e){
				if(e.process=='true')
					alert('아이디와 비밀번호를 확인하세요.');
				else{
					alert('로그인 ok');
					$.ajax({ 
						url:'<%=request.getContextPath()%>/getSession',
						type: 'post' , 
						dataType: 'json' ,
						success: function(e){$('#name').text(e.process);}
					});
					location.reload();
				}
			}
		});
		
	});
	//로그아웃 버튼
	$("#logout_btn").on("click",function(){
		$.ajax({ 
			url:'<%=request.getContextPath()%>/setName',
			type: 'post' , 
			dataType: 'json' ,
			data:{'name':"없음"}
		});
		$("#name").text("허진호 포트폴리오");
		$("#id").val('');
		$("#pw").val('');
		location.reload();
	});
});

/* bluejeansh@hanmail.net

이메일 주소로 일요일 밤 12시까지 과제물 구현 산출물(프로젝트+sql파일들) 전송하세요.
제목은 kdigital-본인이름 으로 해주세요. */

</script>
</head>
<body>
 <img id="headerimg" alt="monster" width="75px" height="75px"  src="resources/img/blelin.gif">
 <div id ="name">허진호 포트폴리오</div>
 <div id ="b">  
	 ID <input class="login" id="id"> 
	 PW <input type="password" class="login" id="pw"> 
	 <button id="login_btn">LOGIN</button>
	 <button id="join_btn">JOIN</button> 
</div>

<div id ="d"></div>
<div id ="c">  
	<button id="logout_btn">LOGOUT</button>
</div>

</body>
</html>