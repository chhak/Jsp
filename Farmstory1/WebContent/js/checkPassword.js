// 최종 점검을 위한 상태변수 선언
var isPassOk = false;

$(function(){

	// 비밀번호 일치여부 확인
	$('input[name=pass2]').focusout(function(){
		
		var pass1 = $('input[name=pass1]').val();
		var pass2 = $('input[name=pass2]').val();
		
		if(pass1 == ''){
			alert('비밀번호를 입력하세요.');
			return;
		}
		
		if(pass1 != pass2){
			$('.resultPass').css('color', 'red').text('비밀번호가 일치하지 않습니다.');
			isPassOk = false;
		}else{
			$('.resultPass').css('color', 'green').text('비밀번호가 일치 합니다.');
			isPassOk = true;
		}
	});
});