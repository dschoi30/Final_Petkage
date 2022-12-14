-- PETKAGE 계정 생성
-- CREATE USER PETKAGE IDENTIFIED BY PETKAGE;
-- GRANT RESOURCE, CONNECT TO PETKAGE;


-- 컬럼명을 테이블명의 줄임말로 변경

------------------------------------------------
-------------- MEMBER 관련 테이블 --------------
------------------------------------------------

CREATE TABLE MEMBER ( 
	M_NO NUMBER,
	M_ID VARCHAR2(20) NOT NULL,
	M_PWD VARCHAR2(50) NOT NULL,
	M_NAME VARCHAR2(20) NOT NULL,
	M_PHONE VARCHAR2(20) NOT NULL,
    M_ZONECODE NUMBER NOT NULL,
	M_ADDRESS VARCHAR2(200) NOT NULL,
    M_SUBADDRESS VARCHAR2(200) NOT NULL,
	M_EMAIL VARCHAR2(30) NOT NULL,
	M_REPORT NUMBER DEFAULT 0,
	M_ROLE VARCHAR2(10) DEFAULT 'ROLE_USER',
    M_POINT NUMBER DEFAULT 0,
	M_STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(M_STATUS IN('Y', 'N')),
    M_ENROLLDATE DATE NOT NULL DEFAULT SYSDATE,   
    CONSTRAINT MEMBER_M_NO_PK PRIMARY KEY(M_NO),
    CONSTRAINT MEMBER_M_ID_UQ UNIQUE(M_ID)
);

COMMENT ON COLUMN MEMBER.M_NO IS '회원 번호';
COMMENT ON COLUMN MEMBER.M_ID IS '회원 아이디';
COMMENT ON COLUMN MEMBER.M_PWD IS '비밀번호';
COMMENT ON COLUMN MEMBER.M_NAME IS '이름';
COMMENT ON COLUMN MEMBER.M_PHONE IS '연락처';
COMMENT ON COLUMN MEMBER.M_ZONECODE IS '우편번호';
COMMENT ON COLUMN MEMBER.M_ADDRESS IS '주소';
COMMENT ON COLUMN MEMBER.M_SUBADDRESS IS '나머지주소';
COMMENT ON COLUMN MEMBER.M_EMAIL IS '이메일';
COMMENT ON COLUMN MEMBER.M_POINT IS '포인트';
COMMENT ON COLUMN MEMBER.M_REPORT IS '신고수';
COMMENT ON COLUMN MEMBER.M_ROLE IS '역할(ROLE_USER/ROLE_SELLER/ROLE_ADMIN)';
COMMENT ON COLUMN MEMBER.M_STATUS IS '회원 상태(Y/N)';
COMMENT ON COLUMN MEMBER.M_ENROLLDATE IS '가입일';


CREATE SEQUENCE SEQ_MEM_NO;

-- 테스트 관리자 삽입
INSERT INTO MEMBER (
    M_NO,
    M_ID,
    M_PWD,
    M_NAME,
    M_PHONE,
    M_ZONECOMDE
    M_ADDRESS,
    M_SUBADDRESS,
    M_EMAIL,
    M_POINT,
    M_REPORT,
    M_ROLE,
    M_STATUS
    M_ENROLLDATE
) VALUES (
    SEQ_MEM_NO.NEXTVAL,
    'ADMIN',
    'qwer1234',
    '관리자',
    '관리자',
    '01012345678',
    '000000'
    '서울특별시 강남구',
    'KH 강남 교육원'
    'petkage@gmail.com',
    DEFAULT,
    DEFAULT,
    'ROLE_ADMIN', 
    DEFAULT,
    DEFAULT
);

------------------------------------------------
-------------- SELLER 관련 테이블 --------------
------------------------------------------------

CREATE TABLE SELLER (
	SELLER_NO NUMBER NOT NULL,
	SHOP_NAME VARCHAR2(50) NOT NULL,
	SHOP_LICENSE NUMBER	NOT NULL,
	CONSTRAINT SELLER_SELLER_NO_PK PRIMARY KEY(SELLER_NO),
	CONSTRAINT SELLER_SELLER_NO_FK FOREIGN KEY(SELLER_NO) REFERENCES MEMBER(M_NO) ON DELETE SET NULL -- ON DELETE 어떤 속성 줄껀지
);

