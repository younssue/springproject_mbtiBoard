# MBTIBOARD - mbti커뮤니티



-----


## 💻프로젝트 소개 
##### 같은 Mbti끼리 놀 수 있는 공간을 제공하여 , 서로 비슷한 점들을 공유하면서 서로에게 위안과 즐거움을 주는 소통 커뮤니티입니다 



-----

## ⏰개발기간
##### 개발기간:  23.05.31-07.20 (7주)

## ⚙️개발환경
##### - IntelliJ IDEA Community Edition
##### - amazon corretto open jdk 11
##### - mysql 8
##### - mybatis
##### - JSP
##### - Tomcat 9
##### - HTML5, CSS3 ,JS jquery


## ✅주요기능

##### 주요기능
member
1. 회원가입 
2. 로그인
3. 마이페이지 내에서 회원 정보 수정, 회원삭제
4. 로그아웃 

board
1. 글작성
2. 글목록( 전체글/mbti별 카데고리 글/ 마이페이지 내 글 목록)
3. 글 수정
- 로그인 loginId 와 작성자 boardId 가 같은 경우 수정 가능
4. 글 삭제
5. 페이징 처리
 1)전체글 페이징 (/?page=1&option=&search=)
 2)카데고리 페이징(/board/mbtilist?boardMbti=ISTJ&mbtiPage=1&option=&search=)
 3)마이페이지 내 글 리스트 페이징(/member/myList?myListPage=1&option=&keyword=&boardId=yy)
 
 - 한 페이지에 글 3개씩 -> Pagination 3개 

 

