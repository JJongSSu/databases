
CREATE TABLE city_me
(
  ID          INT          NOT NULL COMMENT '아이디',
  Name        VARCHAR(200) NULL     COMMENT '도시명',
  District    VARCHAR(200) NULL     COMMENT '구역',
  Population  INT          NULL     COMMENT '도시인구',
  CountryCode VARCHAR(200) NOT NULL COMMENT '코드',
  PRIMARY KEY (ID)
) COMMENT '도시';

CREATE TABLE country_me
(
  Code           VARCHAR(200) NOT NULL COMMENT '코드',
  Name           VARCHAR(200) NULL     COMMENT '나라명',
  Continent      ENUM         NULL     COMMENT '대륙',
  Region         VARCHAR(200) NULL     COMMENT '지역',
  SurfaceArea    DECIMAL      NULL     COMMENT '면적',
  IndepYear      SMALLINT     NULL     COMMENT '독립연도',
  Population     INT          NULL     COMMENT '나라인구',
  LifeExpectancy DECIMAL      NULL     COMMENT '기대수명',
  GNP            DECIMAL      NULL     COMMENT '국민총생산',
  GNPOld         DECIMAL      NULL     COMMENT '과거 국민총생산',
  LocalName      VARCHAR(200) NULL     COMMENT '지역이름',
  GovernmentForm VARCHAR(200) NULL     COMMENT '정부',
  HeadOfState    VARCHAR(200) NULL     COMMENT '대통령',
  Capital        INT          NULL     COMMENT '수도',
  Code2          VARCHAR(200) NULL     COMMENT '코드2',
  PRIMARY KEY (Code)
) COMMENT '나라';

CREATE TABLE countrylanguage_me
(
  Language    VARCHAR(200) NOT NULL COMMENT '언어',
  IsOfficial  ENUM         NULL     COMMENT '대표언어',
  Percentage  DECIMAL      NULL     COMMENT '문맹률',
  CountryCode VARCHAR(200) NOT NULL COMMENT '코드',
  PRIMARY KEY (Language)
) COMMENT '나라별 언어';

ALTER TABLE city_me
  ADD CONSTRAINT FK_country_me_TO_city_me
    FOREIGN KEY (CountryCode)
    REFERENCES country_me (Code);

ALTER TABLE countrylanguage_me
  ADD CONSTRAINT FK_country_me_TO_countrylanguage_me
    FOREIGN KEY (CountryCode)
    REFERENCES country_me (Code);