COMMENT ON COLUMN SELLER.SELLER_NO IS '판매자 번호';
COMMENT ON COLUMN SELLER.SHOP_NAME IS '상점명';
COMMENT ON COLUMN SELLER.SHOP_LICENSE IS '사업자 등록 번호';

-- 테스트 판매자 삽입 
INSERT INTO SELLER (
    SELLER_NO,
    SHOP_NAME,
	SHOP_LICENSE
) VALUES (
	'',
	'',
	''
);

------------------------------------------------
---------------- PET 관련 테이블 ---------------
------------------------------------------------

CREATE TABLE PET (
	PET_NO NUMBER,
	M_NO NUMBER NOT NULL,
	PET_NAME VARCHAR2(20) NOT NULL,
	PET_INFO VARCHAR2(1000),
	PET_TYPE VARCHAR2(1) NOT NULL CHECK(PET_TYPE IN('D', 'C')),
	PET_WEIGHT NUMBER,
	PET_STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(PET_STATUS IN('Y', 'N')),
	CONSTRAINT PET_PET_NO_PK PRIMARY KEY(PET_NO),
	CONSTRAINT PET_M_NO_FK FOREIGN KEY(M_NO) REFERENCES MEMBER(M_NO)
);

COMMENT ON COLUMN PET.PET_NO IS '펫 번호';
COMMENT ON COLUMN PET.MEM_NO IS '회원 번호';
COMMENT ON COLUMN PET.PET_NAME IS '펫 이름';
COMMENT ON COLUMN PET.PET_INFO IS '펫 정보';
COMMENT ON COLUMN PET.PET_TYPE IS '펫 타입(D/C)';
COMMENT ON COLUMN PET.PET_WEIGHT IS '펫 몸무게';
COMMENT ON COLUMN PET.PET_STATUS IS '펫 상태(Y/N)';

CREATE SEQUENCE SEQ_PET_NO;

-- 테스트 펫 삽입 
INSERT INTO PET (
    PET_NO,
	M_NO,
	PET_NAME,
	PET_INFO,
	PET_TYPE,
	PET_WEIGHT,
	PET_STATUS,
) VALUES (
	SEQ_PET_NO.NEXTVAL,
	'',
	'',
	'',
	'',
	'',
	DEFAULT
);

------------------------------------------------
--------------- BOARD 관련 테이블 --------------
------------------------------------------------

CREATE TABLE BOARD (
	B_NO NUMBER,
	B_WRITER_NO NUMBER NOT NULL,
	B_TYPE VARCHAR2(20)	NOT NULL,
	B_CATEGORY VARCHAR2(20) NOT NULL,
	B_TITLE VARCHAR2(100) NOT NULL,
	B_CONTENT VARCHAR2(4000) NOT NULL,
	B_DATE DATE DEFAULT SYSDATE,
	B_IMG VARCHAR2(1000),
	B_LOCATION VARCHAR2(1000),
	B_VIEWS NUMBER DEFAULT 0,
	B_RECOMMEND NUMBER DEFAULT 0,
	B_REPORT NUMBER	DEFAULT 0,
	B_STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(B_STATUS IN('Y', 'N')),
	CONSTRAINT BOARD_B_NO_PK PRIMARY KEY(B_NO),
    CONSTRAINT BOARD_B_WRITER_NO_FK FOREIGN KEY(B_WRITER_NO) REFERENCES MEMBER(M_NO),
);

