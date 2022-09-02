create table cart(  --��ٱ��� ���̺�
     size_num       number          primary key     --�Ϸù�ȣ
    ,user_id        varchar2(20)    not null        --ȸ�� ���̵�
    ,product_code   varchar2(20)    not null        --��ǰ�ڵ�
    ,quantity       number          not null        --����
    ,c_size         varchar2(3)     not null        --������
);

insert into cart(size_num, user_id, product_code, quantity, c_size)
values(1,'kim1','MSC5TS3911BK',1,'90');
insert into cart(size_num, user_id, product_code, quantity, c_size)
values(2,'lee1','MSC2PP1991BK',1,'95');
insert into cart(size_num, user_id, product_code, quantity, c_size)
values(3,'park1','MSC5TC1201BK',1,'S');


create table t_order( --�ֹ����� ���̺�
     order_num  varchar2(20)    primary key     --�ֹ���ȣ
    ,user_id    varchar2(20)    not null        --ȸ�� ���̵�
    ,coupon_dc  varchar2(20)                    --���� ����
    ,point_dc   number                          --����Ʈ����
    ,total      number          not null        --�Ѱ����ݾ�
    ,name       varchar2(20)    not null        --�޴� ��� 
    ,addr       varchar2(50)    not null        --�޴� �ּ�
    ,msg        varchar2(50)                    --��� �޼���
    ,status     varchar2(10)    not null        --�������
);

insert into t_order(order_num, user_id, coupon_dc, point_dc, total, name, addr, msg, status)
values('20220831111430-001','kim1',-5000,'',44700,'�����','������ ���ﵿ ���Ÿ��','��ȭ�ּ���','Y');
insert into t_order(order_num, user_id, coupon_dc, point_dc, total, name, addr, msg, status)
values('20220831111430-002','lee1','',-100,25900,'�̱浿','���','���ǿ� �ð��ּ���','Y');
insert into t_order(order_num, user_id, coupon_dc, point_dc, total, name, addr, msg, status)
values('20220831111430-003','park1','',-2000,69900,'�ڱ浿','���� �Ѷ�� �����','���տ� ���ּ���','Y');



select * from cart;
select * from t_order;

commit;