<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
</head>
<body>
<h2>commentTest</h2>
comment:<input type="text" name="comment"><br>
<button id="sendBtn" type="button">댓글작성</button>
<button id="modBtn" type="button">댓글수정</button>
<h2>Data From Server :</h2>
<div id="commentList"></div>
<div id = "replyForm" style="display: none">
  <input type="text" name="replyComment">
  <button id="wrtRepBtn" type="button">등록</button>
</div>
<script>
  let bno =20;

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


  //답글달기
  $("#wrtRepBtn").click(function () {
    let comment = $("input[name=replyComment]").val();
    let pcno = $("#replyForm").parent().attr("data-pcno");

    //comment가 공백이면 alert
    if (comment.trim() == '') {
      alert("댓글을 입력해주세요");
      $("input[name=replyComment]").focus()
      return;
    }

    $.ajax({
      type: 'POST',       // 요청 메서드
      url: '/comment?bno=' + bno,  // 요청 URI //url수정이 필요할듯
      headers: {"content-type": "application/json"}, // 요청 헤더
      //dataType : 'text', // 전송받을 데이터의 타입 - 생략하면 json으로 기본설정
      data: JSON.stringify({pcno: pcno,bno: bno, commentContents: comment}),  // 서버로 전송할 데이터. stringify()로 직렬화 필요, DB와 같은 name사용할 것(DB:내가 string값으로 준 변수)
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
    $("#replyForm").css("display","none")
    $("input[name=replyComment]").val('')
    $("#replyForm").appendTo("body");
  });




//화면 출력 부분
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



    //답글 달기
  $("#commentList").on("click", ".replyBtn", function () {
    //1.replyForm을 옮기고
    //this->1i태그 안에
    $("#replyForm").appendTo($(this).parent());

    //2. 답글을 입력할 폼을 보여주기
    //block이 none이된 입력폼을 보여줌
    $("#replyForm").css("display","block");

  });
    //댓글 리스트 모양 (삭제, 수정버튼)
    let toHTML = function (comment) {
      let tmp = "<ul>";
      comment.forEach(function (comment) {
        tmp += '<li data-cno=' + comment.cno
        tmp += ' data-pcno=' + comment.pcno
        tmp += ' data-bno=' + comment.bno + '>'
      if(comment.cno != comment.pcno)
        tmp += 'ㄴ'
        tmp += 'memberId = <span class ="memberId">' + comment.memberId + '</span>'
        tmp += 'commentContents= <span class="commentContents">' + comment.commentContents + '</span>'
        tmp += ' up- date = ' + comment.commentCreatedTime
        tmp += '<button class = "delBtn"> 삭제 </button> '
        tmp += '<button class = "modBtn"> 수정 </button> '
        tmp += '<button class = "replyBtn"> 답글 </button> '
        tmp += '</li>'

      })
      return tmp + "</ul>";

    }

</script>
</body>
</html>