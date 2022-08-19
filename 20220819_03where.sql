�� [where ������]
    - ������ �����ϴ� ��鿡 ���ؼ�
    - ���ǿ� �����ϴ� ���ڵ常 ������� ��ȸ(select), ����(update), ����(delete)�ϱ� ���ؼ�
    
select * from sungjuk;

--��1) ���������� 50���̻� ���� ��ȸ�Ͻÿ�
select uname, kor
from sungjuk
where kor>=50;


--��2) ���� ������ 50���̸� ���� ��ȸ�Ͻÿ�
select uname, eng
from sungjuk
where eng<50;


--��3) �̸��� '���ѹα�' ���� ��ȸ(���)�Ͻÿ�
select uname, kor, eng, mat
from sungjuk
where uname='���ѹα�'; -- �¿찡 ���� ����


--��4) �̸��� '���ѹα�' �ƴ� ���� ��ȸ�Ͻÿ�
select uname, kor, eng, mat
from sungjuk
where uname != '���ѹα�';  -- �¿찡 ���� ���� �ʴ�

select uname, kor, eng, mat
from sungjuk
where uname <> '���ѹα�';  -- �¿찡 ���� ���� �ʴ�


--��5) ����, ����, ���� �������� ������ ��� 90�̻� ���� ��ȸ�Ͻÿ�
select uname, kor, eng, mat
from sungjuk
where kor>=90 and eng>=90 and mat>=90;


--��6) ����, ����, ���� �߿��� �Ѱ����̶� 40�̸� ���� ��ȸ�Ͻÿ�
select uname, kor, eng, mat
from sungjuk
where kor<40 or eng<40 or mat<40;


--��7) ���������� 80 ~ 89�� ���� ���� ��ȸ�Ͻÿ�
select uname, kor
from sungjuk
where kor>=80 and kor<=89;


--��8) �̸��� '����ȭ', '����ȭ'�� ��ȸ�Ͻÿ�
select uname
from sungjuk
where uname='����ȭ' or uname='����ȭ';

////////////////////////////////////////////////////


�� [between A and B] ������ - A���� B����

-- ���������� 80 ~ 89�� ���� ���� ��ȸ�Ͻÿ�
select uname, kor
from sungjuk
where kor between 80 and 89;

////////////////////////////////////////////////////


�� [in] ������ - ��Ͽ��� ã��

-- �̸��� '����ȭ', '����ȭ'�� ��ȸ�Ͻÿ�
select uname
from sungjuk
where uname in ('����ȭ', '����ȭ');

-- �������� 10, 20, 30���� ��ȸ�Ͻÿ�
select uname, kor
from sungjuk
where kor in (10, 20, 30);

////////////////////////////////////////////////////

-- ��9) ��, ��, �� ��� 100���� �ƴ� ���� ��ȸ�Ͻÿ�
select uname, kor, eng, mat
from sungjuk
where not (kor=100 and eng=100 and mat=100);

////////////////////////////////////////////////////


�� [LIKE ������]
    - ���ڿ� �����Ϳ��� ����� ������ �˻��� ��
    - % ���ڰ����� �������
    - _ ���ڰ������� ��ġ�ؾ� ��

select uname
from sungjuk
where uname='���ѹα�';


--��1) �̸����� 'ȫ'���� �����ϴ� �̸��� ��ȸ�Ͻÿ�
select uname
from sungjuk
where uname like 'ȫ%';


--��2) �̸����� 'ȭ'�� ������ �̸��� ��ȸ�Ͻÿ�
select uname
from sungjuk
where uname like '%ȭ';


--��3) �̸��� '��'���� �ִ� �̸��� ��ȸ�Ͻÿ�
select uname
from sungjuk
where uname like '%��%';


--��4) �α��� �̸����� 'ȭ'�� ������ �̸��� ��ȸ�Ͻÿ�
select uname
from sungjuk
where uname like '_ȭ';


--��5) �̸� ������ �߿��� ��� ���ڰ� '��' �ִ� ���� ��ȸ�Ͻÿ�
select uname
from sungjuk
where uname like '_��_';


--��6) ����+������ �����ϰ� �˻�� '�Ľ�Ÿ'�� ��
where subject like '%�Ľ�Ÿ%' or content like '%�Ľ�Ÿ%';


--��7) ���� ������ 50���̻��� �࿡ ���ؼ� ����(tot)�� ���(aver)�� ���Ͻÿ�
select * from sungjuk where kor>=50;

update sungjuk
set tot=kor+eng+mat, aver=(kor+eng+mat)/3
where kor>=50;

select * from sungjuk;

/////////////////////////////////////////////////////////////////////////


�� [NULL] - ��� �ִ� ��

-- ������ ������ ���Ͻÿ�
select count(tot) from sungjuk; -- null ���� ī��Ʈ���� ����

-- ������ NULL�� �ִ� ���� ������ ���Ͻÿ�
select count(*) from sungjuk where tot=null; -- null �� Ȯ�� ����. 0

select count(*) from sungjuk where tot is null; -- null �� Ȯ���ؾ� �ϴ� ���. 5


-- ��տ� ������� ���� ���� ������ ���Ͻÿ� (null�� �ƴ� ��)
select count(*) from sungjuk where aver is not null;


--��8) ����ִ� ������ ����� ��� ���Ͻÿ�
update sungjuk
set tot=kor+eng+mat, aver=(kor+eng+mat)/3
where tot is null or aver is null;

select * from sungjuk;

commit;