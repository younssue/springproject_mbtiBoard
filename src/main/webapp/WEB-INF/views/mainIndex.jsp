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
<%--      <a href="#" class="gnbBtn">--%>
<%--        <span class="a">ㅡ</span>--%>
<%--        <span class="b">ㅡ</span>--%>
<%--      </a>--%>

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
            <h2 class="title">전체 게시글</h2>
            <ul class="list">
            <c:forEach items="${boardList}" var="board">
              <li>
                <div class="mbtiList">
                  <div class="board-detail">
                      ${board.boardId} | ${board.boardCreatedTime} | hits: ${board.boardHits} |  번호:${board.bno} | ${board.boardMbti}
                  </div>
                  <div class="boardTitle">
                    <a href="/board?bno=${board.bno}&page=${paging.page}&keyword=${paging.keyword}&option=${paging.option}&condition=${condition}">${board.boardTitle} [${board.comment_cnt}]</a>

                  </div>
                </div>
              </li>
            </c:forEach>
            </ul>


            <div class="pagination">
              <c:choose>
                <c:when test="${paging.page <= 1}">
                  <span onclick="alert('이전 페이지가 없습니다')"> &lt; </span>
                </c:when>
                <c:otherwise>
                  <a href="/?page=${paging.page - 1}&option=${paging.option}&search=${paging.keyword}"> &lt; </a>
                </c:otherwise>
              </c:choose>

              <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
                <c:choose>
                  <c:when test="${i eq paging.page}">
                    <span class="selected" style="color: #D40052" >${i}</span>
                  </c:when>
                  <c:otherwise>
                    <a href="/?page=${i}&option=${paging.option}&search=${paging.keyword}">${i}</a>
                  </c:otherwise>
                </c:choose>
              </c:forEach>

              <c:choose>
                <c:when test="${paging.page >= paging.maxPage}">
                  <span onclick="alert('다음 페이지가 없습니다')"> &gt; </span>
                </c:when>
                <c:otherwise>
                  <a href="/?page=${paging.page + 1}&option=${paging.option}&search=${paging.keyword}"> &gt; </a>
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
<%--footer--%>
  <footer>
    <div class="inner">
      <h1 class="footerLogo">MBTIBOARD</h1>
      <ul class="contact">
        <li>
          서울특별시 서대문구
        </li>
        <li>
          010-1111-2222
        </li>
      </ul>
    </div>
  </footer>
</body>
<script>
    const save = () => {
        location.href = "/board/save";
    }
</script>
</html>
