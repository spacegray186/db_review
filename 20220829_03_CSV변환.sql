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


��2) �ѱ��������б�_���ߵ��б���ġ.csv�� ��ȯ�ؼ� ���̺� �����Ͻÿ� (11873��)

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

drop table school;

create table school (
    schoolid    varchar2(10)   --�б�ID
  , schoolname  varchar2(255)  --�б���
  , schoolgubun varchar2(20)   --�б��ޱ���
  , schooladdr  varchar2(255)  --���������θ��ּ�
  , cdate       date           --�������� (���� YYYY-MM-DD)
  , udate       date           --�������� (���� YYYY-MM-DD)
  , latitude    number(20,10)  --����
  , longitude   number(20,10)  --�浵
);

commit;
select count(*) from school;
select * from school;

select * from school where schooladdr is null;

-- ����ִ� �� ã�ƺ���
select * from school where schoolid is null;
select * from school where schoolname is null;
select * from school where schoolgubun is null;
select * from school where schooladdr is null;      --B000027204�� ��� ����
select * from school where cdate is null;
select * from school where udate is null;
select * from school where latitude is null;
select * from school where longitude is null;


����) �� �õ��� �ʵ��б�, ���б� ������ ���Ͻÿ�
select substr(schooladdr,1,3) as �õ���, schoolgubun, count(*)
from school
group by substr(schooladdr,1,3), schoolgubun
having schoolgubun in ('�ʵ��б�', '���б�')
order by �õ���, schoolgubun desc;

