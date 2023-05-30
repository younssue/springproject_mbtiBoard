<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>update</title>
</head>
<body>
<form action="/member/update" method="post" name="updateForm">
    id: <input type="text" name="memberId" value="${member.memberId}"readonly>
    email: <input type="text" name="memberEmail" value="${member.memberEmail}"readonly>
    password: <input type="text" name="memberPassword" id="memberPassword">
    name: <input type="text" name="memberName" value="${member.memberName}" readonly>
    age: <input type="text" name="memberAge" value="${member.memberAge}">
    mobile: <input type="text" name="memberMobile" value="${member.memberMobile}">

    <label for="">MBTI 선택</label>
    <select name="memberMbti">
        <optgroup label="MBTI 선택" >
            <option value="${member.memberMbti}"/> ${member.memberMbti} </option>
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
    <input type="button" value="수정" onclick="update()">

</form>
</div>
</body>
<script>
    const update = () => {
        const passwordDB = '${member.memberPassword}';
        const password = document.getElementById("memberPassword").value;
        if (passwordDB == password) {
            document.updateForm.submit();
        } else {
            alert("비밀번호가 일치하지 않습니다!");
        }
    }
</script>
</html>