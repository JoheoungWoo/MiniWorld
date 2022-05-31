<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport"
	      content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>프로필 업로드</title>
</head>
<body>
<form action="profileUpload.jsp" name="fileForm" method="post" enctype="multipart/form-data" accept="image/*">
	<h3>파일명을 유저명.xxx으로 해주시면 감사합니다.</h3>
	이미지명: <input type="file" id="img" name="uploadFile"><br>
	<input type="submit" value="이미지 업로드">
</form>

<form action="action3.jsp" method="post">
	<h3>상태메시지를 적는곳입니다.</h3>
	쓰고싶은말 : <input type="text" name="msg"><br>
	<input type="submit" value="상태메시지 업로드">
</form>
</body>
</html>