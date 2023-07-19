<%--
  Created by IntelliJ IDEA.
  User: candy
  Date: 2023-05-25
  Time: 오후 8:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <link rel="stylesheet" href="/resources/css/memberSave.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;500&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>


</head>
<body>
<form action="/member/save" method="post">
    <h2 class="title">Sign In</h2>
    <input type="text" name="memberId" placeholder="아이디" id="memberId" onblur="idCheck()" class="input-field">
    <p id="check-result" class="check-result"></p>
    <input type="text" name="memberEmail" placeholder="이메일" class="input-field">
    <input type="password" name="memberPassword" placeholder="비밀번호" class="input-field">
    <input type="text" name="memberName" placeholder="이름" class="input-field">
    <input type="text" name="memberAge" placeholder="나이" class="input-field">
    <input type="text" name="memberMobile" placeholder="전화번호" class="input-field">
    <label for="memberMbti">MBTI 선택</label>
    <select name="memberMbti" id="memberMbti" class="input-field">
        <optgroup label="MBTI">
            <option value="ISTJ">ISTJ</option>
            <option value="ISTP">ISTP</option>
            <option value="INFJ">INFJ</option>
            <option value="INTJ">INTJ</option>
            <option value="ISFJ">ISFJ</option>
            <option value="ISFP">ISFP</option>
            <option value="INFP">INFP</option>
            <option value="INTP">INTP</option>
            <option value="ESTJ">ESTJ</option>
            <option value="ESFP">ESFP</option>
            <option value="ENFP">ENFP</option>
            <option value="ENTP">ENTP</option>
            <option value="ESTP">ESTP</option>
            <option value="ESFJ">ESFJ</option>
            <option value="ENFJ">ENFJ</option>
            <option value="ENTJ">ENTJ</option>
        </optgroup>
    </select>
    <input type="submit" value="회원가입" class="joinButton">
</form>

<script>
    const idCheck = () => {
        const memberId = document.getElementById("memberId").value;
        const checkResult = document.getElementById("check-result");
        console.log("입력한 아이디", memberId);
        $.ajax({
            type: "post",
            url: "/member/id-check",
            data: {
                "memberId": memberId
            },
            success: function(res) {
                console.log("요청성공", res);
                if (res === "ok") {
                    console.log("사용가능한 아이디입니다");
                    checkResult.style.color = "green";
                    checkResult.innerHTML = "사용가능한 아이디입니다";
                } else if(res === "no") {
                    console.log("이미 사용중인 아이디입니다");
                    checkResult.style.color = "red";
                    checkResult.innerHTML = "이미 사용중인 아이디입니다";
                }  else if(res === "wait") {
                    console.log("아이디를 입력해주세요");
                    checkResult.style.color = "black";
                    checkResult.innerHTML = "아이디를 입력해주세요";
                }
            },
            error: function(err) {
                console.log("에러발생", err);
            }
        });
    }
</script>
</body>
</html>
