�� [CSV ����]
- ��� �����Ͱ� , �� ���еǾ� �ִ� ����

�� [CSV ������ �����ͺ��̽��� ��������]
- �������������� https://data.go.kr/ Ȱ��


��1) ���θ� �����ȣ ���̺� �����ϱ�

-- 1) zipdoro.csv �غ� (258267��)

-- 2) zipdoro.csv ������ �����ϴ� zipdoro���̺� ����
create table zipdoro(
    zipno       char(5)         --�����ȣ
    ,zipaddress varchar(1000)   --�ּ�
);

commit;
drop table zipdoro;     --���̺� ����


-- 3) ��������� ��������
- zipdoro ���̺� ��Ŭ�� �� ������ ����Ʈ (��������)
- zipdoro ���̺� ��Ŭ�� �� export      (��������)

select count(*) from zipdoro;   --��ü �� ���� ��ȸ�ϱ�


-- ����Ư���� �������� ���۵Ǵ� �����ȣ�� ����� ��ȸ�Ͻÿ�
select count(*)
from zipdoro
where zipaddress like '����Ư���� ������%';

-- Ǯ��
select count(zipno)
from zipdoro
where zipaddress like '����Ư���� ������%';

//////////////////////////////////////////////////////////////////////////////


��2) �ѱ��������б�_���ߵ��б���ġ.csv�� ��ȯ�ؼ� ���̺� �����Ͻÿ� (11874��)

-- ����ִ� ��(null)�� ã���ÿ�

create table schools (
    scid    char(10)
   ,scname  varchar(1000)
   ,sclass  varchar(1000)
   ,scaddress    varchar(1000)
   ,sdate       date
   ,editdate   date
   ,wido    varchar(1000)
   ,gyeongdo    varchar(1000)
);

commit;
drop table schools;

select count(*) from schools;

select * from schools
where (select * from schools) is null;

select * from schools
where scaddress is null;    -- �ٻ��Ѱ����б�


-- ���� �ϱ�
create table school (
    schoolid    varchar2(10)    --�б�ID
);