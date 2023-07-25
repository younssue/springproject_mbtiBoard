<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>login</title>
  <link rel="stylesheet" href="/resources/css/search.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;500&display=swap" rel="stylesheet">
</head>
<body>
<div class="container">
    <form>
        <div class="text">
            👉아이디를 확인하고 로그인 해주세요
        </div>

        <div class="resultId">
            <c:choose>
              <c:when test="${empty memberSearch}">
                <p>조회결과가 없습니다</p>
              </c:when>
              <c:otherwise>
                <h3>Id:</h3>
                <h3> ${memberSearch.memberId}</h3>
              </c:otherwise>

            </c:choose>
        </div>
        <div class="buttons">
            <button type="button" class="login" onclick="logIn()" > 로그인 </button>
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

  const logIn = () => {
    location.href = "/member/login";
  }

  const searchId = () =>{
    location.href = "/member/searchId";
  }

  const searchPw = () =>{
    location.href = "/member/searchPw";
  }
</script>
</html>
