<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>detail</title>
</head>
<body>
<table>
  <tr>
    <th>id</th>
    <td>${member.memberId}</td>
  </tr>
  <tr>
    <th>email</th>
    <td>${member.memberEmail}</td>
  </tr>
  <tr>
    <th>password</th>
    <td>${member.memberPassword}</td>
  </tr>
  <tr>
    <th>name</th>
    <td>${member.memberName}</td>
  </tr>
  <tr>
    <th>age</th>
    <td>${member.memberAge}</td>
  </tr>
  <tr>
    <th>mobile</th>
    <td>${member.memberMobile}</td>
  </tr>
  <tr>
    <th>mbti</th>
    <td>${member.memberMbti}</td>
  </tr>
</table>
<div class="buttons">
  <button onclick="listFn()">목록</button>
</div>
</body>
<script>


  const listFn= () => {
    location.href = `/member/myPage`;
  }
</script>
</html>
