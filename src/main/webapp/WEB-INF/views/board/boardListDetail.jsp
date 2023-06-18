<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>detail.jsp</title>
</head>
<body>
<table>
    <tr>
        <th>bno</th>
        <td>${board.bno}</td>
    </tr>
    <tr>
        <th>id</th>
        <td>${board.boardId}</td>
    </tr>
    <tr>
        <th>date</th>
        <td>${board.boardCreatedTime}</td>
    </tr>
    <tr>
        <th>hits</th>
        <td>${board.boardHits}</td>
    </tr>
    <tr>
        <th>title</th>
        <td>${board.boardTitle}</td>
    </tr>
    <tr>
        <th>contents</th>
        <td>${board.boardContents}</td>
    </tr>
</table>
<button onclick="listFn()">목록</button>
<button onclick="updateFn()">수정</button>
<button onclick="deleteFn()">삭제</button>
</body>
<script>
    const listFn = () => {
        <%--const page = '${page}';--%>
        <%--location.href = "/board/paging?page=" + page;--%>
        location.href = "/board/list"
    }
    const updateFn = () => {
        const bno = '${board.bno}';
        location.href = "/board/update?bno=" + bno;
    }
    const deleteFn = () => {
        const bno = '${board.bno}';
        location.href = "/board/delete?bno=" + bno;
    }
</script>
</html>