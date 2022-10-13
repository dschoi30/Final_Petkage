INSERT INTO MEMBER (
    MEM_NO,
    MEM_ID,
    MEM_PWD,
    MEM_NAME,
    MEM_PHONE,
    MEM_ZONECODE,
    MEM_ADDRESS,
    MEM_SUBADDRESS,
    MEM_EMAIL,
    MEM_POINT,
    MEM_REPORT,
    MEM_ROLE,
    MEM_STATUS,
    MEM_ENROLLDATE
) VALUES (
    SEQ_MEM_NO.NEXTVAL,
    'petseller3',
    'qwer1234',
    '판매회원',
    '01012345678',
    '123456',
    '서울특별시 강남구',
    'KH 강남 교육원',
    'petkage@gmail.com',
    DEFAULT,
    DEFAULT,
    'ROLE_USER', 
    DEFAULT,
    DEFAULT
);

INSERT INTO PET (
    PET_NO,
	MEM_NO,
	PET_NAME,
	PET_INFO,
	PET_TYPE,
	PET_WEIGHT,
	PET_STATUS
) VALUES (
	SEQ_PET_NO.NEXTVAL,
	'2',
	'강쥐',
	'털 많음',
	'D',
	'M',
	DEFAULT
);

-- 테스트 판매자 삽입 
INSERT INTO SELLER (
    SEL_NO,
    SEL_NAME,
	SEL_LICENSE
) VALUES (
	'3',
	'판매회원',
	'123456789'
);


-- 테스트 펫 삽입 
INSERT INTO PET (
    PET_NO,
	MEM_NO,
	PET_NAME,
	PET_INFO,
	PET_TYPE,
	PET_WEIGHT,
	PET_STATUS
) VALUES (
	SEQ_PET_NO.NEXTVAL,
	'1',
	'',
	'',
	'D',
	'M',
	DEFAULT
);
