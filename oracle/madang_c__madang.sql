--��������
select abs(-15) from dual; -- ���밪�� ��ȯ
select ceil(15.7) from dual; -- �ø� ���� ��ȯ
select cos(3.14159) from dual; -- �ڻ��� ���� ���
select floor(15.7) from dual; -- ���� ���� ��ȯ
select log(10,000) from dual; -- ���� ù ��° �μ�, �α׸� ���� ���� �� ��° �μ��� �α� ���� ���
select mod(11,4) from dual; -- ù ��° ���� �� ��° ���� ���� �������� ��ȯ
select power(2,3) from dual; -- ù ��° ���� �� ��° �� ���� ����Ͽ� ����� ������
select sign(-15) from dual; -- ������ ��ȣ�� Ȯ���ϰ� -1, 0,+1 �� �ϳ��� ������
select trunc(15.7) from dual;--
select chr(67) from dual;--�־��� ASCII �ڵ忡 �ش��ϴ� ���ڸ� ���
select concat('HAPPY','Birthday') from dual;--�� ���ڿ��� �����Ͽ� 'HAPPYBirthday'��� ����� ����
select lower('Birthday') from dual;--��� �빮�� ���ڿ��� �ҹ��ڷ� ��ȯ
select lpad('page 1',15, '*.') from dual;--���ʿ������� �����Ͽ� ���ڿ� ���̰� ������ ���̿� ������ ������ ������ �������� ä��
select ltrim('page 1', 'ae') from dual;--
select replace('JACK', 'J', 'BL') from dual;-- jack���� j�� bl�� �ٲ�
select rpad('page 1',15, '*.') from dual;--�����ʿ������� �����Ͽ� ���ڿ� ���̰� ������ ���̿� ������ ������ ������ �������� ä��
select rtrim('page 1', 'ae') from dual;--
select substr('ABCDEFG',3,4) from dual;--���ڿ����� 3��° ��ġ���� Ư�� ����(4���� ���� ��ŭ �κй��ڿ��� ����
select trim(LEADING 0 FROM '00AA00') from dual;--
select upper('Birthday') from dual;--��� �ҹ��ڸ� �빮�ڷ� ��ȯ
select add_months('14/05/21', 1) from dual;--��¥�� ���� �߰�
select last_day(SYSDATE) from dual;--�־��� ��¥�� �����ִ� ���� ������ ���� ��ȯ
select next_day(SYSDATE,'ȭ') from dual;--�־��� ��¥ ������ ���� ������ ��ȯ
select round(SYSDATE) from dual;--
select SYSDATE from dual; -- ���� �ý��� �Ͻø� ��ȯ
select to_char(SYSDATE) from dual; -- ���� �ý��� �Ͻø� ���ڿ��� ��ȯ�Ͽ� ��ȯ
select to_char(123) from dual; -- ���� ���� ���ڿ��� ��ȯ�Ͽ� ��ȯ
select to_date('12 05 2014', 'DD MM YYYY') from dual; -- �־��� ���˿� ���� ���ڿ��� �Ͻ� ������ ��ȯ�Ͽ� ��ȯ
select to_number('12.3') from dual; -- ���������� ���ڿ� ���� ���ڷ� ��ȯ�Ͽ� ��ȯ
select decode(1,1,'aa','bb') from dual; -- 
select nullif(123, 345) from dual; -- ù ��° �μ��� �� ��° �μ��� ������ NULL�� ��ȯ�ϰ�, �׷��� ������ ù ��° �μ��� ��ȯ
select nvl(null, 123) from dual; -- ù ��° �μ��� NULL�̸� �� ��° �μ��� ��ȯ�ϰ�, �׷��� ������ ù ��° �μ��� ��ȯ


insert into customer
 VALUES(5, '�ڼ���', '���ϱ�', 000-000-000);
 
 --���� �̸��� ��ȭ��ȣ�� ����Ͻÿ�(�� ��ȭ��ȣ�� ���� ���� ����ó���� ���� ���)
select name �̸�, phone ��ȭ��ȣ from customer; 
select name �̸�, nvl(phone,'����ó����') ��ȭ��ȣ from customer;

--����Ͽ��� ����, ����ȣ, �̸�, ��ȭ��ȣ�� ���� �θ� ����Ͻÿ�
select rownum ����, custid, name, phone from customer;
select rownum ����, custid, name, phone from customer
where rownum<=2;

--mybook ���̸� ����
create table mybook(
    bookid number not null primary key,
    price number
);

--������ �� ����
insert into mybook values(1, 10000);
insert into mybook values(2, 20000);
insert into mybook(bookid) values(3);

--��������
select * from mybook; -- mybook���̺� ��ȸ
select bookid, nvl(price,0) from mybook; --price ���� ���� NULL�� ��� 0���� ��ü
select * from mybook where price is null; -- ������ �ΰ��� ���� ��ȸ
select * from mybook where price=''; --
select bookid, price+100 from mybook;--�Ͼ��̵�� ������ ��ȸ�ϰ� ���ݿ� 100�� ���� 
select sum(price), avg(price), count(*) from mybook where bookid >= 4; --�Ͼ��̵� 4���� ũ�ų� ���� ���� ��ȸ
select count(*), count(price) from mybook; --��ü ���� ���ϱ�
select sum(price), avg(price) from mybook;-- ������ ���հ� ���

--��������
select * from book; 
select * from book where rownum <= 5; -- 5���� �۰ų� ���� ��ȣ�� ��ȸ
select * from book where rownum <= 5 order by price; -- book ���̺��� ���� ���� ��ȸ�� 5���� ���� ��ȯ�Ϸ��� ������, ����� price �������� ����
select * from (select * from book order by price)b where rownum <= 5; --price �������� ������ ��, �� ������� ���� ù ��°���� �ټ� ��°���� ����
select * from (select * from book where rownum <= 5)b order by price; --���� ���� ��ȸ�� 5���� �����͸� ������ ��, �� ����� 'price' �������� ����
select * from (select * from book where rownum <= 5 order by price)b;--book ���̺��� �������� ������� ó������ �ټ� �� �����͸� ������

--����Ǹűݾ� ������ �ֹ��� ���� �ֹ���ȣ�ͱݾ��� ����Ͻÿ�
select orderid �ֹ���ȣ, saleprice �Ǹűݾ� from orders;
select avg(saleprice) from orders ;

select orderid �ֹ���ȣ, saleprice �Ǹűݾ� from orders
where saleprice<=(select avg(saleprice) from orders) ;

--�� ���� ����Ǹűݾ׺��� ū �ݾ��� �ֹ� ������ ���ؼ��� �ֹ���ȣ, ����ȣ, �Ǹűݳ��� ����Ͻÿ�
select orderid �ֹ���ȣ,  custid ����ȣ, saleprice �Ǹűݾ� from orders mo
where saleprice > (select avg(saleprice) from orders so where mo.custid = so.custid);

--���￡ �����ϴ� ������ �Ǹ��� ������ ���Ǹűݾ��� ����Ͻÿ�
select sum(saleprice) ���Ǹűݾ� from orders;

-- ���￡ �����ϴ� ����� ����ȣ
select custid from customer where address like '%����%';

select sum(saleprice) ���Ǹűݾ� from orders
where custid in(select custid from customer where address like '%����%');

--���￡ �������� �ʴ� ������ �Ǹ��� ������ ���Ǹűݾ��� ����Ͻÿ�
select sum(saleprice) ���Ǹűݾ� from orders
where custid not in(select custid from customer where address like '%����%');

--3�� ���� �ֹ��� ������ �ְ� �ݾ׺��� �� ��� ������ ������ �ֹ��� �ֹ� ��ȣ�� �ݾ��� ����Ͻÿ�
select orderid �ֹ���ȣ, saleprice �Ǹűݾ� from orders;
select saleprice from orders where custid=3;

select orderid �ֹ���ȣ, saleprice �Ǹűݾ� from orders
where saleprice> all(select saleprice from orders where custid=3);

-- ���￡ �����ϴ� ������ �Ǹ��� ������ ���Ǹž��� ���Ͻÿ�(�� exist ������ ���)
select sum(saleprice) ���Ǹž� from orders mo
where exists(select * from customer c where address like '%����%' and mo.custid=c.custid);

-- ���� �Ǹűݾ��� �հ踦����Ͻÿ�(����ȣ, �Ǹ��հ�)
select custid ����ȣ, sum(saleprice) �Ǹ��հ� from orders
group by custid;

-- ���� �Ǹűݾ��� �հ踦����Ͻÿ�(����, �Ǹ��հ�)
select (select name from customer c where c.custid=o.custid) ����, sum(saleprice) �Ǹ��հ� from orders o
group by o.custid;