COMMENT ON COLUMN BOARD.B_NO IS '게시글 번호';
COMMENT ON COLUMN BOARD.B_WRITER_NO IS '작성자 번호';
-- COMMENT ON COLUMN BOARD.BOARD_WRITER IS '작성자'; -- 작성자 번호로 불러오기
COMMENT ON COLUMN BOARD.B_TYPE IS '게시글 타입(커뮤티니/공지사항/어디가지/펫시터)';
COMMENT ON COLUMN BOARD.B_CATEGORY IS '게시글 카테고리(잡담/질문/숙소/맛집/병원/등등)';
COMMENT ON COLUMN BOARD.B_TITLE IS '제목';
COMMENT ON COLUMN BOARD.B_CONTENT IS '내용';
COMMENT ON COLUMN BOARD.B_DATE IS '작성일자';
COMMENT ON COLUMN BOARD.B_IMG IS '첨부 이미지';
COMMENT ON COLUMN BOARD.B_LOCATION IS '위치'; -- 뺄까?
COMMENT ON COLUMN BOARD.B_VIEWS IS '조회수';
COMMENT ON COLUMN BOARD.B_RECOMMEND IS '추천수';
COMMENT ON COLUMN BOARD.B_REPORT IS '신고수';
COMMENT ON COLUMN BOARD.B_STATUS IS '게시글 상태(Y/N)';

CREATE SEQUENCE SEQ_BOARD_NO;

-- 테스트 판매자 삽입 
INSERT INTO PET (
   	B_NO,
	B_WRITER_NO,
	B_TYPE,
	B_CATEGORY, 
	B_TITLE, 
	B_CONTENT, I
	B_DATE,
	B_IMG,
	B_LOCATION, 
	B_VIEWS,
	B_RECOMMEND,
	B_REPORT,
	B_STATUS
) VALUES (
	SEQ_BOARD_NO.NEXTVAL,
	'',
	'',
	'',
	'',
	'',
	DEFAULT,
	'',
	'',
	DEFAULT,
	DEFAULT,
	DEFAULT,
	DEFAULT
);

------------------------------------------------
-------------- PRODUCT 관련 테이블 -------------
------------------------------------------------

CREATE TABLE PRODUCT (
	PRO_NO NUMBER NOT NULL,
	PRO_SELLER_NO NUMBER NOT NULL,
	PRO_NAME VARCHAR2(100) NOT NULL,
	PRO_CONTENT	VARCHAR2(4000) NOT NULL,
	PRO_IMG	VARCHAR2(1000) NOT NULL,
	PRO_PRICE NUMBER NOT NULL,
	PRO_QUANTITY NUMBER	DEFAULT 1,
	PRO_DATE DATE DEFAULT SYSDATE,
	PRO_STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(PRO_STATUS IN('Y', 'N')),
	PRO_REPORT NUMBER DEFAULT 0,
	CONSTRAINT PRODUCT_PRO_NO_PK PRIMARY KEY(PRO_NO),
    CONSTRAINT PRODUCT_PRO_SELLER_NO_FK FOREIGN KEY(PRO_SELLER_NO) REFERENCES MEMBER(M_NO)
);

COMMENT ON COLUMN PRODUCT.PRO_NO IS '상품 번호';
COMMENT ON COLUMN PRODUCT.PRO_SELLER_NO IS '판매자 번호';
COMMENT ON COLUMN PRODUCT.PRO_NAME IS '상품명';
COMMENT ON COLUMN PRODUCT.PRO_CONTENT IS '상품 설명';
COMMENT ON COLUMN PRODUCT.PRO_IMG IS '상품 이미지';
COMMENT ON COLUMN PRODUCT.PRO_PRICE IS '상품 가격';
COMMENT ON COLUMN PRODUCT.PRO_QUANTITY IS '상품 수량';
COMMENT ON COLUMN PRODUCT.PRO_DATE IS '등록일자';
COMMENT ON COLUMN PRODUCT.PRO_STATUS IS '상품 상태(Y/N)';
COMMENT ON COLUMN PRODUCT.PRO_REPORT IS '신고수';

CREATE SEQUENCE SEQ_PRO_NO;

-- 테스트 상품 삽입
INSERT INTO PRODUCT (
    PRO_NO,
	PRO_SELLER_NO,
	PRO_NAME,
	PRO_CONTENT,	
	PRO_IMG,
	PRO_PRICE,
	PRO_QUANTITY,
	PRO_DATE,
	PRO_STATUS,
	PRO_REPORT
) VALUES (
    SEQ_PRO_NO.NEXTVAL,
    '',
    '',
    '',
    '',
    '',
    '',
    DEFAULT,
    DEFAULT,
    DEFAULT,
    DEFAULT
);

------------------------------------------------
-------------- REVIEW 관련 테이블 --------------
------------------------------------------------

