-- https://school.programmers.co.kr/learn/courses/30/lessons/59037
-- 젊은 동물1의 아이디와 이름을 조회하는 SQL, 아이디 순으로 조회
SELECT ANIMAL_ID, NAME from ANIMAL_INS
where INTAKE_CONDITION != 'Aged'
order by ANIMAL_ID;