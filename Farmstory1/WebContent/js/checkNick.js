// 닉네임 정규 표현식
var regNick = /^[a-z가-힣0-9]{2,5}$/;  

// 최종 점검을 위한 상태변수 선언
var isNickOk = false;

$(document).ready(function(){
	
	var alreadyCheck = false; 
	
	$('input[name=nick]').focusout(function(){
		
		if(alreadyCheck){
			alreadyCheck = false;
			return false;
		}
		
		var tag = $(this);
		var nick = tag.val();
		var json = {"nick": nick};
		
		if(regNick.test(nick) == false){
			alert('별명은 영어 소문자, 한글, 숫자(조합)로 최소 2자 이상이어야 합니다.');
			tag.focus();
			alreadyCheck = true;
			return false;
		}
		
		// 모든 검증이 통과되고 통신시작
		$.ajax({
			url: '/Jboard1/user/proc/checkNick.jsp',
			type: 'get',
			data: json,
			dataType: 'json',
			success: function(data){
				
				if(data.result == 1){
					$('.resultNick').css('color', 'red').text('이미 사용 중인 별명 입니다.');
					tag.focus();
				}else{
					$('.resultNick').css('color', 'green').text('사용 하실 수 있는 별명 입니다.');
					isNickOk = true;
				}    					
			}   				
			
		});
	});   		
	
});