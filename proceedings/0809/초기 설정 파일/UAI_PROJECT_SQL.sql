--�ۼ���: 19.08.09.��
--**(LHE) ���� �۾� ȯ�濡�� DB�� ����� �׽�Ʈ�� �� ���� ���� ���̺�/������ ���� ���� �Դϴ�.
--        ���� �׽�Ʈ�� ����ȣ��Ʈ/SCOTT ������ ���̺��� ���� �׽�Ʈ ���ּ���.
--  Ȯ���� ���̺� ���: UML ���� ����
-- CREATE �������� ������� �� ��ɾ �������ּ���.


--Product ���̺� ���� ����
CREATE TABLE Product (
    P_IDX NUMBER(10) NOT NULL PRIMARY KEY,
    P_NAME VARCHAR2(100),
    P_ORIGINALPRICE NUMBER(8),
    P_DISCOUNTRATE NUMBER(2),   --(lhe) 0.xx�� �Ҽ� ��,���ڸ� ���� �Է� �� ��.
    P_TYPE NUMBER(8),       --(lhe) ��ǰ ī�װ��� 0,1,2���� ���ڷ� �����ϴ� ���� ���� �� ����.
    P_TOTALSALECOUNT NUMBER(8),
    P_POSTDATE DATE,
    P_TEACHER VARCHAR2(40),
    P_CONTENT VARCHAR2(2000)
);

CREATE SEQUENCE Product_Seq;        --(lhe) P_IDX�� ���� ������

--Members ���̺� ���� ����
CREATE TABLE Members (      --(lhe)member�� sql������ �̹� ���̴� �ܾ�� members�� ����
    M_IDX NUMBER(10) NOT NULL PRIMARY KEY,
    M_ID VARCHAR2(40),
    M_PW VARCHAR2(40),
    M_NAME VARCHAR2(20),
    M_NICK VARCHAR2(40),
    M_PHONE VARCHAR2(40),
    M_ADDRESS VARCHAR2(100),
    M_GENDER VARCHAR2(20),--(lhe) ������ �Է� �� M,F ���� ������ ���ĺ� ������ �Է��ϴ� ���� ���� �� ����.
    M_BIRTH DATE,
    M_JOINDATE DATE,
    M_INTEREST1 VARCHAR2(100),
    M_INTEREST2 VARCHAR2(100),
    M_INTEREST3 VARCHAR2(100),
    M_EDUCATION VARCHAR2(20),
    M_MAJOR VARCHAR2(100),
    M_JOB VARCHAR2(100),
    M_MARITALSTATUS NUMBER(10)  --(lhe)0,1,2 ���� ���ڷ� �����ϴ°� ���� �� ����.
);

CREATE SEQUENCE Members_Seq;        --(lhe) M_IDX�� ���� ������.



--Admins ���̺� ���� ����
CREATE TABLE Admins (       --(lhe) admin�� sql�������� �̹� ���̴� �ܾ�� admins�� ����
    AD_IDX NUMBER(10) NOT NULL PRIMARY KEY,
    AD_ID VARCHAR2(40),
    AD_PW VARCHAR2(40),
    AD_NICK VARCHAR2(40)
);

CREATE SEQUENCE Admin_Seq;        --(lhe) AD_IDX�� ���� ������.


--Files ���̺� ���� ����
CREATE TABLE Files ( --(lhe) file�� sql�������� �̹� ���̴� �ܾ�� files�� ����
    F_IDX NUMBER(10) NOT NULL PRIMARY KEY,
    B_IDX NUMBER(10),
    F_PATH VARCHAR2(1000),
    F_ORIGINALNAME VARCHAR2(1000)
);

CREATE SEQUENCE Files_Seq;        --(lhe) F_IDX�� ���� ������.



--Board_Content ���̺� ����
CREATE TABLE Board_Content (
    B_IDX NUMBER(10) NOT NULL PRIMARY KEY ,
    B_TYPE NUMBER(8),           --(lhe) �Խ��� Ÿ�Ե� 0,1,2���� ���ڷ� �����ϴ� ���� ���� �� ����.
    B_TITLE VARCHAR2(100),
    B_CONTENT VARCHAR2(2000),
    B_POSTDATE DATE,
    B_COUNT NUMBER(5),
    B_ISHIDDEN NUMBER(5),       --(lhe)0,1�� ������ �Ǵ��� ���̹Ƿ� 1�ڸ� ���� ����.
    B_PW VARCHAR2(40),
    B_QCATEGORY NUMBER(8),
    B_ISPOST NUMBER(5),
    M_IDX NUMBER(10),
    P_IDX NUMBER(10),
    AD_IDX NUMBER(10)
);

CREATE SEQUENCE Board_Content_Seq;        --(lhe) B_IDX�� ���� ������.



--Board_Content �������� (�ܷ�Ű ����)
ALTER TABLE Board_Content ADD CONSTRAINT fk_members FOREIGN KEY (M_IDX) REFERENCES Members(m_idx);

ALTER TABLE Board_Content ADD CONSTRAINT fk_product FOREIGN KEY (P_IDX) REFERENCES Product(p_idx);

ALTER TABLE Board_Content ADD CONSTRAINT fk_admin FOREIGN KEY (AD_IDX) REFERENCES Product(p_idx);


--Orders ���̺� ���� ����
CREATE TABLE Orders (   --(lhe) file�� sql�������� �̹� ���̴� �ܾ�� files�� ����
    O_IDX NUMBER(10) NOT NULL PRIMARY KEY,
    O_TOTALPRICE NUMBER(10),
    O_DATE DATE,
    O_ISPAID NUMBER(2),     --(lhe) 0,1���� ���ڷ� �Է��ϴ� ���� ���� ��.
    O_PAYMENTMETHOD NUMBER(2), --(lhe) 0,1���� ���ڷ� �Է��ϴ� ���� ���� ��.
    P_IDX NUMBER(10),
    M_IDX NUMBER(10)
);

CREATE SEQUENCE Orders_Seq;        --(lhe) O_IDX�� ���� ������.


--Orders ���̺� ��������(�ܷ�Ű ����)
ALTER TABLE Orders ADD CONSTRAINT fk_product2 FOREIGN KEY (P_IDX) REFERENCES Product(P_IDX);

ALTER TABLE Orders ADD CONSTRAINT fk_members2 FOREIGN KEY (M_IDX) REFERENCES Members(M_IDX);

COMMIT;










