<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>login</title>
    <link rel="stylesheet" href="/resources/css/search.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;500&display=swap" rel="stylesheet">
    <script src="/resources/js/jquery-3.3.1.min.js"></script>
</head>
<body>
<div class="container">
    <form action="/member/changePwd" id="createForm" name="createForm" method="post">
        <input type="hidden" id="memberId" name="memberId" value="${sessionScope.loginId}">
        <h3>🔐비밀번호 변경</h3>
        <input type="password" id="memberPassword" name="memberPassword" placeholder="현재 비밀번호">
        <input type="password" id="newMemberPwd" name="newMemberPwd" placeholder="새로운 비밀번호">
        <input type="password" id="newMemberPwd_check" name="newMemberPwd_check" placeholder="새로운 비밀번호 확인">
        <div class="buttons">
<%--            <button type="button" class="selfPwdUpdate" id="selfPwdUpdate" onclick="selfPwdUpdate()" > 비밀번호 변경 </button>--%>
            <input type="submit" value="비밀번호 변경" onclick="selfPwdUpdate(); return false;" class="submit-button">
            <%--<input type="submit" value="로그인">--%>
            <button type="button" class="login" onclick="logIn()" > 로그인 </button>
            <button type="button" class="signIn" onclick="signIn()" > 회원가입 </button>
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






    const selfPwdUpdate = () => {
        const passwordDB = '${member.memberPassword}';
        const password = document.getElementById("memberPassword").value.trim();
        const newPassword = document.getElementById("newMemberPwd").value.trim();
        const newMemberPwd_check = document.getElementById("newMemberPwd_check").value.trim();

        // 입력 필드가 비어있는지 확인
        if (password !== '' && newPassword !== '' && newMemberPwd_check !== '') {
            // 새로운 비밀번호와 확인이 일치하는지 확인
            if (newPassword === newMemberPwd_check) {
                // 기존 비밀번호와 일치하는지 확인
                if (passwordDB === password) {
                    // 모든 조건이 만족되면 비밀번호 변경 요청을 서버에 전송
                    if (confirm("비밀번호를 변경하시겠습니까?")) {
                        alert("비밀번호 변경이 완료되었습니다. 다시 로그인해주세요.");
                        document.createForm.submit();

                    }
                } else {
                    alert("현재 비밀번호가 일치하지 않습니다!");
                    document.getElementById("memberPassword").focus();
                }
            } else {
                alert("새로 입력한 비밀번호 확인이 올바르지 않습니다. 다시 입력해주세요");
                document.getElementById("newMemberPwd").focus();
            }
        } else {
            alert("비밀번호가 입력되지 않았습니다. 비밀번호를 다시 입력해주세요");
            document.getElementById("memberPassword").focus();
        }



    }




</script>
</html>
