
i:\java202207\database\20220824_01emp���̺���.sql
////////////////////////////////////////////////////////////////////////////////


��1) emp ������̺��� �����Ͻÿ�
create table emp(
  empno       number(4)     primary key --���(-9999~9999)
  ,ename      varchar2(50)              --�̸�
  ,job        varchar2(10)              --����
  ,mgr        number(4)                 --�Ŵ�������
  ,hiredate   date                      --�Ի���
  ,sal        number(7,2)               --�޿�(�Ҽ��� 2�ڸ�)
  ,comm       number(7,2)               --Ŀ�̼�(���ʽ�)
  ,deptno     number(2)                 --�μ��ڵ�(-99~99)
);


��2) emp������̺� ���� �߰��Ͻÿ�
insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7369, '������', '���', 7902, '2000-12-17', 200, 20);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7499, '���޷�', '����', 7698, '2001-12-15', 360, 20);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7521, '���϶�', '����', 7698, '2001-02-17', 355, 30);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7654, '�����', '���', 7839, '2002-01-11', 400, 30);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7698, '������', '����', 7698, '2000-07-12', 325, 20);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7782, '�迬��', '����', 7698, '2001-12-17', 225, 10);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7778, '����ȭ', '���', 7839, '2005-11-14', 200, 10);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7839, 'ȫ�浿', '����', 7566, '2006-06-17', 450, 20);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7844, '�۰�ȣ', '����', 7566, '2018-09-17', 400, 30);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7876, '���켺', '���', 7839, '2004-09-09', 500, 30);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7900, '������', '��ǥ', 7902, '2001-12-03', 200, 20);
////////////////////////////////////////////////////////////////////////////////


��3) ��ü ���� ������ ��ȸ�Ͻÿ�
select count(*) from emp;

��4) ���̺��� Į��(�ʵ�) ����� Ȯ���Ͻÿ�
select * from emp;
select empno, ename, job, mgr, hiredate, sal, comm, deptno from emp;

��5) ����̸���(��������) �����Ͻÿ�
select *
from emp
order by ename;     -- asc ��������

��6) ����̸���(��������) �����Ͻÿ�
select *
from emp
order by ename desc;

��7) �޿� ������������ ����̸�(ename), �޿�(sal), �μ��ڵ�(deptno)�� ��ȸ�Ͻÿ�
select ename, sal, deptno
from emp
order by sal desc;

��8) �μ��ڵ� ��������, �޿� ������������
     ����̸�(ename), �޿�(sal), �μ��ڵ�(deptno)�� ��ȸ�Ͻÿ�
select ename, sal, deptno
from emp
order by deptno, sal desc;

��9) �̸�(ename)/�Ի�����(hiredate)/�μ��ڵ�(deptno)��
      �μ��ڵ� ��������, �Ի�����(hiredate) ������������ ��ȸ�Ͻÿ�
select ename, hiredate, deptno
from emp
order by deptno, hiredate;

��10) ����(job) Į���� �ߺ������͸� �ϳ����� ��ȸ�Ͻÿ�
select job from emp;
select distinct(job) from emp;
select job from emp group by job;

��11) emp���̺��� job ��������, sal ������������ �����ؼ�
      ename �̸�, job ����, sal �޿� Į�������� ��Ī�� �ٲ㼭 ��ȸ�Ͻÿ�
select ename as �̸�, job as ����, sal as �޿�    -- as ��������
from emp
order by job, sal desc;


��12) �޿��� 100���� ���� 400���� ���� ���� ��ȸ�ϱ�(�޿� ��������)
select ename, sal
from emp
where sal>=100 and sal<=400
order by sal desc;

select ename, sal
from emp
where sal between 100 and 400
order by sal desc;

��13) �޿��� 100���� �Ǵ� 400 �̻��� ���� �˻��ϱ�(�޿� ��������)
select ename, sal
from emp
where sal<=100 or sal>=400
order by sal desc;

��14) ����(job)�� ���� �Ǵ� ������ �������� �̸������� ��ȸ�Ͻÿ�
select job, ename
from emp
where job='����' or job='����'
order by ename;

select job, ename
from emp
where job in ('����', '����')
order by ename;

��15) �μ��ڵ�(deptno)�� 30�� ������ ��ȸ�Ͻÿ�
select deptno, ename from emp where deptno=30;
select deptno, ename from emp where deptno in (30);

��16) �ߺ��� �μ��ڵ带 �� ������ ��ȸ�Ͻÿ�
select distinct(deptno) from emp;
select deptno from emp group by deptno;

