DROP SEQUENCE CLASSDATA_SEQ;
DROP TABLE CLASSDATA;

CREATE SEQUENCE CLASSDATA_SEQ;
CREATE TABLE CLASSDATA(
	CLASSDATA_NO NUMBER PRIMARY KEY,
	CLASS_NO NUMBER NOT NULL,
	CLASSDATA_NAME VARCHAR2(500) NOT NULL,
	CLASSDATA_PATH VARCHAR2(1000) NOT NULL,
	FOREIGN KEY(CLASS_NO) REFERENCES CLASS(CLASS_NO)
);

