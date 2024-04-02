--연습문제
select abs(-15) from dual; -- 절대값을 반환
select ceil(15.7) from dual; -- 올림 값을 반환
select cos(3.14159) from dual; -- 코사인 값을 계산
select floor(15.7) from dual; -- 내림 값을 반환
select log(10,000) from dual; -- 밑이 첫 번째 인수, 로그를 취할 값이 두 번째 인수인 로그 값을 계산
select mod(11,4) from dual; -- 첫 번째 수를 두 번째 수로 나눈 나머지를 반환
select power(2,3) from dual; -- 첫 번째 수의 두 번째 수 승을 계산하여 결과를 돌려줌
select sign(-15) from dual; -- 숫자의 부호를 확인하고 -1, 0,+1 중 하나를 돌려줌
select trunc(15.7) from dual;--
select chr(67) from dual;--주어진 ASCII 코드에 해당하는 문자를 출력
select concat('HAPPY','Birthday') from dual;--두 문자열을 연결하여 'HAPPYBirthday'라는 결과를 생성
select lower('Birthday') from dual;--모든 대문자 문자열을 소문자로 변환
select lpad('page 1',15, '*.') from dual;--왼쪽에서부터 시작하여 문자열 길이가 지정한 길이와 같아질 때까지 지정한 패턴으로 채움
select ltrim('page 1', 'ae') from dual;--
select replace('JACK', 'J', 'BL') from dual;-- jack에서 j를 bl로 바꿈
select rpad('page 1',15, '*.') from dual;--오른쪽에서부터 시작하여 문자열 길이가 지정한 길이와 같아질 때까지 지정한 패턴으로 채움
select rtrim('page 1', 'ae') from dual;--
select substr('ABCDEFG',3,4) from dual;--문자열에서 3번째 위치부터 특정 길이(4개의 문자 만큼 부분문자열을 추출
select trim(LEADING 0 FROM '00AA00') from dual;--
select upper('Birthday') from dual;--모든 소문자를 대문자로 변환
select add_months('14/05/21', 1) from dual;--날짜에 월을 추가
select last_day(SYSDATE) from dual;--주어진 날짜가 속해있는 달의 마지막 날을 반환
select next_day(SYSDATE,'화') from dual;--주어진 날짜 다음에 오는 요일을 반환
select round(SYSDATE) from dual;--
select SYSDATE from dual; -- 현재 시스템 일시를 반환
select to_char(SYSDATE) from dual; -- 현재 시스템 일시를 문자열로 변환하여 반환
select to_char(123) from dual; -- 숫자 값을 문자열로 변환하여 반환
select to_date('12 05 2014', 'DD MM YYYY') from dual; -- 주어진 포맷에 따라 문자열을 일시 값으로 변환하여 반환
select to_number('12.3') from dual; -- 숫자형태의 문자열 값을 숫자로 변환하여 반환
select decode(1,1,'aa','bb') from dual; -- 
select nullif(123, 345) from dual; -- 첫 번째 인수가 두 번째 인수와 같으면 NULL을 반환하고, 그렇지 않으면 첫 번째 인수를 반환
select nvl(null, 123) from dual; -- 첫 번째 인수가 NULL이면 두 번째 인수를 반환하고, 그렇지 않으면 첫 번째 인수를 반환


insert into customer
 VALUES(5, '박세리', '성북구', 000-000-000);
 
 --고객의 이름과 전화번호를 출력하시오(단 전화번호가 없는 고객은 연락처없음 으로 출력)
select name 이름, phone 전화번호 from customer; 
select name 이름, nvl(phone,'연락처없음') 전화번호 from customer;

--고객목록에서 순번, 고객번호, 이름, 전화번호를 앞의 두명만 출력하시오
select rownum 순번, custid, name, phone from customer;
select rownum 순번, custid, name, phone from customer
where rownum<=2;

--mybook 테이르 생성
create table mybook(
    bookid number not null primary key,
    price number
);

--데이터 행 삽입
insert into mybook values(1, 10000);
insert into mybook values(2, 20000);
insert into mybook(bookid) values(3);

--연습문제
select * from mybook; -- mybook테이블 조회
select bookid, nvl(price,0) from mybook; --price 열의 값이 NULL일 경우 0으로 대체
select * from mybook where price is null; -- 가격이 널값인 것을 조회
select * from mybook where price=''; --
select bookid, price+100 from mybook;--북아이디와 가격을 조회하고 가격에 100을 더함 
select sum(price), avg(price), count(*) from mybook where bookid >= 4; --북아이디가 4보다 크거나 같은 것을 조회
select count(*), count(price) from mybook; --전체 개수 구하기
select sum(price), avg(price) from mybook;-- 가격의 총합과 평균

--연습문제
select * from book; 
select * from book where rownum <= 5; -- 5보다 작거나 같은 번호를 조회
select * from book where rownum <= 5 order by price; -- book 테이블에서 가장 먼저 조회된 5개의 행을 반환하려고 하지만, 결과를 price 기준으로 정렬
select * from (select * from book order by price)b where rownum <= 5; --price 기준으로 정렬한 후, 그 결과에서 가장 첫 번째부터 다섯 번째까지 정렬
select * from (select * from book where rownum <= 5)b order by price; --가장 먼저 조회된 5개의 데이터를 가져온 후, 그 결과를 'price' 기준으로 정렬
select * from (select * from book where rownum <= 5 order by price)b;--book 테이블에서 임의적인 순서대로 처음부터 다섯 개 데이터를 가져옴

--평균판매금액 이하의 주문에 대해 주문번호와금액을 출력하시오
select orderid 주문번호, saleprice 판매금액 from orders;
select avg(saleprice) from orders ;

select orderid 주문번호, saleprice 판매금액 from orders
where saleprice<=(select avg(saleprice) from orders) ;

--각 고객이 평균판매금액보다 큰 금액의 주문 내역에 대해서만 주문번호, 고객번호, 판매금낵을 출력하시오
select orderid 주문번호,  custid 고객번호, saleprice 판매금액 from orders mo
where saleprice > (select avg(saleprice) from orders so where mo.custid = so.custid);

--서울에 거주하는 고객에게 판매한 도서의 총판매금액을 출력하시오
select sum(saleprice) 총판매금액 from orders;

-- 서울에 거주하는 사람의 고객번호
select custid from customer where address like '%서울%';

select sum(saleprice) 총판매금액 from orders
where custid in(select custid from customer where address like '%서울%');

--서울에 거주하지 않는 고객에게 판매한 도서의 총판매금액을 출력하시오
select sum(saleprice) 총판매금액 from orders
where custid not in(select custid from customer where address like '%서울%');

--3번 고객이 주문한 도서의 최고 금액보다 더 비싼 도서를 구입한 주문의 주문 번호와 금액을 출력하시오
select orderid 주문번호, saleprice 판매금액 from orders;
select saleprice from orders where custid=3;

select orderid 주문번호, saleprice 판매금액 from orders
where saleprice> all(select saleprice from orders where custid=3);

-- 서울에 거주하는 고객에게 판매한 도서의 총판매액을 구하시오(단 exist 연산자 사용)
select sum(saleprice) 총판매액 from orders mo
where exists(select * from customer c where address like '%서울%' and mo.custid=c.custid);

-- 고객별 판매금액의 합계를출력하시오(고객번호, 판매합계)
select custid 고객번호, sum(saleprice) 판매합계 from orders
group by custid;

-- 고객별 판매금액의 합계를출력하시오(고객명, 판매합계)
select (select name from customer c where c.custid=o.custid) 고객명, sum(saleprice) 판매합계 from orders o
group by o.custid;
