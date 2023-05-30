<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>list</title>
</head>
<body>
<table>
  <tr>
    <th>id</th>
    <th>email</th>
    <th>password</th>
    <th>name</th>
    <th>age</th>
    <th>mobile</th>
    <th>mbti</th>
    <th>조회</th>
    <th>삭제</th>
  </tr>
  <c:forEach items="${memberList}" var="member">

      <td> <a href="/member?id=${member.memberId}">${member.memberId}</a></td>
      <td>${member.memberEmail}</td>
      <td>${member.memberPassword}</td>
      <td>${member.memberName}</td>
      <td>${member.memberAge}</td>
      <td>${member.memberMobile}</td>
      <td>${member.memberMbti}</td>
      <td>
        <a href="/member?id=${member.memberId}">조회</a>
      </td>
      <td>
        <button onclick="deleteMember('${member.memberId}')">삭제</button>
      </td>
    </tr>
  </c:forEach>
</table>
</body>
<script>
  const deleteMember = (memberId) => {
    console.log(memberId);
    location.href = "/member/delete?id="+memberId;
  }
</script>
</html>
