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
<h2>관리자 페이지</h2>

<button onclick="goHome()">Home</button>
<button onclick="memberList()">회원관리</button>
<button onclick="boardList()"> 게시글 관리 </button>
<button onclick="logout()">로그아웃</button>

<script>
    const goHome = () => {
        location.href = "/";
    }
    const memberList = () => {
        location.href = "/admin/memberList";
    }
    const logout = () => {
        location.href = "/member/logout";
    }

    const boardList = () =>{
        location.href = "/admin/boardList";
    }
</script>
</body>
</html>
