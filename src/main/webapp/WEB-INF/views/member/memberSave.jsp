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

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;500&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
    <style>
 /*       * { box-sizing:border-box;
            font-family: 'Noto Sans KR', sans-serif;
        }

        form {
            width:400px;
            height:600px;
            display : flex;
            flex-direction: column;
            align-items:center;
            position : absolute;
            top:50%;
            left:50%;
            transform: translate(-50%, -50%) ;
            border: 1px solid rgb(89,117,196);
            border-radius: 10px;
        }

        .input-field {
            width: 300px;
            height: 40px;
            border : 1px solid rgb(89,117,196);
            border-radius:5px;
            padding: 0 10px;
            margin-bottom: 10px;
        }

        label {
            width:300px;
            height:30px;
            margin-top :4px;
        }

        .joinButton{
            background-color: #FF0266;
            color : white;
            width:300px;
            height:50px;
            font-size: 17px;
            border : none;
            border-radius: 5px;
            margin : 20px 0 30px 0;
        }

        .title {
            font-size : 50px;
            margin: 40px 0 30px 0;
        }



        .mbti-chk {
            margin-top : 5px;
        }*/
    </style>
</head>
<body>
<form action="/member/save" method="post">
    <input type="text" name="memberId" placeholder="아이디" id="memberId" onblur="idCheck()">
    <%--<button onclick="idCheck()">중복아이디체크</button>--%>
    <p id="check-result"></p>
    <input type="text" name="memberEmail" placeholder="이메일" >
    <input type="text" name="memberPassword" placeholder="비밀번호">
    <input type="text" name="memberName" placeholder="이름">
    <input type="text" name="memberAge" placeholder="나이">
    <input type="text" name="memberMobile" placeholder="전화번호">
    <label for="">MBTI 선택</label>
    <select name="memberMbti">
        <optgroup label="MBTI">
            <option value="ISTJ"/>ISTJ</option>
            <option value="ISTP"/>ISTP</option>
            <option value="INFJ"/>INFJ</option>
            <option value="INTJ"/>INTJ</option>
            <option value="ISFJ"/>ISFJ</option>
            <option value="ISFP"/>ISFP</option>
            <option value="INFP"/>INFP</option>
            <option value="INTP"/>INTP</option>
            <option value="ESTJ"/>ESTJ</option>
            <option value="ESFP"/>ESFP</option>
            <option value="ENFP"/>ENFP</option>
            <option value="ENTP"/>ENTP</option>
            <option value="ESTP"/>ESTP</option>
            <option value="ESFJ"/>ESFJ</option>
            <option value="ENFJ"/>ENFJ</option>
            <option value="ENTJ"/>ENTJ</option>

        </optgroup>
    </select>
    </div>
    <input type="submit" value="회원가입">
</form>
</body>

<script>
// 아이디 입력값을 가져오고
// 입력값을 서버로 전송하고 똑같은 아이디가 있는지 체크한 후
// 사용 가능 여부를 이메일 입력창 아래에 표시
const idCheck = () => {
    const memberId = document.getElementById("memberId").value;
    const checkResult = document.getElementById("check-result");
    console.log("입력한 아이디", memberId);
    $.ajax({
        // 요청방식: post, url: "id-check", 데이터: 아이디
        type: "post",
        url: "/member/id-check",
        data: {
            "memberId": memberId
        },
        success: function(res) {
            console.log("요청성공", res);
            if (res == "ok") {
                console.log("사용가능한 아이디");
                checkResult.style.color = "green";
                checkResult.innerHTML = "사용가능한 아이디";
            } else {
                console.log("이미 사용중인 아이디");
                checkResult.style.color = "red";
                checkResult.innerHTML = "이미 사용중인 아이디";
            }
        },
        error: function(err) {
            console.log("에러발생", err);
        }
    });
}
</script>
</html>
