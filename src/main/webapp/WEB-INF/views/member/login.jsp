<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>login</title>
    <link rel="stylesheet" href="/resources/css/login.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;500&display=swap" rel="stylesheet">
</head>
<body>
<div class="container">
    <form action="/member/login" method="post">
        <h1>LOGIN</h1>
        <input type="text" name="memberId" placeholder="아이디">
        <input type="password" name="memberPassword" placeholder="비밀번호">
        <input type="submit" value="로그인">
    </form>
</div>
</body>
</html>
