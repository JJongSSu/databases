
CREATE TABLE  결과값
(
 항목별  Avg Uniqu ID  INT  NOT NULL COMMENT '항목별Avg Uniqu ID',
 항목별  sum uniqu ID INT  NOT NULL COMMENT '항목별 sum uniqu ID',
  개인    Sum Uniqu ID  INT  NOT NULL COMMENT '개인 Sum Uniqu ID',
  answer ID        INT NOT NULL COMMENT 'answer ID',
  문항 Uniqu ID      INT NOT NULL COMMENT '문항 Uniqu ID',
  이름 ID            INT NOT NULL COMMENT '이름 ID',
  PRIMARY KEY (항목별Avg Uniqu ID, 항목별 sum uniqu ID, 개인 Sum Uniqu ID)
);

CREATE TABLE Answer
(
  answerID        INT          NOT NULL COMMENT 'answer ID',
  answer           VARCHAR(200) NULL     COMMENT 'answer',
  문항 Uniqu ID      INT          NOT NULL COMMENT '문항 Uniqu ID',
  항목별Avg Uniqu ID  INT          NOT NULL COMMENT '항목별Avg Uniqu ID',
  항목별 sum uniqu ID INT          NOT NULL COMMENT '항목별 sum uniqu ID',
  개인 Sum Uniqu ID  INT          NOT NULL COMMENT '개인 Sum Uniqu ID',
  PRIMARY KEY (answer ID)
);

CREATE TABLE 문항
(
  문항               VARCHAR(200) NOT NULL COMMENT '문항' ,
  문항 Uniqu ID      INT          NOT NULL COMMENT '문항 Uniqu ID',
  이름 ID            INT          NOT NULL COMMENT '이름 ID',
  항목별Avg Uniqu ID  INT          NOT NULL COMMENT '항목별Avg Uniqu ID',
  항목별 sum uniqu ID INT          NOT NULL COMMENT '항목별 sum uniqu ID',
  개인 Sum Uniqu ID  INT          NOT NULL COMMENT '개인 Sum Uniqu ID',
  PRIMARY KEY (문항 Uniqu ID)
);

CREATE TABLE 이름
(
  이름ID            INT          NOT NULL COMMENT '이름 ID',
  이름               VARCHAR(200) NULL     COMMENT '이름 ',
  항목별Avg Uniqu ID  INT          NOT NULL COMMENT '항목별Avg Uniqu ID',
  항목별 sum uniqu ID INT          NOT NULL COMMENT '항목별 sum uniqu ID',
  개인 Sum Uniqu ID  INT          NOT NULL COMMENT '개인 Sum Uniqu ID',
  PRIMARY KEY (이름 ID)
);

ALTER TABLE 문항
  ADD CONSTRAINT FK_이름_TO_문항
    FOREIGN KEY (이름 ID)
    REFERENCES 이름 (이름 ID);

ALTER TABLE Answer
  ADD CONSTRAINT FK_문항_TO_Answer
    FOREIGN KEY (문항 Uniqu ID)
    REFERENCES 문항 (문항 Uniqu ID);

ALTER TABLE  결과값
  ADD CONSTRAINT FK_Answer_TO_ 결과값
    FOREIGN KEY (answer ID)
    REFERENCES Answer (answer ID);

ALTER TABLE  결과값
  ADD CONSTRAINT FK_문항_TO_ 결과값
    FOREIGN KEY (문항 Uniqu ID)
    REFERENCES 문항 (문항 Uniqu ID);

ALTER TABLE  결과값
  ADD CONSTRAINT FK_이름_TO_ 결과값
    FOREIGN KEY (이름 ID)
    REFERENCES 이름 (이름 ID);
    
    
