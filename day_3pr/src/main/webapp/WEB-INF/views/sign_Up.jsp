<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

var arrIsActive=[false,false,false,false];
//조인 초기화
function resetsign_Up(){ 
	for(var i=0; i<$("#sign_Up input").length;i++ ){
		$("#sign_Up input").eq(i).val('');
	}
	$("#sign_Up").hide();
}

$(document).ready(function(){
	//동일한 아이디와 계정별명을 걸러준다
	function valCheck(target,index){
		if(target.val()==''){alert("아무것도 입력되지 않았습니다");return;}
		$.ajax({ 
			url:'<%=request.getContextPath()%>/singUpid',
			data: {'val':target.val()} , 
			type: 'post' , 
			dataType: 'json' ,
			success: function(e){
				if(e.process=='true'){
					alert("사용가능합니다");
					arrIsActive[index]=true;
				}
				else{
					alert("사용이 불가능합니다");
					arrIsActive[index]=false;
					target.val('');
				}	
			}
		});
	}
	//아이디 클릭
	$("#id_but").on("click" ,function(){
		if($('#idval').val()==$('#singname').val()){alert("아이디와 별명이 중복되었습니다");return;}
		valCheck($('#idval'),0);
	});
	//별명 클릭
	$("#name_but").on("click",function(){
		if($('#idval').val()==$('#singname').val()){alert("아이디와 별명이 중복되었습니다");return;}
		valCheck($('#singname'),1);
	});
	//이메일 클릭
	$("#email_but").on("click",function(){
		valCheck($('#email'),2);
	});
	//비밀번호 클릭
	$("#pw_but").on("click",function(){
		if($('#pw1').val().length <8){
			alert("비밀번호가 너무 짧습니다");
			return;
		}
		if($('#pw1').val()==$('#pw2').val()){
			alert("비밀번호가 일치합니다");
			arrIsActive[3]=true;
		}
		else{
			alert("비밀번호가 일치하지 않습니다");
			arrIsActive[3]=false;
		}
	});
	//나가기
	$("#cancel_but").on("click",function(){
		resetsign_Up();
		$("#mainview").show();
	});
	//가입하기
	$("#can_but").on("click",function(){
		for(var i=0; i<$("#sign_Up input").length;i++ ){
			if($("#sign_Up input").eq(i).val()==''){
				alert("정보가 부족합니다");
				return;
			}
		}
		
		for(var i=0; i<arrIsActive.length;i++ )
			if(arrIsActive[i]==false) return;
		
		$.ajax({ 
			url:'<%=request.getContextPath()%>/singUp',
			data: {'name':$('#singname').val(), 'id':$('#idval').val(),'pw':$('#pw1').val(),'email':$('#email').val(),} , 
			type: 'post' , 
			dataType: 'json' ,
			success: function(e){
				alert(e.process);
			}		
		});
		resetsign_Up();
		$("#consingup").show();
	});
});
</script>
</head>
<body>
	<div id="sign_Up">
		<h3>회원 가입</h3>
		<input id="idval" type="text" name="id"><button id="id_but">아이디 확인</button><br>
		<input id ="pw1" type="password" name="pw1">비밀번호 8자리 이상<br>
		<input id ="pw2" type="password" name="pw2"><button id="pw_but">비밀번호 확인</button><br>
		<input id="email" type="text"  name="email"><button id="email_but">이메일 확인</button><br>
		<input id="singname" type="text" name="name"><button id="name_but">별명 확인</button><br>
		<div><button id="cancel_but">취소</button><button id="can_but">가입</button> </div>
	</div>
</body>
</html>