��17) �μ��ڵ尡 10 �Ǵ� 20 �Ǵ� 30�� ������ ��ȸ�Ͻÿ�
      (or, in������ ���� Ȱ���ؼ� ��ȸ)
select deptno, ename from emp where deptno=10 or deptno=20 or deptno=30;
select ename, deptno from emp where deptno in (10, 20, 30);

��18) �޿��� 300~500�� ������ �޿������� ��ȸ�Ͻÿ�
      (and, between������ ���� Ȱ���ؼ� ��ȸ)
select ename, sal from emp where sal>=300 and sal<=500 order by sal;
select ename, sal from emp where sal between 300 and 500 order by sal;

��19) �̸��� ����ȭ ��ȸ�Ͻÿ�
select ename from emp where ename='����ȭ';

��20) �达���� ��ȸ�Ͻÿ�
select ename from emp where ename like '��%';

��21) �̸��� 'ȭ' ���Ե� ���� ��ȸ�Ͻÿ�
select ename from emp where ename like '%ȭ%';

��22) �μ��ڵ尡 20�� �࿡ ���ؼ� �޿��� 1%�� Ŀ�̼����� å���Ͻÿ�
select ename, sal, deptno, comm from emp where deptno=20;

update emp
set comm=sal*0.01
where deptno=20;

-- Ǯ��

select deptno, sal, comm from emp;

update emp set comm=sal*0.01 where deptno=20;

��23) ������ �Ʒ��� ���� ������ �̸�, �μ�, �޿�, Ŀ�̼�, ������ ��ȸ�Ͻÿ�
      �������ϴ� �� : �޿�(sal)*12����+���ʽ�(comm)
select ename, deptno, sal, comm, ����
from emp;

alter table emp add ���� number(7,2);

update emp set ����=(sal*12)+comm;

-- Ǯ��

select ename, deptno, sal, sal*12+comm as ����
from emp;

��24) Ŀ�̼��� null�̸� 0���� �ٲ� �� ������ �ٽ� ����ؼ�
      �̸�, �޿�, Ŀ�̼�, ������ ��ȸ�Ͻÿ�
select ename, sal, nvl(comm, 0), ����
from emp;

alter table emp add ���� number(7,2);

update emp set ����=(sal*12)+nvl(comm, 0);

-- Ǯ��

-- comm�� null���� ���� ��ȸ
select ename, comm from emp where comm is null;

-- commĮ���� null���� 0���� �ٲٱ�
select ename, nvl(comm, 0)
from emp
where comm is null;

-- commĮ���� null���� 0���� �ٲ� ��, ���� ����ϱ�
select ename, deptno, sal, sal*12+nvl(comm, 0) as ����
from emp;

-- ������ �ݿø��ؼ� �Ҽ��� ���� ��ȸ�Ͻÿ�
select ename, deptno, sal, round(sal*12+nvl(comm, 0), 0) as ����
from emp;

��25) �� ����� �޿��� �˻��ؼ� '���������� �޿��� ���Դϴ�'�� ��ȸ�Ͻÿ�
      (|| ���տ�����)
select ename || '�� �޿��� ' || sal || '���� �Դϴ�' from emp;
select ename || '�� �޿��� ' || sal || '���� �Դϴ�' as pay from emp;

-- ������ �켱����
() ��ȣ : ������ �켱�������� �켱��
1���� : �񱳿�����, SQL������, ���������
2���� : not
3���� : and
4���� : or
5���� : ���տ�����   

��26) emp���̺��� �Ի���(hiredate)�� 2005�� 1�� 1�� ������ ����� ����
      ����� �̸�(ename), �Ի���, �μ���ȣ(deptno)�� �Ի��ϼ����� ��ȸ�Ͻÿ�
select ename, hiredate, deptno
from emp
where hiredate<to_date('2005-01-01')
order by hiredate;

-- Ǯ��
select ename, hiredate, deptno
from emp
where hiredate<'2005-01-01'
order by hiredate;

��27) emp���̺��� �μ���ȣ�� 20���̳� 30���� �μ��� ����
     ����鿡 ���Ͽ� �̸�, �����ڵ�(job), �μ���ȣ�� �̸������� ��ȸ�Ͻÿ�
     (or, in������ ���� Ȱ���ؼ� ��� ��ȸ)
select ename, job, deptno
from emp
where deptno=20 or deptno=30
order by ename;

select ename, job, deptno
from emp
where deptno in (20, 30)
order by ename;

��28) ���, �̸�, �μ��� ��ȸ�Ͻÿ�
      (��, �μ��ڵ尡 10�̸� ������
                    20�̸� ������
                    30�̸� �����η� �ٲ㼭 ���)
