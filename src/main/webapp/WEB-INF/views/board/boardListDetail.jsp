<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>board</title>
    <style>
        * {
            margin: 0px;
            box-sizing: border-box;
        }

        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: #333;

            padding: 30px 20px;
            font-family: 'Noto Sans KR', sans-serif;
        }

        header h1 {
            margin: 0;
            font-size: larger;
        }
        header h1 a{
            color: white;
        }

        header nav {

            display: flex;
            align-items: center;
        }

        header nav ul {
            color: #fff;
            list-style: none;
            margin: 0;
            padding: 0;
            display: flex;
        }

        header nav ul li {
            margin-right: 10px;
        }

        header nav ul li a {
            color: #fff;
            text-decoration: none;
        }

        header nav ul li a:hover {
            color: #FF0266;
        }
        body {
            height: 95vh;
            background: white;
            font-family: sans-serif;
             text-align: center;
            color: black;

            /*font-size: 24px;*/
            display: flex;
            flex-direction: column;
        }

        .boardDetail{
            margin: 100px 0 50px 0;
        }

        .board_title {
            font-weight: 700;
            font-size: 22pt;
            margin: 10pt;
        }
        .board_info_box {
            color: #6B6B6B;
            margin: 10pt;
        }
        .board_author {
            font-size: 10pt;
            margin-right: 10pt;
        }
        .board_date {
            font-size: 10pt;
        }
        .board_bno{
            font-size: 10pt;
        }
        .board_mbti{
            font-size: 10pt;
        }
        .board_Hits{
            font-size: 10pt;
        }
        .board_content {
            color: #444343;
            font-size: 17pt;
            margin: 10pt;
        }

        .buttons {
            //text-align: center;
            margin-top: 20px;
        }

        .buttons button {
           // margin: 5px;
            padding: 7px 7px;
            font-size: 10px;
            background-color: #89dfff;
            color: #fff;
            border: none;
            cursor: pointer;
        }

        .buttons button:hover {
            background-color: #45a049;
        }
    </style>
</head>

<body>
<header>
    <h1><a href="/">MbtiBoard</a></h1>
    <nav>
        <!-- 네비게이션 메뉴 등의 내용 -->
        <div id="menu">
            <ul>
                <li><a href="/board/list">Board</a></li>
                <li><a href="/member/login">Login</a></li>
                <li><a href="/member/save">Sign in</a></li>
                <li><a href="/member/list">MemberList</a></li>
            </ul>
        </div>
    </nav>
</header>

<main>
<article class="boardDetail">
    <div class="container" role="main">
        <h2> 상세 글 </h2>
        <div class="bg-white rounded shadow-sm">
            <div class="board_title"> ${board.boardTitle}</div>
            <div class="board_info_box">
                <span class="board_bno"> 번호: ${board.bno}</span>
                <span class="board_author"> id: ${board.boardId}</span>
                <span class="board_date"> date: ${board.boardCreatedTime}</span>
                <span class="board_Hits"> 조회수: ${board.boardHits}</span>
                <span class="board_mbti"> mbti: ${board.boardMbti}</span>
            </div>
            <div class="board_content"> ${board.boardContents} </div>

        </div>

    </div>
</article>

<div class="buttons">
    <button onclick="listFn()">목록</button>

<c:if test="${editable}">
    <button onclick="updateFn()">수정</button>
    <button onclick="deleteFn()">삭제</button>
</c:if>
</div>
</main>
<script>
/*    const listFn = () => {
        const page = ${page};
        location.href = "/board/list?page=" + page;
    }*/

    const condition = ${condition};
    const listFn= () => {


        if(condition == false){
            const page = ${page};
            location.href = "/board/list?page=" + page;
        }
        else {
            const mbtiPage = ${mbtiPage};
            location.href ="/board/mbtilist?boardMbti=${boardMbti}&mbtiPage="+mbtiPage;
        }
    }
/*
    const listFn= () => {
    const page = ${page};
        console.log(page);
    const mbtiPage = ${mbtiPage};
        console.log(mbtiPage);

    if(page){

        location.href = "/board/list?page=" + page;
    }
    else if(mbtiPage){

        location.href ="/board/mbtilist?boardMbti=${boardMbti}&mbtiPage="+mbtiPage;
    }
    }
*/

    const updateFn = () => {
        const bno = '${board.bno}';
        location.href = "/board/update?bno=" + bno;
    }

    const deleteFn = () => {
        const bno = '${board.bno}';
        const confirmed = confirm("삭제하시겠습니까?");
        if (confirmed) {
            location.href = "/board/delete?bno=" + bno;
        }
    }
</script>
</body>

</html>