CREATE TABLE REVIEW (
	RV_NO NUMBER,
	RV_B_NO NUMBER,
	RV_PRO_NO NUMBER,
	RV_WRITER_NO NUMBER NOT NULL,
	RV_TYPE	VARCHAR2(20),
	RV_TITLE VARCHAR2(100) NOT NULL,
	RV_CONTENT VARCHAR2(4000) NOT NULL,
	RV_IMG VARCHAR2(1000),
	RV_DATE	DATE DEFAULT SYSDATE,
	RV_SCORE NUMBER DEFAULT 0,
	RV_RECOMMEND NUMBER DEFAULT 0,
	RV_STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(RV_STATUS IN('Y', 'N')),
	RV_REPORT NUMBER DEFAULT 0,
	CONSTRAINT REVIEW_RV_NO_PK PRIMARY KEY(RV_NO),
    CONSTRAINT REVIEW_RV_B_NO_FK FOREIGN KEY(RV_B_NO) REFERENCES BOARD(B_NO),
    CONSTRAINT REVIEW_RV_PRO_NO_FK FOREIGN KEY(RV_PRO_NO) REFERENCES PRODUCT(PRO_NO),
    CONSTRAINT REVIEW_RV_WRITER_NO_FK FOREIGN KEY(RV_WRITER_NO) REFERENCES MEMBER(M_NO) 
    
);

COMMENT ON COLUMN REVIEW.RV_NO IS '리뷰 번호';
COMMENT ON COLUMN REVIEW.RV_B_NO IS '게시글 번호';
COMMENT ON COLUMN REVIEW.RV_PRO_NO IS '상품 번호';
COMMENT ON COLUMN REVIEW.RV_WRITER_NO IS '작성자 번호';
COMMENT ON COLUMN REVIEW.RV_TYPE IS '리뷰 타입(어디가지/상품)';
COMMENT ON COLUMN REVIEW.RV_TITLE IS '제목';
COMMENT ON COLUMN REVIEW.RV_CONTENT IS '내용';
COMMENT ON COLUMN REVIEW.RV_DATE IS '작성일자';
COMMENT ON COLUMN REVIEW.RV_IMG IS '첨부 이미지';
COMMENT ON COLUMN REVIEW.RV_SCORE IS '별점(1/2/3/4/5)';
COMMENT ON COLUMN REVIEW.RV_RECOMMEND IS '추천수';
COMMENT ON COLUMN REVIEW.RV_STATUS IS '리뷰 상태(Y/N)';
COMMENT ON COLUMN REVIEW.RV_REPORT IS '신고수';

CREATE SEQUENCE SEQ_REVIEW_NO;

-- 테스트 리뷰 삽입
INSERT INTO REVIEW (
    RV_NO,
	RV_B_NO,
	RV_PRO_NO,
	RV_WRITER_NO,
	RV_TYPE,
	RV_TITLE,
	RV_CONTENT,
	RV_IMG,
	RV_DATE,
	RV_SCORE,
	RV_RECOMMEND,
	RV_STATUS,
	RV_REPORT
) VALUES (
	SEQ_REVIEW_NO.NEXTVAL,
	'',
	'',
	'',
	'',
	'',
	'',
	'',
	DEFAULT,
	DEFAULT,
	DEFAULT,
	DEFAULT,
	DEFAULT
);

------------------------------------------------
--------------- REPLY 관련 테이블 --------------
------------------------------------------------

CREATE TABLE REPLY (
	RP_NO NUMBER,
	RP_B_NO NUMBER	NOT NULL,
	RP_WRITER_NO NUMBER NOT NULL,
	RP_CONTENT VARCHAR2(2000) NOT NULL,
	RP_CREATE_DATE DATE DEFAULT SYSDATE,
	RP_MODIFY_DATE DATE NOT NULL,
	RP_STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(RP_STATUS IN('Y', 'N')),
	RP_REPORT NUMBER DEFAULT 0,
	CONSTRAINT REPLY_RP_NO_PK PRIMARY KEY(RP_NO),
    CONSTRAINT REPLY_RP_B_NO_FK FOREIGN KEY(RP_B_NO) REFERENCES BOARD(B_NO),
    CONSTRAINT REPLY_RP_WRITER_NO_FK FOREIGN KEY(RP_WRITER_NO) REFERENCES MEMBER(M_NO)
);

