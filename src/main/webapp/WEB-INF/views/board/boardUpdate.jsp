<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>save</title>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: Arial, sans-serif;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: #f5f5f5;
        }

        form {
            max-width: 400px;
            margin: 20px auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #fff;
        }

        label {
            font-weight: bold;
            margin-bottom: 5px;
        }

        input[type="text"],
        select,
        textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }

        textarea {
            resize: vertical;
        }

        input[type="submit"] {
            background-color: #333;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #555;
        }
    </style>

</head>
<body>
<form action="/board/update" method="post" name="updateForm">
    <label for="boardId">작성자</label>
    <input type="text" id="boardId" name="boardId" value="${board.boardId}" placeholder="작성자">

    <label for="boardMbti">MBTI 게시판 선택</label>
    <select id="boardMbti" name="boardMbti">
        <optgroup label="MBTI 선택">
            <option value="${board.boardMbti}" selected>${board.boardMbti}</option>
            <option value="ISTJ">ISTJ</option>
            <option value="ISTP">ISTP</option>
            <option value="INFJ">INFJ</option>
            <option value="INTJ">INTJ</option>
            <option value="ISFJ">ISFJ</option>
            <option value="ISFP">ISFP</option>
            <option value="INFP">INFP</option>
            <option value="INTP">INTP</option>
            <option value="ESTJ">ESTJ</option>
            <option value="ESFP">ESFP</option>
            <option value="ENFP">ENFP</option>
            <option value="ENTP">ENTP</option>
            <option value="ESTP">ESTP</option>
            <option value="ESFJ">ESFJ</option>
            <option value="ENFJ">ENFJ</option>
            <option value="ENTJ">ENTJ</option>
        </optgroup>
    </select>

    <label for="boardTitle">제목</label>
    <input type="text" id="boardTitle" name="boardTitle" value="${board.boardTitle}" placeholder="제목">

    <label for="boardContents">내용</label>
    <textarea id="boardContents" name="boardContents" cols="30" rows="10" placeholder="내용을 입력하세요">${board.boardContents}</textarea>

    <input type="hidden" name="boardHits" value="${board.boardHits}">
    <input type="hidden" name="boardCreatedTime" value="${board.boardCreatedTime}">
    <input type="hidden" name="bno" value="${board.bno}">

    <input type="submit" value="수정" onclick="confirmUpdate()">
</form>

</body>
<script>
    function confirmUpdate() {
        const confirmed = confirm("수정하시겠습니까?");
        if (confirmed) {
            document.updateForm.submit(); // 수정을 진행할 수 있도록 폼을 제출합니다.
        }
    }
</script>
</html>
