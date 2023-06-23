<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>--%>

<html>
<head>
    <title>Title</title>
<%--    <link rel="stylesheet" href="resources/css/header.css">--%>
<%--    <link rel="stylesheet" href="resources/css/aside.css">--%>
    <style>
       * {
            margin: 0px;
            box-sizing: border-box;
        }

        body {
            height: 95vh;
            background: white;
            font-family: sans-serif;
            /* text-align: center; */
            color: white;

            /*font-size: 24px;*/
            display: flex;
            flex-direction: column;

        }


       /*헤더*/
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



        .main_body{
           display: flex;
           flex: 1;
        }



        /* 사이드바 */
       .left {
           color: black;
       /*margin: 20px 20px 20px 30px;
       */

           background: rgba(173, 244, 247, 0.48);
           padding: 50px 50px 10px 50px;
           /*flex: 1 1 100px; */
           display: flex;
           flex-direction: column;
           align-items: flex-start;
       }

       .left ul {
           font-size:20px;
           list-style: none;
           padding: 0;
           margin: 0;
       }

       .left ul li {
           margin-bottom: 10px;
       }

       .mbti-menu-title {
           color: black;
           font-size: 20px;
           margin-bottom: 5px;
       }

       .mbti-menu-content {
           color: black;
           font-size: 14px;
           display: grid;
           grid-template-columns: repeat(2, 1fr);
           grid-gap: 5px;
       }

       .left a {
           color: black;
       }

       .mbti-menu-content a {
           color: black;
       }





        main {

            color: black;
            background: white;
            padding: 5em 5em 5em 5em;
            display: flex;
            flex-direction: column;
            align-items: normal;
            flex: 1;
            justify-content: center;
        }

        main .board-item {
            margin-bottom: 1em;
            padding: 1em;
            background-color: rgb(220, 220, 220);
        }

        main .board-title a {
            color: black;
            text-decoration: none;
        }

        main .board-details {
            font-size: 14px;
            color: black;
        }

       .btn-write {
           display: inline-block;
           padding: 10px 20px;
           background-color: #4CAF50;
           color: white;
           text-align: center;
           font-size: 16px;
           border: none;
           border-radius: 4px;
           cursor: pointer;
           transition: background-color 0.3s ease;
       }

       /* 페이지 */
       .pagination {
           display: flex;
           justify-content: center;
           margin-top: 1em;
       }

       .pagination span,
       .pagination a {
           font-size: 14px;
           padding: 0.25em 0.5em;
           margin: 0 0.25em;
           text-decoration: none;
           color: #333;
           transition: color 0.3s ease;
       }

       .pagination a:hover {
           background-color: #ccc;
       }

       .pagination span:first-child,
       .pagination a:first-child {
           margin-left: 0;
       }

       .pagination span:last-child,
       .pagination a:last-child {
           margin-right: 0;
       }

       .pagination .selected {
           color: #FF0266;
           font-weight: bold;
       }




       /* footer */

        footer {
            color: #333333;
            background: white;
            padding: 1em 0 1em 0;
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
<%--<%@ include file="../layout/header.jsp" %>--%>
<div class="main_body">
<%--<%@ include file="../layout/aside.jsp" %>--%>
    <aside class="left">
        <div>
            <ul>
                <li><a href="/board/list">전체글보기</a></li>
                <li class="mbti-menu">
                    <a class="mbti-menu-title">MBTI별 글 보기</a>
                    <div class="mbti-menu-content">
                        <a href="#">ISTJ</a>
                        <a href="#">ISTP</a>
                        <a href="#">ISFJ</a>
                        <a href="#">ISFP</a>
                        <a href="#">INFJ</a>
                        <a href="#">INFP</a>
                        <a href="#">INTJ</a>
                        <a href="#">INTP</a>
                        <a href="#">ESTJ</a>
                        <a href="#">ESTP</a>
                        <a href="#">ESFJ</a>
                        <a href="#">ESFP</a>
                        <a href="#">ENFJ</a>
                        <a href="#">ENFP</a>
                        <a href="#">ENTJ</a>
                        <a href="#">ENTP</a>
                    </div>
                </li>
            </ul>
        </div>
    </aside>
    <main>
        <h2>전체 게시글</h2>
        <c:if test="${sessionScope.loginId != null}">
            <button onclick="save()" type="button" class="btn-write">글 작성</button> <!-- 버튼 스타일을 적용한 클래스로 변경 -->
        </c:if>
        <c:forEach items="${mbtiBoardList}" var="board">
            <div class="board-item">
                <div class="board-title">
                    <a href="/board?bno=${board.bno}&page=${mbtiPaging.page}">${board.boardTitle}</a>
                </div>
                <div class="board-details">
                    게시글 번호: ${board.bno} | 게시글 번호: ${board.boardMbti} | 작성자: ${board.boardId} | 조회수:
                        ${board.boardHits} | 작성일: ${board.boardCreatedTime}
                </div>
            </div>
        </c:forEach>

        <div class="pagination">
            <c:choose>
                <c:when test="${mbtiPaging.page < 1}">
                    <span class="selected"> < </span>
                </c:when>
                <c:otherwise>
                    <a href="/board/list?page=${mbtiPaging.page - 1}"> < </a>
                </c:otherwise>
            </c:choose>

            <c:forEach begin="${mbtiPaging.mbtiPageStart}" end="${mbtiPaging.mbtiEndPage}" var="i" step="1">
                <c:choose>
                    <c:when test="${i eq mbtiPaging.page}">
                        <span class="selected">${i}</span>
                    </c:when>
                    <c:otherwise>
                        <a href="/board/list?page=${i}">${i}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>

            <c:choose>
                <c:when test="${mbtiPaging.page > mbtiPaging.mbtiMaxPage}">
                    <span class="selected"> > </span>
                </c:when>
                <c:otherwise>
                    <a href="/board/list?page=${mbtiPaging.page + 1}"> > </a>
                </c:otherwise>
            </c:choose>
        </div>

    </main>


</div>
<footer>
    footer
</footer>
</body>
<script>
    const save = () => {
        location.href = "/board/save";
    }
</script>
</html>