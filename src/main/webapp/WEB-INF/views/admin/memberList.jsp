<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>list</title>
    <link rel="stylesheet" href="/resources/css/ListStyle.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;500&display=swap" rel="stylesheet">
</head>
<body>
<header>
    <div class="inner">
        <a href="/" class="logo">MBTI Board</a>
        <c:choose>

            <c:when test="${sessionScope.loginId.equals('admin')}">
                <a href="/admin/" class="login">관리자페이지</a>
            </c:when>
        </c:choose>
    </div>
</header>
<div class="contents">
    <h2>회원관리</h2>
    <div class="search_wrap">
        <form class="search">
            <select class="search-option" name="option">
                <option value="W" <c:out value="${paging.option eq 'W'? 'selected' : ''}"/> >회원ID</option>
            </select>
            <input type="text" name="keyword" value="${paging.keyword}">
            <button class="searchButton" type="submit">검색</button>
        </form>
    </div>


    <table>
        <tr>
            <th>id</th>
            <th>email</th>
            <th>password</th>
            <th>name</th>
            <th>age</th>
            <th>mobile</th>
            <th>mbti</th>
            <th>삭제</th>
        </tr>
        <c:forEach items="${memberList}" var="member">
            <tr>
                <td>${member.memberId}</td>
                <td>${member.memberEmail}</td>
                <td>${member.memberPassword}</td>
                <td>${member.memberName}</td>
                <td>${member.memberAge}</td>
                <td>${member.memberMobile}</td>
                <td>${member.memberMbti}</td>
                <td>
                    <button onclick="deleteMember('${member.memberId}')">삭제</button>
                </td>
            </tr>
        </c:forEach>
    </table>
    <div class="pagination">
        <c:choose>
            <c:when test="${paging.memberPage <= 1}">
                <span onclick="alert('이전 페이지가 없습니다')"> &lt; </span>
            </c:when>
            <c:otherwise>
                <a href="/admin/memberList?memberPage=${paging.memberPage - 1}&option=${paging.option}&search=${paging.keyword}"> &lt; </a>
            </c:otherwise>
        </c:choose>

        <c:forEach begin="${paging.memberStartPage}" end="${paging.memberEndPage}" var="i" step="1">
            <c:choose>
                <c:when test="${i eq paging.memberPage}">
                    <span class="selected" style="color: #FF0266">${i}</span>
                </c:when>
                <c:otherwise>
                    <a href="/admin/memberList?memberPage=${i}&option=${paging.option}&search=${paging.keyword}">${i}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>

        <c:choose>
            <c:when test="${paging.memberPage >= paging.memberMaxPage}">
                <span onclick="alert('다음 페이지가 없습니다')"> &gt; </span>
            </c:when>
            <c:otherwise>
                <a href="/admin/memberList?memberPage=${paging.memberPage + 1}&option=${paging.option}&search=${paging.keyword}"> > </a>
            </c:otherwise>
        </c:choose>
    </div>
</div>
</body>
<script>
    const deleteMember = (memberId) => {
        console.log(memberId);
        location.href = "/admin/delete?id=" + memberId;
    }
</script>
</html>
