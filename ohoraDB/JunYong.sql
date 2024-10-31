

--회원 추가사항 (o_user)

-- sns동의 하나로 묶여있던것 sms/email 로 분리할 것임 따라서 sns => sms로 변경
ALTER TABLE o_user RENAME COLUMN USER_SNSAGREE TO USER_SMSAGREE;

--email동의 컬럼 추가
ALTER TABLE o_user ADD USER_EMAILAGREE CHAR(1);

--디폴트 N줬음 이메일도 
alter table o_user modify USER_EMAILAGREE default 'N';
