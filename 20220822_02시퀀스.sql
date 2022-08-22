�� [�ڵ����� �Ϸù�ȣ �ο�]

- Oracle Database   : sequence ����
- M*SQL Database    : identity ��������

///////////////////////////////////////////////////

-- sungjuk ���̺� ����
drop table sungjuk;
commit;

-- sungjuk ���̺� ����
create table sungjuk(
    sno     int         not null    -- �Ϸù�ȣ
    ,uname  varchar(50) not null
    ,kor    int         not null
    ,eng    int         not null
    ,mat    int         not null
    ,tot    int         
    ,aver   int   
    ,addr   varchar(50)             -- �ּ�
    ,wdate  date                    -- �����(�����Ͻú���)
);
////////////////////////////////////////////////////////////

-- ���߰� �׽�Ʈ
insert into sungjuk(sno, uname, kor, eng, mat, addr, wdate)
values(1, 'ȫ�浿', 89, 85, 90, 'Seoul', '2022-08-22');    -- ��¥ �����ʹ� ���ڿ� ���·� �߰��Ѵ�

select * from sungjuk;  -- ��ü �� ��ȸ
delete from sungjuk;    -- ��ü �� ����
commit;                 -- ��ɾ� �Ϸ�
////////////////////////////////////////////////////////////////////////////

�� [������ Sequence]
- �Ϸù�ȣ �ڵ� ����
- ������ ���� : create sequence ��������;
- ������ ���� : drop sequence ��������;

- ������ ���� ����) create sequence ��������
                 increment by ������ start with ���۰�;

-- sungjuk ���̺��� ����� ������ ����
create sequence sungjuk_seq;

-- sungjuk_seq ������ ����
drop sequence sungjuk_seq;

-- �������� �̿��� ���߰�
insert into sungjuk(sno, uname, kor, eng, mat, addr, wdate)
values(sungjuk_seq.nextval, 'ȫ�浿', 89, 85, 90, 'Seoul', '2022-08-22');

select * from sungjuk;
///////////////////////////////////////////////////////////////////////////


�� [sysdate �Լ�] - �ý����� ���� ��¥ ����

insert into sungjuk(sno, uname, kor, eng, mat, addr, wdate)
values(sungjuk_seq.nextval, 'ȫ�浿', 89, 85, 90, 'Seoul', sysdate);

select * from sungjuk;
///////////////////////////////////////////////////////////////////////////

--����) sno=2 ���� �����Ͻÿ�

delete from sungjuk where sno=2;
commit;