COMMENT ON COLUMN REPLY.RP_NO IS '댓글 번호';
COMMENT ON COLUMN REPLY.RP_B_NO IS '게시글 번호';
COMMENT ON COLUMN REPLY.RP_WRITER_NO IS '작성자 번호';
COMMENT ON COLUMN REPLY.RP_CONTENT IS '내용';
COMMENT ON COLUMN REPLY.RP_CREATE_DATE IS '작성일자';
COMMENT ON COLUMN REPLY.RP_MODIFY_DATE IS '수정일자';
COMMENT ON COLUMN REPLY.RP_STATUS IS '리뷰 상태(Y/N)';
COMMENT ON COLUMN REPLY.RP_REPORT IS '신고수';

CREATE SEQUENCE SEQ_REPLY_NO;

-- 테스트 댓글 삽입
INSERT INTO REPLY (
    RP_NO,
	RP_B_NO,
	RP_WRITER_NO,
	RP_CONTENT,
	RP_CREATE_DATE,
	RP_MODIFY_DATE,
	RP_STATUS,
	RP_REPORT
) VALUES (
	SEQ_REPLY_NO.NEXTVAL,
	'',
	'',
	'',
	DEFAULT,
	'',
	DEFAULT,
	DEFAULT
);

------------------------------------------------
--------------- ORDER 관련 테이블 --------------
------------------------------------------------

CREATE TABLE ORDER (
	O_NO NUMBER,
	O_PRO_NO NUMBER	NOT NULL,
	O_M_NO NUMBER NOT NULL,
	O_DATE DATE DEFAULT SYSDATE,
	O_STATUS VARCHAR2(20) DEFAULT '상품 준비중',
	O_PUR_STATUS VARCHAR2(20) DEFAULT '입금 전',
	O_CS_STATUS VARCHAR2(20),
	O_PRO_PRICE NUMBER	NOT NULL,
	O_PRO_POINT NUMBER,
	-- O_DELIVERY_FEE NUMBER DEFAULT 3000, 주문내역에는 필요 없을 거 같은데
	CONSTRAINT REPLY_RP_NO_PK PRIMARY KEY(RP_NO),
    CONSTRAINT REPLY_RP_B_NO_FK FOREIGN KEY(RP_B_NO) REFERENCES BOARD(B_NO),
    CONSTRAINT REPLY_RP_WRITER_NO_FK FOREIGN KEY(RP_WRITER_NO) REFERENCES MEMBER(M_NO)
);

COMMENT ON COLUMN ORDER.O_NO IS '주문 번호';
COMMENT ON COLUMN ORDER.O_PRO_NO IS '상품 번호';
COMMENT ON COLUMN ORDER.O_M_NO IS '회원 번호';
COMMENT ON COLUMN ORDER.O_DATE IS '주문일자';
COMMENT ON COLUMN ORDER.O_STATUS IS '주문 상태(상품 준비중/배송 준비중/배송대기/배송중/배송 완료)';
COMMENT ON COLUMN ORDER.O_PUR_STATUS IS '결제 상태(입금 전/입금대기/입금완료(수동)/입금완료(자동)/결제완료)';
COMMENT ON COLUMN ORDER.O_CS_STATUS IS 'CS 상태(상품취소/교환/반품/환불)';
COMMENT ON COLUMN ORDER.O_PRO_PRICE IS '주문 상품 금액';
COMMENT ON COLUMN ORDER.O_PRO_POINT IS '상품 포인트';

CREATE SEQUENCE SEQ_ORDER_NO;

-- 테스트 주문 삽입
INSERT INTO ORDER (
    O_NO,
	O_PRO_NO,
	O_M_NO,
	O_DATE, 
	O_STATUS,
	O_PUR_STATUS,
	O_CS_STATUS, 
	O_PRO_PRICE, 
	O_PRO_POINT, 
) VALUES (
	SEQ_ORDER_NO.NEXTVAL,
	'',
	'',
	DEFAULT,
	DEFAULT,
	DEFAULT,
	'',
	'',
	''
);

------------------------------------------------
------------- PURCHASE 관련 테이블 -------------
------------------------------------------------

