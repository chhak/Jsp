<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>글수정</title>
    <link rel="stylesheet" href="./css/style.css"/>
</head>
<body>
    <div id="wrapper">
        <section id="board" class="modify">
            <h3>글수정</h3>
            <article>
                <form action="#">
                	<input type="hidden" name="seq" value="" />
                    <table>
                        <tr>
                            <td>제목</td>
                            <td><input type="text" name="title" value="제목입니다." placeholder="제목을 입력하세요."/></td>
                        </tr>
                        <tr>
                            <td>내용</td>
                            <td>
                                <textarea name="content">내용입니다.</textarea>                                
                            </td>
                        </tr>
                        <tr>
                            <td>첨부</td>
                            <td><input type="file" name="file"/></td>
                        </tr>
                    </table>
                    <div>
                        <a href="#" class="btnCancel">취소</a>
                        <input type="submit"  class="btnWrite" value="수정완료"/>
                    </div>
                </form>
            </article>
        </section>
    </div>
</body>
</html>