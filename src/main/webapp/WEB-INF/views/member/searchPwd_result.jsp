<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>login</title>
  <link rel="stylesheet" href="/resources/css/searchPwdResult.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;500&display=swap" rel="stylesheet">
</head>
<body>
<div class="container">
    <form>
        <div class="text">
            👉임시비밀번호를 발급했습니다<br>
        </div>
        <div class="text_detail">
            (임시비밀번호로 로그인 해주시고, 마이페이지에서 비밀번호 변경해주시길 바랍니다)
        </div>

        <div class="resultPwd">
            <div class="newPwdName">
                임시비밀번호
            </div>
            <div class="newPwd">
                <h3> ${newPwd}</h3>
            </div>

        </div>
        <div class="buttons">
            <button type="button" class="login" onclick="logIn()" > 로그인 </button>
            <button type="button" class="signIn" onclick="signIn()" > 회원가입 </button>
            <button type="button" class="search_id" onclick="searchId()" > 아이디 찾기 </button>
            <button type="button" class="search_pwd" onclick="searchPwd()" > 비밀번호 찾기 </button>
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

  const searchPwd = () =>{
    location.href = "/member/searchPwd";
  }
</script>
</html>
