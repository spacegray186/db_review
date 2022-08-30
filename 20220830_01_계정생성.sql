
�� [�ְ������ ����]
  - Oracle   : system �Ǵ� sys
  - Maria DB : root
  - MS-SQL   : sa
  
  
�� [DCL��ɾ�] Data Control Language �����
  - ����ڰ� ���� ���� ����. ȣ���� ��ü�� �ַ� ���
  - grant    ����� ���� ���� �ο�
  - revoke   ����� ���� ���� ���
  - deny     Ư�� ����ڸ� ���� ����
///////////////////////////////////////////////////////////////////////  


--���� ������ ���� �����ؾ� ��
alter session set "_ORACLE_SCRIPT"=true;

--����� ���� ���
select username from all_users;

--���̺� �����̽�(���̺��� ���� ����) ����
����) create tablespace ���̺����̽��̸�
      datafile '���������ϰ��' size �ʱ������
      autoextend on
      next �ڵ�����������
      maxsize �ִ������;
      
��)
      create tablespace java202207
      datafile 'i:\java202207\database\java202207.dbf' size 50m
      autoextend on
      next 10m
      maxsize unlimited;
      
      
--����� ���� ����
����) create user ���̵� identified by ���
      default tablespace ���̺����̽��̸�;
      
��)   create user java202207 identified by 1234
      default tablespace java202207;
      

--����� ���� ���
select username from all_users;


--��� ���� �ο�
grant connect, resource, dba to java202207;
commit;

-- ���������Ʈ���� ���� �ο��� java202207 �α��� �ϱ�
>sqlplus java202207/1234


--����� ���� ����
drop user java202207 cascade;
commit;


--���̺� �����̽� ���� Ȯ��
����) select tablespace_name, contents  from dba_tablespaces;

--���̺� �����̽� ����
����) drop tablespace ���̺����̽���
      including contents and datafiles
      cascade constraints;
      
��) drop tablespace java202207
    including contents and datafiles
    cascade constraints;
    
commit;
