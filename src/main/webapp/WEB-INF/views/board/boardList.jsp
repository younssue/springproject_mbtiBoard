<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Board List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #ffffff;
        }

        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #dddddd;
        }

        th {
            background-color: #f9f9f9;
            font-weight: bold;
        }

        tr:hover {
            background-color: #f5f5f5;
        }

        a {
            color: #000000;
            text-decoration: none;
        }
    </style>
</head>
<body>
<table>
    <tr>
        <th>ID</th>
        <th>Title</th>
        <th>Mbti</th>
        <th>Date</th>
        <th>Hits</th>
    </tr>
    <c:forEach items="${boardList}" var="board">
        <tr>
            <td>${board.boardId}</td>
            <td>
                <a href="/board?id=${board.boardId}">${board.boardTitle}</a>
            </td>
            <td>${board.boardMbti}</td>
            <td>${board.boardCreatedTime}</td>
            <td>${board.boardHits}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
