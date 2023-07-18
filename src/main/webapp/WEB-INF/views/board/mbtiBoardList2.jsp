<%--
  Created by IntelliJ IDEA.
  User: candy
  Date: 2023-07-16
  Time: 오후 5:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <link rel="stylesheet" href="/resources/css/mainIndex.css">
  <!-- script -->
  <script src="/resources/js/jquery-3.3.1.min.js"></script>
  <script src="/resources/js/script_mbti.js"></script>
  <script src="/resources/js/jquery.scrolla.min.js"></script>
  <title>mbtiBoard</title>
</head>
<body>
<div class="wrap">
  <!-- header -->
  <header>
    <div class="inner">
      <a href="#" class="gnbBtn">
        <span class="a">ㅡ</span>
        <span class="b">ㅡ</span>
      </a>
      <a href="/" class="logo">MBTI Board</a>
      <a href="#" class="login">login</a>
    </div>
  </header>
  <!-- contents -->
  <div class="contents">
    <section class="visual">
      <!-- autoplay: 비디오 자동실행 muted:비디오 실행시 음향도 실행
          loop: 비디오가 끝나면 자동으로 다시 재생
          playsinline : play버튼 클릭 시 전체 모드 되는 것을 막기 위함-->
      <video  class="mbtiboard" autoplay muted loop playsinline>
        <source src="/resources/img/mbti-video.mp4" type="video/mp4">
      </video>
      <!-- <h2 class="title">MBTI BOARD</h2> -->
    </section>
    <section class="approach">
      <div class="inner">
        <ul class="list">
          <li><a href="/board/mbtilist?boardMbti=ENFJ"><img src="/resources/img/ENFJ.png" alt=""></a></li>
          <li><a href="/board/mbtilist?boardMbti=ENTJ"><img src="/resources/img/ENTJ.png" alt=""></a></li>
          <li><a href="/board/mbtilist?boardMbti=ENFP"><img src="/resources/img/ENFP.png" alt=""></a></li>
          <li><a href="/board/mbtilist?boardMbti=ENTP"><img src="/resources/img/ENTP.png" alt=""></a></li>
          <li><a href="/board/mbtilist?boardMbti=ESFJ"><img src="/resources/img/ESFJ.png" alt=""></a></li>
          <li><a href="/board/mbtilist?boardMbti=ESFP"><img src="/resources/img/ESFP.png" alt=""></a></li>
          <li><a href="/board/mbtilist?boardMbti=ESTJ"><img src="/resources/img/ESTJ.png" alt=""></a></li>
          <li><a href="/board/mbtilist?boardMbti=ESTP"><img src="/resources/img/ESTP.png" alt=""></a></li>
          <li><a href="/board/mbtilist?boardMbti=INFJ"><img src="/resources/img/INFJ.png" alt=""></a></li>
          <li><a href="/board/mbtilist?boardMbti=INFP"><img src="/resources/img/INFP.png" alt=""></a></li>
          <li><a href="/board/mbtilist?boardMbti=INTJ"><img src="/resources/img/INTJ.png" alt=""></a></li>
          <li><a href="/board/mbtilist?boardMbti=INTP"><img src="/resources/img/INTP.png" alt=""></a></li>
          <li><a href="/board/mbtilist?boardMbti=ISFJ"><img src="/resources/img/ISFJ.png" alt=""></a></li>
          <li><a href="/board/mbtilist?boardMbti=ISFP"><img src="/resources/img/ISFP.png" alt=""></a></li>
          <li><a href="/board/mbtilist?boardMbti=ISTJ"><img src="/resources/img/ISTJ.png" alt=""></a></li>
          <li><a href="/board/mbtilist?boardMbti=ISTP"><img src="/resources/img/ISTP.png" alt=""></a></li>
        </ul>

        <div class="fix">
          <div class="text">
            <h2 class="title">${mbtiPaging.boardMbti}</h2>

            <div class="search_wrap">
              <form class="search">
                <select class="search-option" name="option">
                  <option value="A" <c:out value="${mbtiPaging.option eq 'A'? 'selected' :''}"/> >제목+내용</option>
                  <option value="T" <c:out value="${mbtiPaging.option eq 'T'? 'selected' : ''}"/> >제목</option>
                  <option value="W" <c:out value="${mbtiPaging.option eq 'W'? 'selected' : ''}"/> >작성자</option>
                </select>
                <input type="text" name="keyword" value="${mbtiPaging.keyword}">
                <input type="hidden" name="boardMbti" value="${mbtiPaging.boardMbti}">
                <button class="searchButton" type="submit">검색</button>
              </form>
            </div>

            <ul class="list">
            <c:forEach items="${mbtiBoardList}" var="board">
              <li>
                <div class="mbtiList">
                  <div class="board-detail">
                      ${board.boardId} | ${board.boardCreatedTime} | hits: ${board.boardHits} |  번호:${board.bno} |${board.boardMbti}
                  </div>
                  <div class="boardTitle">
                    <a href="/board?boardMbti=${mbtiPaging.boardMbti}&bno=${board.bno}&mbtiPage=${mbtiPaging.mbtiPage}&keyword=${mbtiPaging.keyword}&option=${mbtiPaging.option}&condition=${condition}"> ${board.boardTitle} </a>
                  </div>
                </div>
              </li>
            </c:forEach>
            </ul>


            <div class="pagination">
              <c:choose>
                <c:when test="${mbtiPaging.mbtiPage <= 1}">
                  <span onclick="alert('이전 페이지가 없습니다')"> &lt; </span>
                </c:when>
                <c:otherwise>
                  <a href="/board/mbtilist?boardMbti=${mbtiPaging.boardMbti}&mbtiPage=${mbtiPaging.mbtiPage - 1}&option=${mbtiPaging.option}&search=${mbtiPaging.keyword}"> &lt; </a>
                </c:otherwise>
              </c:choose>

              <c:forEach begin="${mbtiPaging.mbtiStartPage}" end="${mbtiPaging.mbtiEndPage}" var="i" step="1">
                <c:choose>
                  <c:when test="${i eq mbtiPaging.mbtiPage}">
                    <span class="selected">${i}</span>
                  </c:when>
                  <c:otherwise>
                    <a href="/board/mbtilist?boardMbti=${mbtiPaging.boardMbti}&mbtiPage=${i}&option=${mbtiPaging.option}&search=${mbtiPaging.keyword}">${i}</a>
                  </c:otherwise>
                </c:choose>
              </c:forEach>

              <c:choose>
                <c:when test="${mbtiPaging.mbtiPage >= mbtiPaging.mbtiMaxPage}">
                  <span onclick="alert('다음 페이지가 없습니다')"> &gt; </span>
                </c:when>
                <c:otherwise>
                  <a href="/board/mbtilist?boardMbti=${mbtiPaging.boardMbti}&mbtiPage=${mbtiPaging.mbtiPage + 1}&option=${mbtiPaging.option}&search=${mbtiPaging.keyword}"> &gt; </a>
                </c:otherwise>
              </c:choose>
            </div>
          <c:choose>
            <c:when test="${sessionScope.loginId != null}">
            <a class="write" onclick="save()"  >글작성</a>
            </c:when>
          </c:choose>
          </div>
        </div>

      </div>
    </section>
  </div>
</body>
<script>
  const save = () => {
    location.href = "/board/save";
  }
</script>
</html>
