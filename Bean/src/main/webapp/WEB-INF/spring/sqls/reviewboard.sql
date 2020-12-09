DROP SEQUENCE REVIEWBOARD_SEQ;
DROP TABLE REVIEWBOARD;

CREATE SEQUENCE REVIEWBOARD_SEQ;
CREATE TABLE REVIEWBOARD(
	REVIEWBOARD_NO NUMBER PRIMARY KEY,
	MEMBER_NO NUMBER NOT NULL,
	REVIEWBOARD_NAME VARCHAR2(20) NOT NULL,
	REVIEWBOARD_TITLE VARCHAR2(500) NOT NULL,
	REVIEWBOARD_CONTENT VARCHAR2(4000) NOT NULL,
	REVIEWBOARD_DATE DATE NOT NULL,
	REVIEWBOARD_READCOUNT NUMBER NOT NULL,
	REVIEWBOARD_GROUPNO NUMBER NOT NULL,
	REVIEWBOARD_STEP NUMBER NOT NULL,
	REVIEWBOARD_DELFLAG NUMBER NOT NULL,
	CLASS_NAME VARCHAR2(500) NOT NULL,
	REVIEWBOARD_TE VARCHAR2(20) NOT NULL,
	REVIEWBOARD_STAR VARCHAR2(10) NOT NULL,
	FOREIGN KEY(MEMBER_NO) REFERENCES MEMBER(MEMBER_NO)
);

/*
 
 
 
 
 
 
어쩌지...
클레스 NO에서 NO를 받아서 NAME으로 받아오나
포린키는 두개되는데 기억이 가지고오려고하는 테이블의 프라이머리키만 포린으로 가져올수있어요...
NO로 연결 해놨으니까 다른것도 가져올수있고?했요
이 두개를 가져오려고했는데 그러면 클래스테이블에서 이름가져와야하고?
클래스 테이블의 NO를 가지고 또 NO를 가져와야한단말이에요?
어떻게 쉽게 처리할수 있을까요
다오를 다른테이블에서 들고와요?
그래도되는데 셀렉트할때 조건에 맞는 값이 있어야해요?
클래스네임을 가져온다하면 클래스 NO를 가져와야해요ㅗ?
클래스 네임을 찾기 위해 멤버 NO가 있는데 이건 선생번호에요?
클래스는 선생님관련된거니까 선생님꺼에요?
클래서 NO나 번호를 알아와야하는데 어쩌죠
클래스 DTO를 다 가져와요?
하나만 셀렉해서 가져와요?
그러면 클레스 NO를 알아야하는데 어떻게 알죠?
파도타기처럼할까요
타고타고?
복잡해져요x단계가 많아져요, 선생님번호인데 
학생한테도 클래스번호가 들어가야하는데 클래스 테이블에 학생번호가 들어가는 자리가 없어요
학생번호가 들어간다하면 목록으로...?
지금은...결제를 연동해서 가져와요?
계속 연동해요~~
미쳐따
결제를 학생이 하는거니까 학생번호가 들어와요
학생번호를 가지고페이먼트 테이블에서 클래스 테이블을 가져와요
클래스에 학생번호를 추가해요
이건 리스트 타입으로 넣어야되요JSON.LIST로?



클레스 테이블의 엔오랑 클래스네임을 가져와요..?
클레스에 넣으면 클래스에서 클래스엔오르 가지고 조인을시켜요....?
여기저기 조인을 많이 해야함



*/









