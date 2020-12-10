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
	REVIEWBOARD_DELFLAG VARCHAR2(2) NOT NULL,
	CLASS_NAME VARCHAR2(500) NOT NULL,
	REVIEWBOARD_TE VARCHAR2(20) NOT NULL,
	REVIEWBOARD_STAR NUMBER NOT NULL,
	FOREIGN KEY(MEMBER_NO) REFERENCES MEMBER(MEMBER_NO),
	CONSTRAINT REVIEWBOARD_CK CHECK(REVIEWBOARD_DELFLAG IN('Y','N'))
	);

INSERT INTO REVIEWBOARD
VALUES(REVIEWBOARD_SEQ.NEXTVAL, 1, '이름', '제목', '내용', SYSDATE, 11, 'N', '수강한강좌', '선생', 5);

