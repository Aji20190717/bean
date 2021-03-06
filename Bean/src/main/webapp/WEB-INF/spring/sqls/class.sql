DROP SEQUENCE CLASS_SEQ;
DROP TABLE CLASS;


-- "학생번호" : "imp_uid" 로 이루어진 jsonString을 넣을 것(띄어쓰기 유의)
-- DELFLAG : F(Finish), D(Delete), N(No : 안지워짐)
CREATE SEQUENCE CLASS_SEQ;
CREATE TABLE CLASS(
	CLASS_NO NUMBER PRIMARY KEY,
	MEMBER_NO NUMBER NOT NULL,
	CLASS_MAX NUMBER NOT NULL,
	CLASS_NOW NUMBER NOT NULL,
	CLASS_STARTDATE DATE NOT NULL,
	CLASS_ENDDATE DATE NOT NULL,
	CLASS_NAME VARCHAR2(500) NOT NULL,
	CLASS_CONTENT VARCHAR2(1000) NOT NULL,
	CLASS_MEMBERNAME VARCHAR2(1000),
	CLASS_DELFLAG VARCHAR2(2),
	CONSTRAINT CLASSISDONE CHECK(CLASS_DELFLAG IN ('F', 'D', 'N')),
	FOREIGN KEY(MEMBER_NO) REFERENCES MEMBER(MEMBER_NO)
);

SELECT CLASS_ENDDATE, SYSDATE-1 FROM CLASS WHERE TO_CHAR(CLASS_ENDDATE, 'YYYYMMDD') = TO_CHAR(SYSDATE-1, 'YYYYMMDD');
SELECT TO_CHAR(CLASS_ENDDATE, 'YYYYMMDD'), TO_CHAR(SYSDATE-1, 'YYYYMMDD') FROM CLASS;
SELECT * FROM CLASS;
INSERT INTO CLASS VALUES(CLASS_SEQ.NEXTVAL, 1, 6, 0, SYSDATE, SYSDATE, 'helloclass', null, 'N');

		SELECT CLASS_NO, MEMBER_NO, CLASS_MAX, CLASS_NOW,
		CLASS_STARTDATE,
		CLASS_ENDDATE, CLASS_NAME, CLASS_MEMBERNAME,
		CLASS_DELFLAG
		FROM CLASS

INSERT INTO CLASS VALUES(CLASS_SEQ.NEXTVAL, 선생님 멤버 번호, 6, 0, SYSDATE, SYSDATE+2, 'helloclass', '{"64":"Hello"}', 'N');


INSERT INTO CLASS VALUES(CLASS_SEQ.NEXTVAL, 2, 6, 0, SYSDATE, SYSDATE+2, '2번선생님수업', '{"64":"Hello"}', 'N');