�� [��������]
    - sort ����
    - ���̺� ����
    - ������

/////////////////////////////////////////////

�� [Sort ����]
    - Ư����(Keyfield)�� �������� ������� ���ġ
    - �������� Ascending Sort   ASC     �����ϸ� �⺻�� 1��10 A��Z a��z ���椾
    - �������� Descending Sort  DESC
    - ����) order by Į����1, Į����2, Į����3, ~~~
    

-- sungjuk ���̺��� ��ȸ�Ͻÿ�
select * from sungjuk;

-- ��ü ���ڵ带 �̸������� �����ؼ� ��ȸ�Ͻÿ�
select uname
from sungjuk
order by uname asc; -- �������� ����

select uname
from sungjuk
order by uname;     -- asc ��������

select uname
from sungjuk
order by uname desc;    -- �������� ����

-- �������� ������ �����ؼ� ��ȸ�Ͻÿ�
select uname, kor
from sungjuk
order by kor;

-- 1�� ���� : �������� ������ ����
-- 2�� ���� : ���������� ���ٸ� �̸��� �������� �������� ����
select uname, kor
from sungjuk
order by kor, uname desc;

-- 1��(kor), 2��(eng), 3��(mat) ����
select uname, kor, eng, mat
from sungjuk
order by kor desc, eng desc, mat desc;
///////////////////////////////////////////////////////////

select * from sungjuk;

����) ��� 70�� ���� ���� �̸������� ��ȸ�Ͻÿ�
--select * from sungjuk
--where aver<=70 order by uname;

-- ��� 70�� ���� �� ��ȸ
select uname, aver
from sungjuk
where aver<=70;

select uname, aver
from sungjuk
where aver<=70
order by uname;

select uname, aver
from sungjuk
order by uname
where aver>=70; -- ���� ORA-00933
///////////////////////////////////////////////////

�� [alter ��] - ���̺��� ���� ���� �� ����

1. �÷� �߰�
    ����) alter table table�� add (�÷��� ������Ÿ��);

-- music �÷� �߰�
alter table sungjuk add(music int null);
select * from sungjuk;


2. �÷��� ����
    ����) alter table table�� rename column �����÷��� to �ٲ��÷���;
    
-- �����÷� kor�� �÷��� korea�� �����Ͻÿ�
alter table sungjuk rename column kor to korea;
select * from sungjuk;


3. �÷� ������ Ÿ�� ����
    ����) alter table table�� modify(�÷��� ������Ÿ��);

-- music �÷��� �ڷ����� varchar�� �����Ͻÿ�
alter table sungjuk modify(music varchar(5));
select * from sungjuk;


4. �÷� ����
    ����)alter table table�� drop(�÷���);

-- music �÷��� �����Ͻÿ�
alter table sungjuk drop(music);
select * from sungjuk;
