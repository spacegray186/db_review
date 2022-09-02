create table cart(  --장바구니 테이블
     size_num       number          primary key     --일련번호
    ,user_id        varchar2(20)    not null        --회원 아이디
    ,product_code   varchar2(20)    not null        --상품코드
    ,quantity       number          not null        --수량
    ,c_size         varchar2(3)     not null        --사이즈
);

insert into cart(size_num, user_id, product_code, quantity, c_size)
values(1,'kim1','MSC5TS3911BK',1,'90');
insert into cart(size_num, user_id, product_code, quantity, c_size)
values(2,'lee1','MSC2PP1991BK',1,'95');
insert into cart(size_num, user_id, product_code, quantity, c_size)
values(3,'park1','MSC5TC1201BK',1,'S');


create table t_order( --주문내역 테이블
     order_num  varchar2(20)    primary key     --주문번호
    ,user_id    varchar2(20)    not null        --회원 아이디
    ,coupon_dc  varchar2(20)                    --쿠폰 할인
    ,point_dc   number                          --포인트할인
    ,total      number          not null        --총결제금액
    ,name       varchar2(20)    not null        --받는 사람 
    ,addr       varchar2(50)    not null        --받는 주소
    ,msg        varchar2(50)                    --배송 메세지
    ,status     varchar2(10)    not null        --결과상태
);

insert into t_order(order_num, user_id, coupon_dc, point_dc, total, name, addr, msg, status)
values('20220831111430-001','kim1',-5000,'',44700,'손흥민','강남구 역삼동 삼원타워','전화주세요','Y');
insert into t_order(order_num, user_id, coupon_dc, point_dc, total, name, addr, msg, status)
values('20220831111430-002','lee1','',-100,25900,'이길동','경기','경비실에 맡겨주세요','Y');
insert into t_order(order_num, user_id, coupon_dc, point_dc, total, name, addr, msg, status)
values('20220831111430-003','park1','',-2000,69900,'박길동','제주 한라산 꼭대기','문앞에 놔주세요','Y');



select * from cart;
select * from t_order;

commit;