select empno, ename, deptno,
    case when deptno=10 then '������'
        when deptno=20 then '������'
        when deptno=30 then '������'
    end 
from emp;

-- Ǯ��

select empno, ename, deptno, case when deptno=10 then '������'
                                  when deptno=20 then '������'
                                  when deptno=30 then '������'
                             end as deptname
from emp;

��29) ������ SQL���� �м��Ͻÿ�
      select empno, sal 
      from emp
      where not(sal>200 and sal<300)    -- not(201~299) �޿��� 201~299�� �ƴ� �� ��ȸ
      order by sal;
�� �� �޿��� 200�ʰ� 300�̸��� �ƴ� ������� ����� �޿��� �޿������� ��ȸ�Ͻÿ�

��30) ������ SQL���� �м��Ͻÿ�
      select empno, sal 
      from emp
      where not sal>200 and sal<300     -- 200�����̸鼭 300�̸��� �� ��ȸ
      order by sal;
�� �� �޿��� 200�� �ʰ����� �ʰ� 300�̸��� ����� ����� �޿��� �޿������� ��ȸ�Ͻÿ�

//////////////////////////////////////////////////////////////////////////////////////////////////////

[emp���̺� ���� ��������]

select deptno, sal from emp order by deptno;

��31) �μ��ڵ庰 �޿��հ踦 ���Ͻÿ�
select deptno, sum(sal)
from emp
group by deptno;

select deptno, sum(sal)
from emp
group by deptno
order by deptno;


��32) �μ��ڵ庰 �޿��հ踦 ���ؼ�  �� �հ谪�� 1500�̻� ��ȸ�Ͻÿ�
select deptno, sum(sal)     -- ������� 4)
from emp                    -- ������� 1)
group by deptno             -- ������� 2)
having sum(sal)>=1500;      -- ������� 3)


��33) �μ��� �޿������ 300�̻� ��ȸ�Ͻÿ� (��ü ���� �������)
select deptno, avg(sal)
from emp
group by deptno;

select deptno, avg(sal)
from emp
group by deptno
having avg(sal)>=300;


��34) �޿��� 300�̻� ������ �߿��� �μ��ڵ庰 �޿������ ���ؼ� �޿���ռ����� ��ȸ�Ͻÿ�
select deptno, avg(sal)
from emp
where sal>=300
group by deptno
order by avg(sal);

-- Ǯ��

select * from emp where sal>=300;

select deptno, avg(sal)
from emp
where sal>=300
group by deptno;

select deptno, avg(sal)
from emp
where sal>=300
group by deptno
order by avg(sal);


��35) �޿��� 300�̻� ������ �߿��� �μ��ڵ庰 �޿������ 400�̻��� �޿������� ��ȸ�Ͻÿ�
select deptno, avg(sal)
from emp
where sal>=300
group by deptno
having avg(sal)>=400
order by avg(sal);


��36) hiredateĮ���� ����Ͽ� ������ �Ի��� �ο����� ���Ͻÿ�
-- ��ȯ�Լ� : to_char(������¥, '���ϴ¸��')

-- �Ի��� ��ȸ
select hiredate from emp;

-- �Ի��Ͽ��� �� ��������
select to_char(hiredate, 'mm') from emp;
select to_char(hiredate, 'mm') as �� from emp;

select to_char(hiredate, 'yy') as �Ի翬�� from emp;
select to_char(hiredate, 'dd') as �� from emp;

-- (Ǯ�)
select to_char(hiredate, 'mm') as ��, count(*)
from emp
group by to_char(hiredate, 'mm');


-- �Ի���� �����ؼ� ��ȸ�ϱ�
select to_char(hiredate, 'mm')
from emp
order by to_char(hiredate, 'mm');

-- �Ի������ �׷�ȭ �ϱ�
select to_char(hiredate, 'mm')
from emp
group by to_char(hiredate, 'mm');

-- �Ի������ �׷�ȭ�ϰ�, �ళ�� ���ϱ�(�ο���)
select to_char(hiredate, 'mm'), count(*)
from emp
group by to_char(hiredate, 'mm');

select to_char(hiredate, 'mm') as �Ի��, count(*) as �ο���
from emp
group by to_char(hiredate, 'mm');

-- �ο��� ������ �����ϱ�
select to_char(hiredate, 'mm') as �Ի��, count(*) as �ο���
from emp
group by to_char(hiredate, 'mm')
order by count(*);


��37) �Ŵ����� ����ο����� ��ȸ�Ͻÿ�
select mgr, count(*) from emp group by mgr order by mgr;

-- Ǯ��
select mgr from emp order by mgr;

