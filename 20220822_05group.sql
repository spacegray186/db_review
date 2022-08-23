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
update sungjuk set tot=kor+eng+mat, aver=(kor+eng+mat)/3;

select * from sungjuk;

--��4) ���(aver)�� 80���̻� ���� ������� �ּҺ� �ο����� �ο��� ������ ��ȸ�Ͻÿ�
select addr, count(*)
from sungjuk
where aver>=80
group by addr
order by count(*);

-- Ǯ��
select addr, aver
from sungjuk
where aver>=80
order by aver desc;

select addr, count(*)   -- 4)
from sungjuk            -- 1) �ؼ�����
where aver>=80          -- 2)
group by addr           -- 3)
order by count(*);      -- 5)

/////////////////////////////////////////////////////////////////////////////

�� [2�� �׷�]

-- �ּҺ� ������ ��ȸ�Ͻÿ�
select addr, kor, eng, mat from sungjuk order by addr, kor;

-- �ּҺ�(1��) �׷��� �ϰ�, �ּҰ� ���ٸ� ��������(2��)�� �׷�ȭ �ϱ�
select addr, kor
from sungjuk
group by addr, kor
order by addr;

select addr, kor, count(*)
from sungjuk
group by addr, kor
order by addr;

-- 1�� �׷�(kor), 2�� �׷�(eng), 3�� �׷�(mat)
select kor, eng, mat, count(*)
from sungjuk
group by kor, eng, mat
order by kor, eng, mat;
/////////////////////////////////////////////////////////////////////////////

�� [having ������]
- group by �� ���� ����ϴ� ������
- �׷�ȭ�� �ϰ� �� �Ŀ� �������� �߰�
- ����) having ������

-- �ּҺ� �ο����� ��ȸ�Ͻÿ�
select addr, count(*)
from sungjuk
group by addr;

-- �ּҺ� �ο����� 3�� ���� ��ȸ�Ͻÿ�
select addr, count(*)
from sungjuk
group by addr
having count(*)=3;

-- �ּҺ� �ο����� 3�̻��� ���� ��ȸ�Ͻÿ�
select addr, count(*)
from sungjuk
group by addr
having count(*)>=3;


--��5) �ּҺ� ���� ��հ��� 50�̻� ���� ��ȸ�Ͻÿ�
--    (��, ��հ��� �Ҽ������� �ݿø�)

1) �ּҺ� ������հ� ���ϱ�
select addr, avg(kor)
from sungjuk
group by addr;

2) ������հ��� �Ҽ������� �ݿø��ϱ�
select addr, round(avg(kor),0)
from sungjuk
group by addr;

3) 2)�� ������� ������հ��� 50�̻� ��ȸ�ϱ�
select addr, round(avg(kor),0)
from sungjuk
group by addr
having round(avg(kor),0)>=50;

4) 3)�� ������� ������հ��� ������������ ��ȸ�ϱ�
select addr, round(avg(kor),0)
from sungjuk
group by addr
having round(avg(kor),0)>=50
order by round(avg(kor),0) desc;

5) 4)�� ������� ������հ� Į������ avg_kor�� �����ϱ�
select addr, round(avg(kor),0) as avg_kor
from sungjuk
group by addr
having round(avg(kor),0)>=50
order by round(avg(kor),0) desc;


--��6) ���(aver)�� 70�̻� ���� ������� �ּҺ� �ο����� ���� ��
--     �� �ο����� 2�̸� ���� �ο��� ������ ��ȸ�Ͻÿ�

1) ��ü �� ��ȸ
select * from sungjuk;

2) ���(aver)���� 70�̻� �� ��ȸ
select *
from sungjuk
where aver>=70;

3) 2)�� ������� �ּҺ� �ο����� ���Ͻÿ�
select addr, count(*)
from sungjuk
where aver>=70
group by addr;

4) 3)�� ������� �� �ο����� 2�̸� �� ��ȸ
select addr, count(*)
from sungjuk
where aver>=70
group by addr
having count(*)<2;

5) 4)�� ����� �ο��� ������ ��ȸ
select addr, count(*) as cnt
from sungjuk
where aver>=70
group by addr
having count(*)<2
order by cnt;       -- order by count(*) �ᵵ ��
///////////////////////////////////////////////////////////////////////

�� [CASE WHEN - THEN END ����]
����)
     CASE WHEN ����1 THEN ���Ǹ����� ��1
          WHEN ����2 THEN ���Ǹ����� ��2
          WHEN ����3 THEN ���Ǹ����� ��3
             ...
          ELSE ��
     END ����÷���


-- �̸�, �ּҸ� ��ȸ�Ͻÿ�
select uname, addr from sungjuk;

-- �̸�, �ּҸ� ��ȸ�Ͻÿ� (��, �ּҴ� �ѱ۷� �ٲ㼭 ��ȸ)
select uname, addr, case when addr='Seoul' then '����'
                        when addr='Jeju' then '����'
                        when addr='Busan' then '�λ�'
                        when addr='Suwon' then '����'
                    end as juso
from sungjuk;


--��7)�̸�, ����, ������ ��ȸ�Ͻÿ�
      ���� : �������� 90�̻� 'A����'
                    80�̻� 'B����'
                    70�̻� 'C����'
                    60�̻� 'D����'
                    ������ 'F����'
                    
1)
select uname, kor, case when kor>=90 then 'A����'
                        when kor>=80 then 'B����'
                        when kor>=70 then 'C����'
                        when kor>=60 then 'D����'
                        else 'F����'
                    end as grade
from sungjuk;

2) Į���� �ѱ� ����
select uname, kor, case when kor>=90 then 'A����'
                        when kor>=80 then 'B����'
                        when kor>=70 then 'C����'
                        when kor>=60 then 'D����'
                        else 'F����'
                    end as ��������
from sungjuk;

3) between ~ and ������
select uname, kor, case when kor between 90 and 100 then 'A����'
                        when kor between 80 and 89 then 'B����'
                        when kor between 70 and 79 then 'C����'
                        when kor between 60 and 69 then 'D����'
                        else 'F����'
                    end as ��������     
from sungjuk;

4) �������� ������ �����ϱ�
select uname, kor, case when kor between 90 and 100 then 'A����'
                        when kor between 80 and 89 then 'B����'
                        when kor between 70 and 79 then 'C����'
                        when kor between 60 and 69 then 'D����'
                        else 'F����'
                    end as ��������     
from sungjuk
order by ��������;
