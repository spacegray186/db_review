�� [������ �׷�ȭ]


-- sungjuk_seq ������ ����
drop sequence sungjuk_seq;

-- sungjuk ���̺��� ����� ������ ����
create sequence sungjuk_seq;

-- sungjuk ���̺� ����
drop table sungjuk;

-- sungjuk ���̺� ����
create table sungjuk (
    sno    int          primary key                  
   ,uname  varchar(50)  not null                         
   ,kor    int          check(kor between 0 and 100)                    
   ,eng    int          check(eng between 0 and 100)                    
   ,mat    int          check(mat between 0 and 100)
,addr   varchar(20)  check(addr in('Seoul','Jeju','Busan','Suwon'))
   ,tot    int          default 0
   ,aver   int          default 0
   ,wdate  date         default sysdate              
);

-- sungjuk ���̺� �Է� ������
�� ���� i:\java202207\database\2022_03�������̺�.sql

commit;
select count(*) from sungjuk;   -- ��ü ���ڵ� ����
select * from sungjuk;

////////////////////////////////////////////////////////////////////////


�� [distinct]
- Į���� �ߺ� ������ ������ ��ǥ�� 1���� ���
- ����) distinct Į����

select addr from sungjuk;
select addr from sungjuk order by addr;         -- asc ��������
select addr from sungjuk order by addr asc;     -- ��������
select addr from sungjuk order by addr desc;    -- ��������

select distinct(addr) from sungjuk;
select distinct(uname) from sungjuk;

///////////////////////////////////////////////////////////////////////

�� [group by]
- Į���� ���� ���볢�� �׷�ȭ ��Ŵ
- ����) group by Į��1, Į��2, Į��3, ~~~

-- �ּҰ� ������ ���� �׷�ȭ��Ű�� �ּҸ� ��ȸ
select addr
from sungjuk
group by addr;  -- distinct�� ����� ����

-- ORA-00979: GROUP BY ǥ������ �ƴմϴ�. 00979. 00000 -  "not a GROUP BY expression"
select addr, uname      -- �׷��Ű�� ���� �� �ִ� ���� 1���� ������ ���� ��ȸ
from sungjuk
group by addr;          -- ����


select addr from sungjuk order by addr;

-- ��1) �ּҺ� �ο����� ��ȸ�Ͻÿ�
select addr, count(*)
from sungjuk
group by addr;

select addr, count(*) as cnt    -- Į���� �ӽ� �ο�
from sungjuk
group by addr;

select addr, count(*) cnt       -- as ��������
from sungjuk
group by addr;


-- �ּҺ� �������� �����ؼ� ��ȸ
select addr
from sungjuk
group by addr
order by addr;

-- �ּҺ� �ο����� ������������ �����ؼ� ��ȸ
select addr, count(*)
from sungjuk
group by addr
order by count(*) desc;

select addr, count(*) as cnt    -- �ؼ����� 3)
from sungjuk                    -- �ؼ����� 1)
group by addr                   -- �ؼ����� 2)
order by cnt desc;              -- �ؼ����� 4)
////////////////////////////////////////////////////////////////////


�� [�����Լ�]

-- ��2) �ּҺ� ���������� ���ؼ� �����Ͻÿ�
select addr, count(*), max(kor), min(kor), sum(kor), avg(kor)     -- ����, �ִ밪, �ּҰ�, �հ�, ���
from sungjuk
group by addr;

-- �ּ� ������ ����
select addr, count(*), max(kor), min(kor), sum(kor), avg(kor)
from sungjuk
group by addr
order by addr;

-- round(��, 0) �Ҽ��� ���� ������ �ݿø��ϰ� �Ҽ����� ����
select addr, count(*), max(kor), min(kor), sum(kor), round(avg(kor), 0)
from sungjuk
group by addr
order by addr;

-- ��������� �Ҽ��� ���� �ݿø��ϰ� �������� �����ؼ� ��ȸ
select addr, count(*), max(kor), min(kor), sum(kor), round(avg(kor), 0)
from sungjuk
group by addr
order by round(avg(kor), 0) desc;

-- Į���� �ο�
select addr
    ,count(*) as cnt
    ,max(kor) as max_kor
    ,min(kor) as min_kor
    ,sum(kor) as sum_kor
    ,round(avg(kor), 0) as avg_kor
from sungjuk
group by addr
order by round(avg(kor), 0) desc;


--��3) ����(tot), ���(aver) ���Ͻÿ�
update sungjuk
set tot=kor+eng+mat, aver=(kor+eng+mat)/3;

select * from sungjuk;

--��4) ���(aver)�� 80���̻� ���� ������� �ּҺ� �ο����� �ο��� ������ ��ȸ�Ͻÿ�
select addr, count(*)
from sungjuk
where aver>=80
group by addr
order by count(*);
