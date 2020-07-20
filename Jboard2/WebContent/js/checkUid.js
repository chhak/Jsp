// 폼 검증에 사용할 상태 변수
var isUidOk = false;

// 아이디 중복체크
$(document).ready(function(){
	
	var inputUid = $('input[name=uid]');
	
	inputUid.focusout(function(){
		
		var uid = $(this).val();
		
		$.ajax({
			url: '/Jboard2/user/checkUid.do?uid='+uid,
			type: 'get',
			dataType: 'json',
			success: function(data){
				
				if(data.result == 1){
					$('.resultId').css('color', 'red').text('이미 사용 중인 아이디 입니다.');
					isUidOk = false;
				}else{
					$('.resultId').css('color', 'green').text('사용 할 수 있는 아이디 입니다.');
					isUidOk = true;
				}    					
				
			}    				
		});
	});
});