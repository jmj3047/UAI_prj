--작성일: 19.08.09.금
--**(LHE) 개별 작업 환경에서 DB를 만들어 테스트할 때 쓰는 공통 테이블/시퀀스 생성 쿼리 입니다.
--        개별 테스트는 로컬호스트/SCOTT 계정에 테이블을 만들어서 테스트 해주세요.
--  확정된 테이블 목록: UML 파일 참조
-- CREATE 구문부터 순서대로 한 명령어씩 실행해주세요.


--Product 테이블 생성 쿼리
CREATE TABLE Product (
    P_IDX NUMBER(10) NOT NULL PRIMARY KEY,
    P_NAME VARCHAR2(100),
    P_ORIGINALPRICE NUMBER(8),
    P_DISCOUNTRATE NUMBER(2),   --(lhe) 0.xx의 소수 한,두자리 수로 입력 될 것.
    P_TYPE NUMBER(8),       --(lhe) 상품 카테고리도 0,1,2등의 숫자로 구분하는 것이 좋을 것 같음.
    P_TOTALSALECOUNT NUMBER(8),
    P_POSTDATE DATE,
    P_TEACHER VARCHAR2(40),
    P_CONTENT VARCHAR2(2000)
);

CREATE SEQUENCE Product_Seq;        --(lhe) P_IDX로 쓰일 시퀀스

--Members 테이블 생성 쿼리
CREATE TABLE Members (      --(lhe)member가 sql문법에 이미 쓰이는 단어라 members로 변경
    M_IDX NUMBER(10) NOT NULL PRIMARY KEY,
    M_ID VARCHAR2(40),
    M_PW VARCHAR2(40),
    M_NAME VARCHAR2(20),
    M_NICK VARCHAR2(40),
    M_PHONE VARCHAR2(40),
    M_ADDRESS VARCHAR2(100),
    M_GENDER VARCHAR2(20),--(lhe) 데이터 입력 시 M,F 등의 간단한 알파벳 값으로 입력하는 것이 좋을 것 같음.
    M_BIRTH DATE,
    M_JOINDATE DATE,
    M_INTEREST1 VARCHAR2(100),
    M_INTEREST2 VARCHAR2(100),
    M_INTEREST3 VARCHAR2(100),
    M_EDUCATION VARCHAR2(20),
    M_MAJOR VARCHAR2(100),
    M_JOB VARCHAR2(100),
    M_MARITALSTATUS NUMBER(10)  --(lhe)0,1,2 등의 숫자로 구분하는게 좋을 것 같음.
);

CREATE SEQUENCE Members_Seq;        --(lhe) M_IDX로 쓰일 시퀀스.



--Admins 테이블 생성 쿼리
CREATE TABLE Admins (       --(lhe) admin이 sql구문에서 이미 쓰이는 단어라 admins로 변경
    AD_IDX NUMBER(10) NOT NULL PRIMARY KEY,
    AD_ID VARCHAR2(40),
    AD_PW VARCHAR2(40),
    AD_NICK VARCHAR2(40)
);

CREATE SEQUENCE Admin_Seq;        --(lhe) AD_IDX로 쓰일 시퀀스.


--Files 테이블 생성 쿼리
CREATE TABLE Files ( --(lhe) file이 sql구문에서 이미 쓰이는 단어라 files로 변경
    F_IDX NUMBER(10) NOT NULL PRIMARY KEY,
    B_IDX NUMBER(10),
    F_PATH VARCHAR2(1000),
    F_ORIGINALNAME VARCHAR2(1000)
);

CREATE SEQUENCE Files_Seq;        --(lhe) F_IDX로 쓰일 시퀀스.



--Board_Content 테이블 쿼리
CREATE TABLE Board_Content (
    B_IDX NUMBER(10) NOT NULL PRIMARY KEY ,
    B_TYPE NUMBER(8),           --(lhe) 게시판 타입도 0,1,2등의 숫자로 구분하는 것이 좋을 것 같음.
    B_TITLE VARCHAR2(100),
    B_CONTENT VARCHAR2(2000),
    B_POSTDATE DATE,
    B_COUNT NUMBER(5),
    B_ISHIDDEN NUMBER(5),       --(lhe)0,1의 값으로 판단할 것이므로 1자리 수로 제한.
    B_PW VARCHAR2(40),
    B_QCATEGORY NUMBER(8),
    B_ISPOST NUMBER(5),
    M_IDX NUMBER(10),
    P_IDX NUMBER(10),
    AD_IDX NUMBER(10)
);

CREATE SEQUENCE Board_Content_Seq;        --(lhe) B_IDX로 쓰일 시퀀스.



--Board_Content 제약조건 (외래키 설정)
ALTER TABLE Board_Content ADD CONSTRAINT fk_members FOREIGN KEY (M_IDX) REFERENCES Members(m_idx);

ALTER TABLE Board_Content ADD CONSTRAINT fk_product FOREIGN KEY (P_IDX) REFERENCES Product(p_idx);

ALTER TABLE Board_Content ADD CONSTRAINT fk_admin FOREIGN KEY (AD_IDX) REFERENCES Product(p_idx);


--Orders 테이블 생성 쿼리
CREATE TABLE Orders (   --(lhe) file이 sql구문에서 이미 쓰이는 단어라 files로 변경
    O_IDX NUMBER(10) NOT NULL PRIMARY KEY,
    O_TOTALPRICE NUMBER(10),
    O_DATE DATE,
    O_ISPAID NUMBER(2),     --(lhe) 0,1등의 숫자로 입력하는 것이 좋을 듯.
    O_PAYMENTMETHOD NUMBER(2), --(lhe) 0,1등의 숫자로 입력하는 것이 좋을 듯.
    P_IDX NUMBER(10),
    M_IDX NUMBER(10)
);

CREATE SEQUENCE Orders_Seq;        --(lhe) O_IDX로 쓰일 시퀀스.


--Orders 테이블 제약조건(외래키 설정)
ALTER TABLE Orders ADD CONSTRAINT fk_product2 FOREIGN KEY (P_IDX) REFERENCES Product(P_IDX);

ALTER TABLE Orders ADD CONSTRAINT fk_members2 FOREIGN KEY (M_IDX) REFERENCES Members(M_IDX);

COMMIT;