select mgr, count(*)
from emp
group by mgr;


��38) �����ȣ 7654�� �޿����� ���� ���� ��ȸ�Ͻÿ�
select count(*)
from emp
where (select sal from emp where empno=7654)>sal;

-- Ǯ��
select sal from emp where empno=7654;     -- 400

select empno, ename, sal
from emp
where sal<400;

select empno, ename, sal
from emp
where sal<(select sal from emp where empno=7654);


��39) �μ����� �޿�+Ŀ�̼Ǹ� ��������  �ִ밪, �ּҰ�, ��հ�(�ݿø� �ؼ�)�� �μ������� ��ȸ�Ͻÿ�
select deptno, max(sal+nvl(comm, 0)) max, min(sal+nvl(comm, 0)) min, round(avg(sal+nvl(comm, 0)), 0) avg
from emp
group by deptno
order by deptno;

-- Ǯ��
select deptno, sal, comm from emp order by deptno;
select deptno, sal, comm, sal+comm from emp order by deptno;
select deptno, sal, comm, sal+nvl(comm, 0) from emp order by deptno;

select deptno, max(sal+nvl(comm, 0)), min(sal+nvl(comm, 0)), avg(sal+nvl(comm, 0))
from emp
group by deptno;

select deptno, max(sal+nvl(comm, 0)), min(sal+nvl(comm, 0)), round(avg(sal+nvl(comm, 0)), 1)
from emp
group by deptno;

select deptno, max(sal+nvl(comm, 0)), min(sal+nvl(comm, 0)), round(avg(sal+nvl(comm, 0)), 1)
from emp
group by deptno
order by deptno;

select deptno, max(sal+nvl(comm, 0)) �ִ밪, min(sal+nvl(comm, 0)) �ּҰ�, round(avg(sal+nvl(comm, 0)), 1) ��հ�
from emp
group by deptno
order by deptno;
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

�� [��¥ �������� ����]

��40) �� �����鿡 ���ؼ� ������ �̸��� �ټ� ������ ���Ͻÿ�
      ��, �ټ� ������ �������� �����Ͽ� ��Ÿ���ÿ�

-- �̸�, �Ի����� �Ի��� ������ ��ȸ�Ͻÿ�
select ename, hiredate from emp order by hiredate;

-- �ټ��� : ���糯¥-�Ի���
select ename, hiredate, sysdate-hiredate from emp;

-- (���糯¥-�Ի���)/365
select ename, hiredate, (sysdate-hiredate)/365 from emp;

-- (���糯¥-�Ի���)/365 �� �Ҽ��� ����
select ename, hiredate, trunc((sysdate-hiredate)/365) from emp;

-- (���糯¥-�Ի���)/365 �� �Ҽ��� ���� �� Į���� ����
select ename, hiredate, trunc((sysdate-hiredate)/365) as �ټӿ��� from emp;

-- �ټӿ��� ������ �������� ����
select ename, hiredate, trunc((sysdate-hiredate)/365) as �ټӿ���
from emp
order by �ټӿ��� desc;


��41) �Ʒ��� ���� ��� �Ͻÿ�
      ��) �������� �ټӿ��� : 20��
select ename || '�� �ټӿ��� : ' || trunc((sysdate-hiredate)/365) || '��' as �ټӿ��� from emp;


��42) ������� �ټӿ����� ������ ���� ��ȸ(�̸�, �ټӿ���)�Ͻÿ�
select ename, trunc((sysdate-hiredate)/365) as �ټӿ���
from emp
where trunc((sysdate-hiredate)/365) = (select trunc((sysdate-hiredate)/365) from emp where ename='�����')
and ename!='�����';


��43) �Ի����� �� 15�� �̻�� ����� ���� ���翬������ 10% �λ������ �� 
      ���, �̸�, �Ի���, ���翬��, �λ��Ŀ���, �λ�ȱݾ����� ��׿��������� ��ȸ�Ͻÿ�
      �������ϴ� �� : �޿�(sal)*12����+���ʽ�(comm)
select empno, ename, hiredate, (sal*12+nvl(comm,0)) as ���翬��, (sal*12+nvl(comm,0))*1.1 as �λ��Ŀ���, ((sal*12+nvl(comm,0))*1.1)-(sal*12+nvl(comm,0)) as �λ�ȱݾ�
from emp
where trunc((sysdate-hiredate)/365)>=15
order by (sal*12+nvl(comm,0))*1.1 desc;


��44) �Ի翬���� ¦���� �������� �޿��� ����� job���� ����Ͻÿ�
select job, avg(sal) as avg from emp
where mod((substr(hiredate,0,2)),2)=0
group by job;
