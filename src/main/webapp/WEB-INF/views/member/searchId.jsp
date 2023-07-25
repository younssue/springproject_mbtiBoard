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
    <form action="/member/searchId_result" id="createForm" method="Post">
        <h3>🗝️아이디 찾기</h3>
        <input type="text" id="memberName" name="memberName" placeholder="이름을 입력해주세요">
        <input type="tel" id="memberMobile" name="memberMobile" placeholder="핸드폰 번호(-없이)입력해주세요">
        <div class="buttons">
            <button type="button" class="search_id" onclick="fnSubmit(); return false;" > 아이디 찾기 </button>
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

    const searchPw = () =>{
        location.href = "/member/searchPw";
    }

    $(document).ready(function() {
        const msg = "${msg}";
        if(msg != ""){
            alert(msg);
        }
    });


    function fnSubmit() {


        const tel_rule = /^\d{2,3}\d{3,4}\d{4}$/;

        if ($("#memberName").val() == null || $("#memberName").val() == "") {
            alert("이름을 입력해주세요.");
            $("#memberName").focus();

            return false;
        }

        if ($("#memberMobile").val() == null || $("#memberMobile").val() == "") {
            alert("전화번호를 입력해주세요.");
            $("#memberMobile").focus();

            return false;
        }

        if(!tel_rule.test($("#memberMobile").val())){
            alert("전화번호 형식에 맞게 입력해주세요.");
            return false;
        }


        if (confirm("아이디를 찾으시겠습니까?")) {

            $("#createForm").submit();

            return false;
        }
    }

</script>

</script>
</html>
