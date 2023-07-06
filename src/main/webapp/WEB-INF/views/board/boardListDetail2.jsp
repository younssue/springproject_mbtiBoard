<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <!-- jquery cdn -->
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
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

        #commentList {
            width : 50%;
            margin : auto;
        }

        .comment-content {
            overflow-wrap: break-word;
        }

        .comment-bottom {
            font-size:9pt;
            color : rgb(97,97,97);
            padding: 8px 0 8px 0;
        }

        .comment-bottom > a {
            color : rgb(97,97,97);
            text-decoration: none;
            margin : 0 6px 0 0;
        }

        .comment-area {
            padding : 0 0 0 46px;
        }

        .commenter {
            font-size:12pt;
            font-weight:bold;
        }

        .commenter-writebox {
            padding : 15px 20px 20px 20px;
        }

        .comment-img {
            font-size:36px;
            position: absolute;
        }

        .comment-item {
            position:relative;
        }

        .up_date {
            margin : 0 8px 0 0;
        }

        #comment-writebox {
            background-color: white;
            border : 1px solid #e5e5e5;
            border-radius: 5px;
        }

        textarea {
            display: block;
            width: 100%;
            min-height: 17px;
            padding: 0 20px;
            border: 0;
            outline: 0;
            font-size: 13px;
            resize: none;
            box-sizing: border-box;
            background: transparent;
            overflow-wrap: break-word;
            overflow-x: hidden;
            overflow-y: auto;
        }

        #comment-writebox-bottom {
            padding : 3px 10px 10px 10px;
            min-height : 35px;
        }

        .btn {
            font-size:10pt;
            color : black;
            background-color: #eff0f2;
            text-decoration: none;
            padding : 9px 10px 9px 10px;
            border-radius: 5px;
            float : right;
        }

        #btn-write-comment, #btn-write-reply {
            color : #009f47;
            background-color: #e0f8eb;
        }

        #btn-cancel-reply {
            background-color: #eff0f2;
            margin-right : 10px;
        }

        #btn-write-modify {
            color : #009f47;
            background-color: #e0f8eb;
        }

        #btn-cancel-modify {
            margin-right : 10px;
        }

        #reply-writebox {
            display : none;
            background-color: white;
            border : 1px solid #e5e5e5;
            border-radius: 5px;
            margin : 10px;
        }

        #reply-writebox-bottom {
            padding : 3px 10px 10px 10px;
            min-height : 35px;
        }

        #modify-writebox {
            background-color: white;
            border : 1px solid #e5e5e5;
            border-radius: 5px;
            margin : 10px;
        }

        #modify-writebox-bottom {
            padding : 3px 10px 10px 10px;
            min-height : 35px;
        }

        /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            padding-top: 100px; /* Location of the box */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }

        /* Modal Content */
        .modal-content {
            background-color: #fefefe;
            margin: auto;
            padding: 20px;
            border: 1px solid #888;
            width: 50%;
        }

        /* The Close Button */
        .close {
            color: #aaaaaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: #000;
            text-decoration: none;
            cursor: pointer;
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
    comment:<input type="text" name="comment"><br>
    <button id="sendBtn" type="button">댓글작성</button>
    <button id="modBtn" type="button">댓글수정</button>

    <div id="commentList"></div>

</div>
</main>
<script>


    //페에징
    const condition = ${condition};
    const listFn= () => {


        if(condition == false){
            const page = ${page};
            location.href = "/board/list?keyword=${keyword}&option=${option}&page=" + page;
        }
        else {
            const mbtiPage = ${mbtiPage};
            location.href ="/board/mbtilist?keyword=${keyword}&option=${option}&boardMbti=${boardMbti}&mbtiPage="+mbtiPage;
        }
    }

    //글 수정
    const updateFn =  () => {
        const bno = '${board.bno}';
        location.href = "/board/update?bno=" + bno;
    }

    //글 삭제
    const deleteFn = () => {
        const bno = '${board.bno}';
        const confirmed = confirm("삭제하시겠습니까?");
        if (confirmed) {
            location.href = "/board/delete?bno=" + bno;
        }
    }

    /*댓글*/
    let bno ='${board.bno}';

    let showList =function (bno){
        $.ajax({
            type:'GET',       // 요청 메서드
            url: '/comment?bno='+bno,  // 요청 URI //url수정이 필요할듯
            //headers : { "content-type": "application/json"}, // 요청 헤더
            //dataType : 'text', // 전송받을 데이터의 타입 - 생략하면 json으로 기본설정
            //data : JSON.stringify(person),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
            success : function(result){
                //person2 = JSON.parse(result);    // 서버로부터 응답이 도착하면 호출될 함수
                //alert("received="+result);       // result는 서버가 전송한 데이터
                $("#commentList").html(toHTML(result));
            },
            error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
        }); // $.ajax()

    }
    $(document).ready(function() {
        //페이지 나올때 부터 아예 다 보이게 하기 위해서
        //위에서 선언
        showList(bno);

        //글작성
        $("#sendBtn").click(function () {
            let comment = $("input[name=comment]").val();

            //comment가 공백이면 alert
            if (comment.trim() == '') {
                alert("댓글을 입력해주세요");
                $("input[name=comment]").focus()
                return;
            }

            $.ajax({
                type: 'POST',       // 요청 메서드
                url: '/comment?bno=' + bno,  // 요청 URI //url수정이 필요할듯
                headers: {"content-type": "application/json"}, // 요청 헤더
                //dataType : 'text', // 전송받을 데이터의 타입 - 생략하면 json으로 기본설정
                data: JSON.stringify({bno: bno, commentContents: comment}),  // 서버로 전송할 데이터. stringify()로 직렬화 필요, DB와 같은 name사용할 것(DB:내가 string값으로 준 변수)
                success: function (result) {
                    //person2 = JSON.parse(result);    // 서버로부터 응답이 도착하면 호출될 함수
                    //alert("received="+result);       // result는 서버가 전송한 데이터
                    alert(result);
                    showList(bno);
                },
                error: function () {
                    alert("error")
                } // 에러가 발생했을 때, 호출될 함수
            });

        });


        //댓글수정
        $("#modBtn").click(function () {
            let cno = $(this).attr("data-cno");

            let comment = $("input[name=comment]").val();

            //comment가 공백이면 alert
            if (comment.trim() == '') {
                alert("댓글을 입력해주세요");
                $("input[name=comment]").focus()
                return;
            }

            $.ajax({
                type: 'PATCH',       // 요청 메서드
                url: '/comment/' + cno,  // 요청 URI
                headers: {"content-type": "application/json"}, // 요청 헤더
                //dataType : 'text', // 전송받을 데이터의 타입 - 생략하면 json으로 기본설정
                data: JSON.stringify({cno: cno, commentContents: comment}),  // 서버로 전송할 데이터. stringify()로 직렬화 필요, DB와 같은 name사용할 것(DB:내가 string값으로 준 변수)
                success: function (result) {
                    //person2 = JSON.parse(result);    // 서버로부터 응답이 도착하면 호출될 함수
                    //alert("received="+result);       // result는 서버가 전송한 데이터
                    alert(result);
                    showList(bno);
                },
                error: function () {
                    alert("error")
                } // 에러가 발생했을 때, 호출될 함수
            });

        });

        /*    $(".delBtn").click(function(){
              alert("delBtn clicked")
            });

            ->사용할 경우 삭제 alert이 뜨지 않음
            왜냐면 send버튼을 누르고 바로 삭제 버튼이 실행이 되야하는데 send버튼이 눌러지고
            데이터를 가져온다음 삭제 버튼이기에 이 상황에서는 아래처럼
            바꿔줘야함
            */

        //댓글 삭제
        //동적으로 생성되는 이벤트 거는 방식
        $("#commentList").on("click", ".delBtn", function () {
            let cno = $(this).parent().attr("data-cno");
            let bno = $(this).parent().attr("data-bno");
            $.ajax({
                type: 'DELETE',       // 요청 메서드
                url: '/comment/' + cno + '?bno=' + bno,  // 요청 URI //url수정이 필요할듯
                //headers : { "content-type": "application/json"}, // 요청 헤더
                //dataType : 'text', // 전송받을 데이터의 타입 - 생략하면 json으로 기본설정
                //data : JSON.stringify(person),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
                success: function (result) {
                    //person2 = JSON.parse(result);    // 서버로부터 응답이 도착하면 호출될 함수
                    //alert("received="+result);       // result는 서버가 전송한 데이터
                    alert(result)
                    showList(bno);
                },
                error: function () {
                    alert("error")
                } // 에러가 발생했을 때, 호출될 함수
            });
        });

    });


    //댓글 수정
    $("#commentList").on("click", ".modBtn", function () {
        let cno = $(this).parent().attr("data-cno");
        //let bno = $(this).parent().attr("data-bno");
        let comment = $("span.commentContents", $(this).parent()).text();
        //계속 comment 값을 전체 댓글내용을 불러 왔던 이유 :parents()로 되어있었음..

        // span태그 안에 있는 commentContents 내용을 가져오기
        // cno해당 commentContents를 가져오기 위해선 span의 부모인li의 text를 가져온다

        //1.comment 의 내용을 input에 뿌려주기
        $("input[name=comment]").val(comment);
        //2.cno전달하기
        $("#modBtn").attr("data-cno", cno);

    });

    //댓글 리스트 모양 (삭제, 수정버튼)
    let toHTML = function (comment) {
        let tmp = "<ul>";
        comment.forEach(function (comment) {
            tmp += '<li data-cno=' + comment.cno
            tmp += ' data-pcno=' + comment.pcno
            tmp += ' data-bno=' + comment.bno + '>'
            tmp += 'commenter = <span class ="memberId">' + comment.memberId + '</span>'
            tmp += 'commentContents= <span class="commentContents">' + comment.commentContents + '</span>'
            tmp += ' up- date = ' + comment.commentCreatedTime
            tmp += '<button class = "delBtn"> 삭제 </button> '
            tmp += '<button class = "modBtn"> 수정 </button> '
            tmp += '</li>'

        })
        return tmp + "</ul>";

    }
</script>
</body>

</html>

