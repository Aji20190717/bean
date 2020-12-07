DROP SEQUENCE INTRODUCE_SEQ;
DROP TABLE INTRODUCE;

CREATE SEQUENCE INTRODUCE_SEQ;
CREATE TABLE INTRODUCE(
	INTRODUCE_NO NUMBER PRIMARY KEY,
	MEMBER_NO NUMBER NOT NULL,
	INTRODUCE_CAREER VARCHAR2(500) NOT NULL,
	INTRODUCE_INTRO VARCHAR2(500) NOT NULL,
	INTRODUCE_STATE VARCHAR2(500) NOT NULL,
	CONSTRAINT INTRODUCE_CK CHECK(INTRODUCE_STATE IN('A','P','C')),
	FOREIGN KEY(MEMBER_NO) REFERENCES MEMBER(MEMBER_NO)
);