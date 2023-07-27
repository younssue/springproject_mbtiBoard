<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="/resources/css/memberUpdate.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;500&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
    <title>update</title>
</head>
<body>

<form action="/member/update" method="post" name="updateForm" class="update-form">
    <h2 class="form-title">회원정보 수정</h2>
    <div class="form-row">
        <label for="memberId">아이디:</label>
        <input type="text" name="memberId" id="memberId" value="${member.memberId}" readonly>
    </div>
    <div class="form-row">
        <label for="memberEmail">이메일:</label>
        <input type="text" name="memberEmail" id="memberEmail" value="${member.memberEmail}" readonly>
    </div>
    <div class="form-row">
        <label for="memberPassword">비밀번호:</label>
        <input type="password" name="memberPassword" id="memberPassword">
    </div>
    <div class="form-row">
        <label for="memberName">이름:</label>
        <input type="text" name="memberName" id="memberName" value="${member.memberName}" readonly>
    </div>
    <div class="form-row">
        <label for="memberAge">나이:</label>
        <input type="text" name="memberAge" id="memberAge" value="${member.memberAge}">
    </div>
    <div class="form-row">
        <label for="memberMobile">전화번호:</label>
        <input type="text" name="memberMobile" id="memberMobile" value="${member.memberMobile}">
    </div>
    <div class="form-row">
        <label for="memberMbti">MBTI 선택:</label>
        <select name="memberMbti" id="memberMbti">
            <option value="${member.memberMbti}" selected>${member.memberMbti}</option>
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
        </select>
    </div>
    <div class="form-row">
        <input type="submit" value="수정" onclick="update()" class="submit-button">
    </div>
</form>

</div>
</body>
<script>
    const update = () => {
        const passwordDB = '${member.memberPassword}';
        const password = document.getElementById("memberPassword").value;
        if (passwordDB == password) {
            alert("회원정보가 수정되었습니다. ");
            document.updateForm.submit();
        } else {
            alert("비밀번호가 일치하지 않습니다!");
            document.getElementById("memberPassword").focus();
            return false;
        }
    }
</script>
</html>