CREATE TABLE PURCHASE (
	PUR_NO NUMBER,
	PUR_M_NO NUMBER NOT NULL,
	PUR_ORDER_NO NUMBER	NOT NULL,
	PUR_METHODS VARCHAR(20)	NOT NULL,
	PUR_DATE DATE DEFAULT SYSDATE,
	PUR_FINAL_PRICE NUMBER	NOT NULL,
	PUR_ADD_PRICE NUMBER,
	PUR_PRICE NUMBER,
	PUR_NAME VARCHAR(20),
	PUR_BANK VARCHAR(20),
	CONSTRAINT PURCHASE_PUR_NO_PK PRIMARY KEY(PUR_NO),
    CONSTRAINT PURCHASE_PUR_M_NO_FK FOREIGN KEY(PUR_M_NO) REFERENCES MEMBER(M_NO),
    CONSTRAINT PURCHASE_PUR_ORDER_NO_FK FOREIGN KEY(PUR_ORDER_NO) REFERENCES ORDER(O_NO)
);

COMMENT ON COLUMN PURCHASE.PUR_NO IS '결제 번호';
COMMENT ON COLUMN PURCHASE.PUR_M_NO IS '구매자 번호';
COMMENT ON COLUMN PURCHASE.PUR_ORDER_NO IS '주문 번호';
COMMENT ON COLUMN PURCHASE.PUR_METHODS IS '결제 수단';
COMMENT ON COLUMN PURCHASE.PUR_DATE IS '결제일자';
COMMENT ON COLUMN PURCHASE.PUR_FINAL_PRICE IS '총 결제금액';
COMMENT ON COLUMN PURCHASE.PUR_ADD_PRICE IS '추가 금액'; -- 이거 뭐지
COMMENT ON COLUMN PURCHASE.PUR_PRICE IS '입금액'; 
COMMENT ON COLUMN PURCHASE.PUR_NAME IS '입금자명';
COMMENT ON COLUMN PURCHASE.PUR_BANK IS '입금 은행';

CREATE SEQUENCE SEQ_PUR_NO;

-- 테스트 결제 삽입
INSERT INTO PURCHASE (
    PUR_NO,
	PUR_M_NO,
	PUR_ORDER_NO,
	PUR_METHODS,
	PUR_DATE,
	PUR_FINAL_PRICE,
	PUR_ADD_PRICE,
	PUR_PRICE,
	PUR_NAME,
	PUR_BANK
) VALUES (
	SEQ_PUR_NO.NEXTVAL,
	'',
	'',
	'',
	DEFAULT,
	'',
	'',
	'',
	'',
	''
);

------------------------------------------------
--------------- CART 관련 테이블 ---------------
------------------------------------------------

CREATE TABLE CART (
	C_M_NO NUMBER NOT NULL,
	C_PRO_NO NUMBER NOT NULL,
	CONSTRAINT CART_C_M_NO_FK FOREIGN KEY(C_M_NO) REFERENCES MEMBER(M_NO),
    CONSTRAINT CART_C_PRO_NO_FK FOREIGN KEY(C_PRO_NO) REFERENCES PRODUCT(PRO_NO)
);

COMMENT ON COLUMN CART.C_M_NO IS '구매자 번호';
COMMENT ON COLUMN CART.C_PRO_NO IS '상품 번호';

-- 테스트 장바구니 삽입
INSERT INTO PURCHASE (
    C_M_NO,
	C_PRO_NO
) VALUES (
	'',
	''
);

------------------------------------------------
--------------- POINT 관련 테이블 --------------
------------------------------------------------

CREATE TABLE POINT (
	PO_NO NUMBER,
	PO_M_NO NUMBER NOT NULL,
	PO_CUR NUMBER DEFAULT 0,
	PO_ROUTE VARCHER2(1000), -- 경로 정하기
	PO_DATE DATE DEFAULT SYSDATE,
	PO_IN_OUT VARCHER2(5),
	CONSTRAINT POINT_PO_NO_PK PRIMARY KEY(PO_NO),
	CONSTRAINT POINT_PO_M_NO_FK FOREIGN KEY(PO_M_NO) REFERENCES MEMBER(M_NO)
);

