// 폼 검증에 사용할 상태 변수
var isPassOk = false;

$(function(){
	
	var pass1 = $('input[name=pass1]');
	var pass2 = $('input[name=pass2]');
	
	
	pass2.focusout(function(){
		
		var value1 = pass1.val();
		var value2 = pass2.val();
	
		if(value1 == value2){
			alert('비밀번호가 서로 일치합니다.');
			isPassOk = true;
		}else{
			alert('비밀번호가 서로 일치하지 않습니다.');
			isPassOk = false;
		}		
		
	});	
	
});