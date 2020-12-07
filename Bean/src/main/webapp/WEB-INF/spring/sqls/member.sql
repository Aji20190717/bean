DROP SEQUENCE MEMBER_SEQ;
DROP TABLE MEMBER;

CREATE SEQUENCE MEMBER_SEQ;
CREATE TABLE MEMBER(
	MEMBER_NO NUMBER PRIMARY KEY,
	MEMBER_ID VARCHAR2(500) NOT NULL,
	MEMBER_PW VARCHAR2(500) NOT NULL,
	MEMBER_PWCHK VARCHAR2(500) NOT NULL,
	MEMBER_NAME VARCHAR2(500) NOT NULL,
	MEMBER_EMAIL VARCHAR2(100) NOT NULL,
	MEMBER_PHONE VARCHAR2(100) NOT NULL,
	MEMBER_POST NUMBER NOT NULL,
	MEMBER_ADDR1 VARCHAR2(200) NOT NULL,
	MEMBER_ADDR2 VARCHAR2(200) NOT NULL,
	MEMBER_BIRTH VARCHAR2(100) NOT NULL,
	MEMBER_IMGNAME VARCHAR2(500),
	MEMBER_IMGPATH VARCHAR2(1000),
	MEMBER_TYPE VARCHAR2(4) NOT NULL,
	MEMBER_WITHDRAWAL VARCHAR2(2) NOT NULL,
	MEMBER_SNS VARCHAR2(500),
	CONSTRAINT MEMBER_UN UNIQUE(MEMBER_ID, MEMBER_EMAIL),
	CONSTRAINT MEMBER_CK1 CHECK(MEMBER_TYPE IN('A','SN','SG','S','T')),
	CONSTRAINT MEMBER_CK2 CHECK(MEMBER_WITHDRAWAL IN('Y','N'))
);
