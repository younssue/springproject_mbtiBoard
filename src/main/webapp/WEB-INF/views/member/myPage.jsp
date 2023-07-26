<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <link rel="stylesheet" href="/resources/css/myPage.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;500&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
</head>
<body>
<h2>${sessionScope.loginId} 님 환영합니다.</h2>

<button onclick="goHome()">Home</button>
<button onclick="update()">내 정보 수정하기</button>
<button onclick="changePwd()">비밀번호 변경하기</button>
<button onclick="myList()">내 게시글 </button>
<button onclick="logout()">로그아웃</button>

<script>
    const goHome = () => {
        location.href = "/";
    }
    const update = () => {
        location.href = "/member/update";
    }
    const logout = () => {
        location.href = "/member/logout";
    }

    const myList = () =>{
        location.href = "/member/myList";
    }

    const changePwd = ()=>{
        location.href ="/member/changePwd";
    }
</script>
</body>
</html>
