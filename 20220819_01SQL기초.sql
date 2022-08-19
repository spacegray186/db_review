�� [��������]
    - ���̺� ����, ����
    - Create, Read, Update, Delete
    
�� [NCS �н� ���] - ����SW ���� ��� Ȱ��
    3-3 ������ �����ͺ��̽� ���̺� ���� (p95)
    
//////////////////////////////////////////////

[����]
�̸�   ����  ����  ����  ����  ���
------------------------------
ȫ�浿  100  90   80
���޷�  85   75   60

[���̺� ����]
-- ����)  
   create table ���̺�(
       Į����1  �ڷ���  ��������
      ,Į����2  �ڷ���  ��������
      ,Į����3  �ڷ���  ��������
      , ~~~
   );

-- sungjuk ���̺� ����
create table sungjuk(
    uname varchar(20)   -- ������ 20���� �̳�����
    ,kor int            -- ������
    ,eng int
    ,mat int
    ,tot int
    ,aver int
);

-- Į���� ������ �ǹ̰� ����
-- ���� ����Ű Ctrl + Enter


[���̺� ����]
-- ����) drop table ���̺��;
-- ����) ���̺��� �����ϸ� ��� �����͵� ���� �����ȴ�

-- sungjuk ���̺� ����
drop table sungjuk;


[���̺� ����]
-- ����) alter table ���̺�� ��������


[������ DB���� ���̺��� �ٽɱ��]
    - C Create  ���� �� insert��
    - R Read    ��ȸ �� select��
    - U Update  ���� �� update��
    - D Delete  ���� �� delete��


[���ڿ� ������]
- �����ͺ��̽����� ���ڿ� �����ʹ� ' �� ���Ѵ�

///////////////////////////////////////////////

�� [sungjuk ���̺� CRUD �۾�]

1. ���߰�
����) insert into ���̺��(Į����1, Į����2, Į����3, ~~~)
    values (��1, ��2, ��3, ~~~);
    
insert into sungjuk(uname, kor, eng, mat)
values ('ȫ�浿', 100, 90, 80);

insert into sungjuk(uname, kor, eng, mat)
values ('���޷�', 85, 75, 60);


2. ��ȸ �� �˻�
-- ����) select Į����1, Į����2, Į����3, ~~~
        from ���̺��;
        
select uname, kor, eng, mat, tot, aver from sungjuk;


3. �����
-- ����) update ���̺�� set Į����1=��1, Į����2=��2, Į����3=��3, ~~~

update sungjuk set tot=kor+eng+mat, aver=(kor+eng+mat)/3;


4. �����
-- ����) delete from ���̺��;

delete from sungjuk;