<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>save</title>
</head>
<body>
<form action="/board/save" method="post">
    <input type="text" name="boardId" placeholder="작성자">
    <label for="">MBTI 게시판 선택</label>
    <select name="boardMbti">
        <optgroup label="MBTI 선택">
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
    <input type="text" name="boardTitle" placeholder="제목">
    <textarea name="boardContents" cols="30" rows="10" placeholder="내용을 입력하세요"></textarea>
    <input type="submit" value="작성">
</form>
</body>
</html>