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
        <div class="buttons">
            <button type="button" class="signIn" onclick="signIn()" > 회원가입 </button>
            <button type="button" class="search_id" onclick="searchId()" > 아이디 찾기 </button>
            <button type="button" class="search_pw" onclick="searchPw()" > 비밀번호 찾기 </button>
        </div>
    </form>
</div>
</body>
<script>
    const signIn = () => {
        location.href = "/member/save";
    }

    const searchId = () =>{
        location.href = "/member/searchId";
    }

    const searchPw = () =>{
        location.href = "/member/searchPw";
    }
</script>
</html>
