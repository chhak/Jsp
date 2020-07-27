<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <link rel="stylesheet" href="/Jboard2/css/style.css"/>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="/Jboard2/js/checkUid.js"></script>
    <script src="/Jboard2/js/checkPass.js"></script>
    <script>
    	//유효성(validation) 검증
    	$(function(){
    		$('.register > form').submit(function(){
           		
           		// 아이디 중복 여부 확인
           		if(!isUidOk){
           			alert('아이디 다시 확인 하십시요.');
           			return false;	
           		}
           		// 비밀번호 일치여부 확인
       			if(!isPassOk){
       				alert('비밀번호 다시 확인 하십시요.');
       				return false;
           		}
           		
           		// 이름 한글여부 확인
       			if(false){
       				alert('이름 다시 확인 하십시요.');
       				return false;
           		}
           		
           		// 별명 중복 여부 확인
       			if(false){
       				alert('별명 다시 확인 하십시요.');
       				return false;
           		}
           		
           		// 이메일 중복 여부 확인
       			if(false){
       				alert('이메일 다시 확인 하십시요.');
       				return false;
           		}
           		
           		// 휴대폰 중복 여부 확인
       			if(false){
       				alert('휴대폰 다시 확인 하십시요.');
       				return false;
           		}
           		// 최종 데이터 확인 완료
           		return true;
           	});
    	});
    </script>
    
</head>
<body>
    <div id="wrapper">
        <section id="user" class="register">
            <form action="/Jboard2/user/register.do" method="POST">
                <table border="1">
                    <caption>사이트 이용정보 입력</caption>
                    <tr>
                        <td>아이디</td>
                        <td>
                            <input type="text" name="uid" placeholder="아이디 입력"/>
                            <span class="resultId"></span>
                        </td>
                    </tr>
                    <tr>
                        <td>비밀번호</td>
                        <td>
                            <input type="password" name="pass1" placeholder="비밀번호 입력"/>                            
                        </td>
                    </tr>
                    <tr>
                        <td>비밀번호 확인</td>
                        <td>
                            <input type="password" name="pass2" placeholder="비밀번호 확인 입력"/>
                            <span class="resultPass"></span>
                        </td>
                    </tr>
                </table>
                <table border="1">
                    <caption>개인정보 입력</caption>
                    <tr>
                        <td>이름</td>
                        <td>
                            <input type="text" name="name" placeholder="이름 입력"/>                            
                        </td>
                    </tr>
                    <tr>
                        <td>별명</td>
                        <td>
                            <p>공백없이 한글, 영문, 숫자만 입력가능</p>
                            <input type="text" name="nick" placeholder="별명 입력"/>
                            <span class="resultNick"></span>                            
                        </td>
                    </tr>
                    <tr>
                        <td>E-Mail</td>
                        <td>
                            <input type="email" name="email" placeholder="이메일 입력"/>
                        </td>
                    </tr>
                    <tr>
                        <td>휴대폰</td>
                        <td>
                            <input type="text" name="hp" placeholder="- 포함 13자리 입력" minlength="13" maxlength="13" />
                        </td>
                    </tr>
                    <tr>
                        <td>주소</td>
                        <td>
                            <div>
                                <input type="text" name="zip" placeholder="우편번호" readonly/>
                                <button class="btnZip">주소검색</button>
                            </div>                            
                            <div>
                                <input type="text" name="addr1" placeholder="주소를 검색하세요." readonly/>
                            </div>
                            <div>
                                <input type="text" name="addr2" placeholder="상세주소를 입력하세요."/>
                            </div>
                        </td>
                    </tr>
                </table>

                <div>
                    <a href="/Jboard2/user/login.do" class="btnCancel">취소</a>
                    <input type="submit" class="btnJoin" value="회원가입"/>
                </div>

            </form>
        </section>
    </div>    
</body>
</html>