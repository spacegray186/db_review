�� [��������]
- SQL�� �� �� �ٸ� SQL��
- ���̺����� �ٽ� �ѹ� �������� ���� ���ڵ� ��ȸ �� �˻�

-- ���������� ����� ��ȸ�Ͻÿ�
select kor from sungjuk;
select avg(kor) from sungjuk;
select round(avg(kor),0) from sungjuk;  -- 66
select round(avg(kor),0) as avg_kor from sungjuk;


��1) �������� ���(66)���� ���� ���� ������ ��ȸ�Ͻÿ�

select uname, kor from sungjuk where kor>=66;

select uname, kor from sungjuk where kor>=(select round(avg(kor),0) from sungjuk);


��2) ���������� �������� ��պ��� ���� ����, �̸�, ���������� ��ȸ�Ͻÿ�

-- ���������� �������� ����� ���Ͻÿ�
select avg(kor) from sungjuk where addr='Seoul';
select round(avg(kor),0) from sungjuk where addr='Seoul';   -- 73

select addr, uname, kor
from sungjuk
where kor>=(select round(avg(kor),0) from sungjuk where addr='Seoul');


��3)���������� �������� ���(73)���� ���� ���������� �ٸ� ������ �ִ��� ��ȸ�Ͻÿ�
select addr, kor
from sungjuk
where kor>=(select round(avg(kor)) from sungjuk where addr='Seoul');

select addr, uname, kor
from sungjuk
where kor>=(select round(avg(kor)) from sungjuk where addr='Seoul') and != 'Seoul'
group by addr;



-- Ǯ��
select addr, uname, kor
from sungjuk
where kor>=(select round(avg(kor),0) from sungjuk where addr='Seoul')
and addr <> 'Seoul';    -- addr != 'Seoul' ����


��4)���������� �ּҰ����� ���� ������ ���� �Ǵ� ���������� �ִ��� ��ȸ�Ͻÿ�
-- ���������� �ּҰ�
select min(kor) from sungjuk;   -- 20

select uname, kor, eng, mat
from sungjuk
where mat<=20 or eng<=20;

select uname, kor, eng, mat
from sungjuk
where mat<=(select min(kor) from sungjuk)
    or
    eng<=(select min(kor) from sungjuk);