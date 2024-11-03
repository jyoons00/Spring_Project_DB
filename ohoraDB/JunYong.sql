

--회원 추가사항 (o_user)

-- sns동의 하나로 묶여있던것 sms/email 로 분리할 것임 따라서 sns => sms로 변경
ALTER TABLE o_user RENAME COLUMN USER_SNSAGREE TO USER_SMSAGREE;

--email동의 컬럼 추가
ALTER TABLE o_user ADD USER_EMAILAGREE CHAR(1);

--디폴트 N줬음 이메일도 
alter table o_user modify USER_EMAILAGREE default 'N';


-- 리뷰 테이블에 제품번호 컬럼 추가
ALTER TABLE o_review
ADD pdt_id INT;

ALTER TABLE o_review
MODIFY pdt_id NUMBER;

COMMENT ON COLUMN o_review.pdt_id IS '제품ID';

-- 리뷰에 제품번호 FK로 주기
ALTER TABLE o_review
ADD CONSTRAINT fk_o_product
FOREIGN KEY (pdt_id)
REFERENCES o_product(pdt_id);

-- 카트리스트 id를 order테이블의 FK로 주기
ALTER TABLE o_order
ADD CONSTRAINT fk_o_cartlist_to_o_order
FOREIGN KEY (cart_id)
REFERENCES o_cartlist(clist_id);

COMMIT;
