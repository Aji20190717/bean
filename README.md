# Bean

<b>1. 개발목표</b><br/>
  <p>어느 분야에서든 필수적인 요소로 여겨지는 영어를 자신의 수준에 맞춘 1:1 학습을 통해 보다 쉽게 익힐수 있도록 도와주는 어플리케이션 구현을 목표로 한다.</p>
<br/><br/>
<b>2. 개발환경</b>
  <li>구현 언어 : Java, HTML, Javascript, CSS, Oracle, Node.js, Express</li>
  <li>사용 기술 : 로그인 API, 글쓰기 API, 지도 API, 번역 API, 결제 API, 페이징,<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  파일 업로드, spring security, custom filter, aop, webRTC, 음성-문자 번역 API, OCR API,<br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  챗봇 API, 스케줄 관리(Spring Quartz), DataBase, Spring websocket</li>
  <li>사용 도구 : Spring framework, jQuery, Tomcat, 부트스트랩</li>
<br/><br/>
<b>3. 구현 기능</b>
  <li>SNS 회원가입 및 로그인 기능(카카오, 네이버)</li>
  <li>일반 회원가입 및 로그인 기능</li>
  <li>계정 보안 및 권한 별 접근 기능(Spring Security)</li>
  <li>회원정보 수정 기능</li>
  <li>회원 마이페이지</li>
  <li>캘린더 일정 관리 기능</li>
  <li>일반 게시판 기능</li>
  <li>번역 기능(번역 API)</li>
  <li>결제 기능(결제 API)</li>
  <li>실시간 채팅 기능(Spring websocket)</li>
  <li>1:1 화상채팅 기능(webRTC) :: 일부기능 추후 구현</li>
<br/><br/>
<b>4. DB설계</b>
  <li>회원 : 회원 번호(PK), 회원 ID, 회원 PW, PW 확인, 회원 이름, 회원 이메일, 회원 전화번호,<br/>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  회원 주소, 회원 생년월일, 회원 프로필 사진, 회원 타입, 탈퇴 여부, 가입시 사용한 sns 타입</li>
  <li>수업 : 수업 번호(PK), 회원 번호(FK), 수업 최대 인원, 현재 수강 인원, 시작 날짜, 종료 날짜, <br/>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  수업 이름, 수업 내용, 수강 회원 이름, 수업 삭제 여부</li>
  <li>문의 : 글 번호(PK), 문의 카테고리, 제목, 작성자, 내용, 작성일</li>
  <li>결제 : 결제 번호(PK), 회원 번호(FK), 수업 번호(FK), 결제 방법, 결제 금액, 결제 상태,<br/>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  결제일, IMFORT 고유 번호, 횐불 여부</li>
  <li>질문/작문 : 글 번호(PK), 회원 번호(FK), 작성자, 제목, 내용, 작성일, 읽힌 수, 그룹 안 순서, 그룹 번호, 댓글,<br/>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  댓글의 삭제 여부, 파일 이름, 파일 경로, OCR</li>
  <li>리뷰 : 글 번호(PK), 회원 번호(FK), 작성자, 제목, 내용, 작성일, 읽힌 수, 삭제 여부, 수업 이름, 강사 이름, 별점</li>
<br/><br/>
<b>5. 시연영상/포트폴리오 및 사이트 링크</b>
  <li> 시연영상 : https://www.youtube.com/watch?v=Hmf9r7ADKWI </li>
  <li> 포트폴리오 : https://github.com/Aji20190717/bean/blob/main/%ED%8C%8C%EC%9B%8C%EB%A0%88%EC%9D%B8%EC%A1%B0_%ED%8C%8C%EC%9D%B4%EB%84%90%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8.pdf </li>
  <li> 배포 url :  http://qclass.iptime.org:8686/Bean/</li>
  
  
