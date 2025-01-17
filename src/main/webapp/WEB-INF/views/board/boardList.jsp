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
           background-color: plum;
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
                        <a href="/board/mbtilist?boardMbti=ISTJ">ISTJ</a>
                        <a href="/board/mbtilist?boardMbti=ISTP">ISTP</a>
                        <a href="/board/mbtilist?boardMbti=ISFJ">ISFJ</a>
                        <a href="/board/mbtilist?boardMbti=ISFP">ISFP</a>
                        <a href="/board/mbtilist?boardMbti=INFJ">INFJ</a>
                        <a href="/board/mbtilist?boardMbti=INFP">INFP</a>
                        <a href="/board/mbtilist?boardMbti=INTJ">INTJ</a>
                        <a href="/board/mbtilist?boardMbti=INTP">INTP</a>
                        <a href="/board/mbtilist?boardMbti=ESTJ">ESTJ</a>
                        <a href="/board/mbtilist?boardMbti=ESTP">ESTP</a>
                        <a href="/board/mbtilist?boardMbti=ESFJ">ESFJ</a>
                        <a href="/board/mbtilist?boardMbti=ESFP">ESFP</a>
                        <a href="/board/mbtilist?boardMbti=ENFJ">ENFJ</a>
                        <a href="/board/mbtilist?boardMbti=ENFP">ENFP</a>
                        <a href="/board/mbtilist?boardMbti=ENTJ">ENTJ</a>
                        <a href="/board/mbtilist?boardMbti=ENTP">ENTP</a>
                    </div>
                </li>
            </ul>
        </div>
    </aside>
    <main>

        <h2>전체 게시글</h2>
        <div class="search_wrap">
            <form class="search">
                <select class="search-option" name="option">
                    <option value="A" <c:out value="${paging.option eq 'A'? 'selected' :''}"/> >제목+내용</option>
                    <option value="T" <c:out value="${paging.option eq 'T'? 'selected' : ''}"/> >제목</option>
                    <option value="W" <c:out value="${paging.option eq 'W'? 'selected' : ''}"/> >작성자</option>
                </select>
                <input type="text" name="keyword" value="${paging.keyword}">
                <button class="searchButton" type="submit">검색</button>
            </form>
        </div>
        <c:choose>
            <c:when test="${sessionScope.loginId != null}">
                <button onclick="save()" type="button" class="btn-write">글 작성</button> <!-- 버튼 스타일을 적용한 클래스로 변경 -->
            </c:when>
        </c:choose>
        <%--<c:choose>
            <c:when test="${paging == null}">
               <tr height="10">
                    <td colspan="4">
                        <b><span style="font-size:9pt;">등록된 글이 없습니다.</span></b>
                    </td>
                </tr>
            </c:when>
            <c:when test="${paging != null}">
                <c:forEach items="${boardList}" var="board">
                    <div class="board-item">
                        <div class="board-title">
                            <a href="/board?bno=${board.bno}&page=${paging.page}&keyword=${paging.keyword}&option=${paging.option}">${board.boardTitle}</a>
                        </div>
                        <div class="board-details">
                            게시글 번호: ${board.bno} | 게시글 번호: ${board.boardMbti} | 작성자: ${board.boardId} | 조회수:
                                ${board.boardHits} | 작성일: ${board.boardCreatedTime}
                        </div>
                    </div>
                </c:forEach>
            </c:when>
        </c:choose>--%>


                <c:forEach items="${boardList}" var="board">
                    <div class="board-item">
                        <div class="board-title">
                            <a href="/board?bno=${board.bno}&page=${paging.page}&keyword=${paging.keyword}&option=${paging.option}">${board.boardTitle}</a>
                        </div>
                        <div class="board-details">
                            게시글 번호: ${board.bno} | 게시글 번호: ${board.boardMbti} | 작성자: ${board.boardId} | 조회수:
                                ${board.boardHits} | 작성일: ${board.boardCreatedTime}
                        </div>
                    </div>
                </c:forEach>



            <div class="pagination">
                <c:choose>
                    <c:when test="${paging.page <= 1}">
                        <span onclick="alert('이전 페이지가 없습니다')"> &lt; </span>
                    </c:when>
                    <c:otherwise>
                        <a href="/board/list?page=${paging.page - 1}&option=${paging.option}&search=${paging.keyword}"> &lt; </a>
                    </c:otherwise>
                </c:choose>

                <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
                    <c:choose>
                        <c:when test="${i eq paging.page}">
                            <span class="selected">${i}</span>
                        </c:when>
                        <c:otherwise>
                            <a href="/board/list?page=${i}&option=${paging.option}&search=${paging.keyword}">${i}</a>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>

                <c:choose>
                    <c:when test="${paging.page >= paging.maxPage}">
                        <span onclick="alert('다음 페이지가 없습니다')"> &gt; </span>
                    </c:when>
                    <c:otherwise>
                        <a href="/board/list?page=${paging.page + 1}&option=${paging.option}&search=${paging.keyword}"> > </a>
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