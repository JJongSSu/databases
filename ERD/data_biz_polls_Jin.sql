
CREATE TABLE Answer
(
  answer ID    NOT NULL,
  answer       NULL    ,
  문항 Uniqu ID  NOT NULL,
  PRIMARY KEY (answer ID)
);

CREATE TABLE 개인 결과값
(
  개인 Sum Uniqu ID  NOT NULL,
  개인 Sum           NULL    ,
  answer ID        NOT NULL,
  PRIMARY KEY (개인 Sum Uniqu ID)
);

CREATE TABLE 문항
(
  문항           NOT NULL,
  문항 Uniqu ID  NOT NULL,
  이름 ID        NOT NULL,
  PRIMARY KEY (문항 Uniqu ID)
);

CREATE TABLE 이름
(
  이름 ID  NOT NULL,
  이름     NULL    ,
  PRIMARY KEY (이름 ID)
);

CREATE TABLE 항목 결과값
(
  항목별 Avg           NULL    ,
  항목별Avg Uniqu ID   NOT NULL,
  문항 Uniqu ID       NOT NULL,
  항목별 sum           NULL    ,
  항목별 sum uniqu ID  NOT NULL,
  PRIMARY KEY (항목별Avg Uniqu ID, 항목별 sum uniqu ID)
);

ALTER TABLE 문항
  ADD CONSTRAINT FK_이름_TO_문항
    FOREIGN KEY (이름 ID)
    REFERENCES 이름 (이름 ID);

ALTER TABLE 개인 결과값
  ADD CONSTRAINT FK_Answer_TO_개인 결과값
    FOREIGN KEY (answer ID)
    REFERENCES Answer (answer ID);

ALTER TABLE Answer
  ADD CONSTRAINT FK_문항_TO_Answer
    FOREIGN KEY (문항 Uniqu ID)
    REFERENCES 문항 (문항 Uniqu ID);

ALTER TABLE 항목 결과값
  ADD CONSTRAINT FK_문항_TO_항목 결과값
    FOREIGN KEY (문항 Uniqu ID)
    REFERENCES 문항 (문항 Uniqu ID);