COMMENT ON COLUMN POINT.PO_NO IS '포인트 적립 번호';
COMMENT ON COLUMN POINT.PO_M_NO IS '회원 번호';
COMMENT ON COLUMN POINT.PO_CUR IS '현재 포인트';
COMMENT ON COLUMN POINT.PO_ROUTE IS '포인트 사용/획득 경로';
COMMENT ON COLUMN POINT.PO_DATE IS '포인트 사용/획득 일자';
COMMENT ON COLUMN POINT.PO_IN_OUT IS '포인트 증감(PLUS/MINUS)';

CREATE SEQUENCE SEQ_POINT_NO;

-- 테스트 포인트 삽입
INSERT INTO POINT (
    PO_NO,
	PO_M_NO,
	PO_CUR,
	PO_ROUTE,
	PO_DATE,
	PO_IN_OUT
) VALUES (
	SEQ_POINT_NO.NEXTVAL,
	'',
	DEFAULT,
	'',
	DEFAULT,
	''
);

------------------------------------------------
--------------- LIKE 관련 테이블 ---------------
------------------------------------------------

CREATE TABLE LIKE (
	L_NO NUMBER,
	L_M_NO NUMBER,
	L_B_NO NUMBER,
	CONSTRAINT LIKE_L_NO_PK PRIMARY KEY(L_NO),
	CONSTRAINT LIKE_L_M_NO_FK FOREIGN KEY(L_M_NO) REFERENCES MEMBER(M_NO),
	CONSTRAINT LIKE_L_B_NO_FK FOREIGN KEY(L_B_NO) REFERENCES BOARD(B_NO)
);

COMMENT ON COLUMN LIKE.L_NO IS '찜 번호';
COMMENT ON COLUMN LIKE.L_M_NO IS '회원 번호';
COMMENT ON COLUMN LIKE.L_B_NO IS '게시글 번호';

CREATE SEQUENCE SEQ_LIKE_NO;

-- 테스트 찜 삽입
INSERT INTO LIKE (
    L_NO,
	L_M_NO,
	L_B_NO
) VALUES (
	SEQ_LIKE_NO.NEXTVAL,
	'',
	''
);

------------------------------------------------
--------------- FOOD 관련 테이블 ---------------
------------------------------------------------

CREATE TABLE FOOD (
	F_NO NUMBER,
	F_NAME VARCHAR2(20) NOT NULL,
	F_CONTENT VARCHAR2(1000) NOT NULL,
	F_IMG VARCHAR2(1000), -- 이미지 뺄까
	F_PET_TYPE VARCHAR2(1) NOT NULL CHECK(F_PET_TYPE IN('D', 'C')),
	F_OR VARCHAR2(1) NOT NULL CHECK(F_OR IN('O', 'X')),
	CONSTRAINT FOOD_F_NO_PK PRIMARY KEY(F_NO)
);

COMMENT ON COLUMN FOOD.F_NO IS '식품 번호';
COMMENT ON COLUMN FOOD.F_NAME IS '식품명';
COMMENT ON COLUMN FOOD.F_CONTENT IS '식품 설명';
COMMENT ON COLUMN FOOD.F_IMG IS '이미지';
COMMENT ON COLUMN FOOD.F_PET_TYPE IS '펫 타입(D/C)';
COMMENT ON COLUMN FOOD.F_OR IS '가능 여부(O/X)';

CREATE SEQUENCE SEQ_FOOD_NO;

-- 테스트 식품 삽입
INSERT INTO FOOD (
    F_NO,
	F_NAME,
	F_CONTENT,
	F_IMG,
	F_PET_TYPE,
	F_OR
) VALUES (
	SEQ_FOOD_NO.NEXTVAL,
	'',
	'',
	'',
	'',
	''
);

------------------------------------------------
------------- CALENDAR 관련 테이블 -------------
------------------------------------------------

CREATE TABLE CALENDAR (
	CAL_NO NUMBER,
	CAL_M_NO NUMBER NOT NULL,
	CAL_TITLE VARCHAR2(100)	NOT NULL,
	CAL_CONTENT	VARCHAR2(1000) NOT NULL,
	CAL_DATE DATE DEFAULT SYSDATE,
	CONSTRAINT CALENDAR_CAL_NO_PK PRIMARY KEY(CAL_NO),
	CONSTRAINT CALENDAR_CAL_M_NO_FK FOREIGN KEY(CAL_M_NO) REFERENCES MEMBER(M_NO)
);

