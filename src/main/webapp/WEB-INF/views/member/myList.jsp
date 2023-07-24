<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>list</title>
    <link rel="stylesheet" href="/resources/css/myListStyle.css">
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
            <c:when test="${sessionScope.loginId == null}">
                <a href="/member/login" class="login">login</a>
            </c:when>
            <c:when test="${sessionScope.loginId != null}">
                <a href="/member/myPage" class="login">${sessionScope.loginId}님의 마이페이지</a>
            </c:when>
        </c:choose>
    </div>
</header>
<div class="contents">
    <h2>내 글 관리</h2>
    <div class="search_wrap">
        <form class="search">
            <select class="search-option" name="option">
                <option value="A" <c:out value="${myListPaging.option eq 'A'? 'selected' :''}"/> >제목+내용</option>
                <option value="T" <c:out value="${myListPaging.option eq 'T'? 'selected' : ''}"/> >제목</option>
                <option value="W" <c:out value="${myListPaging.option eq 'W'? 'selected' : ''}"/> >작성자</option>
            </select>
            <input type="text" name="keyword" value="${myListPaging.keyword}">
            <button class="searchButton" type="submit">검색</button>
        </form>
    </div>

    <table>
        <tr>
            <th>글번호</th>
            <th>작성자</th>
            <th>제목</th>
            <th>mbti</th>
            <th>조회수</th>
            <th>작성날짜</th>
            <%--        <th>삭제</th>--%>
        </tr>
        <c:forEach items="${boardList}" var="board">
            <tr>
                <td>${board.bno}</td>
                <td>${board.boardId}</td>
                <td><a href="/board?bno=${board.bno}&myListPage=${myListmyListPaging.myListPage}&keyword=${myListmyListPaging.keyword}&option=${myListmyListPaging.option}&boardId=${myListmyListPaging.boardId}&condition=${condition}">${board.boardTitle} [${board.comment_cnt}]</a></td>
                <td>${board.boardMbti}</td>
                <td>${board.boardHits}</td>
                <td>${board.boardCreatedTime}</td>
                    <%--            <td>--%>
                    <%--                <button onclick="deleteBoard('${board.bno}')">삭제</button>--%>
                    <%--            </td>--%>
            </tr>
        </c:forEach>
    </table>

    <c:choose>
        <c:when test="${sessionScope.loginId != null}">
            <button onclick="save()" type="button" class="btn-write">글 작성</button> <!-- 버튼 스타일을 적용한 클래스로 변경 -->
        </c:when>
    </c:choose>


    <div class="pagination">
        <c:choose>
            <c:when test="${myListmyListPaging.myListPage <= 1}">
                <span onclick="alert('이전 페이지가 없습니다')"> &lt; </span>
            </c:when>
            <c:otherwise>
                <a href="/member/myList?myListPage=${myListPaging.myListPage - 1}&option=${myListPaging.option}&keyword=${myListPaging.keyword}&boardId=${myListPaging.boardId}"> &lt; </a>
            </c:otherwise>
        </c:choose>

        <c:forEach begin="${myListPaging.myListStartPage}" end="${myListPaging.myListEndPage}" var="i" step="1">
            <c:choose>
                <c:when test="${i eq myListPaging.myListPage}">
                    <span class="selected" style="color: #FF0266">${i}</span>
                </c:when>
                <c:otherwise>
                    <a href="/member/myList?myListPage=${i}&option=${myListPaging.option}&keyword=${myListPaging.keyword}&boardId=${myListPaging.boardId}">${i}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>

        <c:choose>
            <c:when test="${myListPaging.myListPage >= myListPaging.myListMaxPage}">
                <span onclick="alert('다음 페이지가 없습니다')"> &gt; </span>
            </c:when>
            <c:otherwise>
                <a href="/member/myList?myListPage=${myListPaging.myListPage + 1}&option=${myListPaging.option}&keyword=${myListPaging.keyword}&boardId=${myListPaging.boardId}"> > </a>
            </c:otherwise>
        </c:choose>
    </div>

</div>
</body>
<script>
    const save = () => {
        location.href = "/board/save";
    }
</script>
</html>
