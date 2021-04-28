<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
//0쓰기 1읽기 3숨기기
function textareaHandle(eTextArea) {
	switch (eTextArea) {
	case 0:
		$("#textarea").show();
		$("#write").show();
		$("#Read").hide();
		$("#textarea textarea").attr("readonly",false);
		$("#mainview").hide();
		$("#textarea textarea").val('');
		$("#consingup").hide();
		break;
	case 1:
		$("#write").hide();
		$("#textarea").show();
		$("#mainview").hide();
		$("#Read").show();
		$("#textarea textarea").attr("readonly",true);
		$("#consingup").hide();
		break;
	case 2:
		$("#textarea").hide();
		break;
	}
}
//주제 삽입
function textareainsert(title,writer,textarea,seq){
	$("#Read div").eq(0).text(seq);
	$("#Read div").eq(0).append('|');
	$("#Read div").eq(0).append(title);
	$("#Read div").eq(0).append('|');
	$("#Read div").eq(0).append(writer);
	$("#textarea textarea").val('');
	$("#textarea textarea").val(textarea);

	if(writer ==$("#name").text()){
		$("#textarea textarea").attr("readonly",false);
		$("#Read button").show();
	}
	else
		$("#Read button").hide();
}

$(document).ready(function(){
	//등록 버튼
	$("#write button").on("click",function(){
		if($("#write input").val()==''){
			alert('재목을 입력하세요');
			return;
		}
		
		if($("#textarea textarea").val()==''){
			alert('내용을 입력하세요');
			return;
		}
		
		if($("#name").text() == '없음')return;
		
		$.ajax({ 
			url:'<%=request.getContextPath()%>/textareaWrite',
			data: {'title': $("#write input").val(),
				'contents': $("#textarea textarea").val(),
				'writer': $("#name").text(),} , 
			type: 'post' , 
			dataType: 'json' ,
			success: function(e){alert(e.process);}
		});
		textareaHandle(3);
		location.reload();
	});
	// 수정 버튼
	$("#Read button").on("click",function(){
		$.ajax({ 
			url:'<%=request.getContextPath()%>/textareaRevise',
			data: {'contents': $("#textarea textarea").val(),'seq':$("#Read div").text()},
			type: 'post' , 
			dataType: 'json' ,
			success: function(e){alert(e.process);}
		});
	});
});

</script>
</head>
<body>
<div  id="textarea">
<textarea rows="17" cols="110">
</textarea>
<div id="write">제목<input type="text"><button>등록</button></div>
<div id="Read"><div> </div><button>수정</button></div>
</div>
</body>
</html>