COMMENT ON COLUMN CALENDAR.CAL_NO IS '캘린더 번호';
COMMENT ON COLUMN CALENDAR.CAL_M_NO IS '회원 번호';
COMMENT ON COLUMN CALENDAR.CAL_TITLE IS '제목';
COMMENT ON COLUMN CALENDAR.CAL_CONTENT IS '내용';
COMMENT ON COLUMN CALENDAR.CAL_DATE IS '작성일자';

CREATE SEQUENCE SEQ_CAL_NO;

-- 테스트 일정 삽입
INSERT INTO CALENDAR (
    CAL_NO,
	CAL_M_NO,
	CAL_TITLE,
	CAL_CONTENT,
	CAL_DATE
) VALUES (
	SEQ_CAL_NO.NEXTVAL,
	'',
	'',
	'',
	DEFAULT
);

CREATE TABLE REPORT (
	REPORT_NO NUMBER,
	REPORT_M_NO	NUMBER NOT NULL,
	REPORT_TYPE VARCHAR2(20) NOT NULL,
	REPORT_CONTENT VARCHAR2(4000) NOT NULL,
	REPORT_DATE DATE DEFAULT SYSDATE,
	TARGET_MEM NUMBER NOT NULL,
	TARGET_KEY NUMBER NOT NULL,
	TARGET_TYPE NUMBER NOT NULL,
	CONSTRAINT REPORT_REPORT_NO_PK PRIMARY KEY(REPORT_NO),
	CONSTRAINT REPORT_REPORT_M_NO_FK FOREIGN KEY(REPORT_M_NO) REFERENCES MEMBER(M_NO),
	CONSTRAINT REPORT_TARGET_MEM_FK FOREIGN KEY(TARGET_MEM) REFERENCES MEMBER(M_NO),
	CONSTRAINT REPORT_TARGET_KEY_FK FOREIGN KEY(TARGET_KEY) REFERENCES BOARD(B_NO), -- 이렇게 다 넣는거 맞나
	CONSTRAINT REPORT_TARGET_KEY_FK FOREIGN KEY(TARGET_KEY) REFERENCES REVIEW(RV_NO),
	CONSTRAINT REPORT_TARGET_KEY_FK FOREIGN KEY(TARGET_KEY) REFERENCES PRODUCT(PRO_NO),
	CONSTRAINT REPORT_TARGET_KEY_FK FOREIGN KEY(TARGET_KEY) REFERENCES REPLY(RP_NO)
);

COMMENT ON COLUMN REPORT.REPORT_NO IS '신고 번호';
COMMENT ON COLUMN REPORT.REPORT_M_NO IS '신고한 회원 번호';
COMMENT ON COLUMN REPORT.REPORT_TYPE IS '신고이유(스팸/음란물/불법/유해/욕설/기타)';
COMMENT ON COLUMN REPORT.REPORT_CONTENT IS '내용';
COMMENT ON COLUMN REPORT.REPORT_DATE IS '신고일자';
COMMENT ON COLUMN REPORT.TARGET_MEM IS '신고당한 회원 번호';
COMMENT ON COLUMN REPORT.TARGET_KEY IS '신고당한 게시물/리뷰/상품/댓글 번호';
COMMENT ON COLUMN REPORT.TARGET_TYPE IS '신고 타입(1.커뮤니티 게시글/2.커뮤티니 댓글/3.어디가지 리뷰/4.상품/5.상품리뷰)';

CREATE SEQUENCE SEQ_REPORT_NO;

-- 테스트 신고 삽입
INSERT INTO REPORT (
    REPORT_NO,
	REPORT_M_NO,
	REPORT_TYPE,
	REPORT_CONTENT,
	REPORT_DATE,
	TARGET_MEM,
	TARGET_KEY,
	TARGET_TYPE,
) VALUES (
	SEQ_REPORT_NO.NEXTVAL,
	'',
	'',
	'',
	DEFAULT,
	'',
	'',
	''
);