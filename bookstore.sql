-- 회원
CREATE TABLE member (
    member_id varchar2(30) NOT NULL,
    member_pwd varchar2(200) NOT NULL,
    member_pwd_ck varchar2(200) NOT NULL,
    member_name varchar2(20) NOT NULL,
    member_email varchar2(100) NOT NULL,
    member_postno number NOT NULL,
    member_address varchar2(100) NOT NULL,
    member_detail_address varchar2(100) NOT NULL,
    member_tel varchar2(13) NOT NULL,
    member_role varchar2(30) NOT NULL,
    member_enabled number(1,0) NOT NULL,
    regdate DATE NOT NULL,
    updatedate DATE NOT NULL,
    CONSTRAINT member_pk PRIMARY KEY(member_id)
);

-- 카테고리
create table category(
    category_no number not null,
    category_name varchar2(50),
    constraint category_pk primary key(category_no)
);

-- 도서
create table book(
    book_no number not null,
    book_title varchar2(100),
    book_contents clob,
    book_image varchar2(100),
    book_hit number default 0,
    book_count number default 1,
    author varchar2(20),
    publisher varchar2(50),
    price number,
    pub_date Date default sysdate,
    constraint book_pk primary key(book_no),
    category_no number constraint book_category_fk references category(category_no) on delete cascade
);

-- 장바구니
create table cart(
    cart_no number NOT NULL,
    total_price number,
    constraint cart_pk primary key(cart_no),
    member_id varchar2(30) constraint cart_member_fk references member(member_id) on delete cascade,
    book_no NUMBER constraint cart_book_fk references book(book_no) on delete cascade
);

-- 주문
CREATE TABLE orders (
   order_no NUMBER NOT NULL,
   order_type varchar2(20),
   price NUMBER,
   order_date DATE,
   CONSTRAINT orders_pk PRIMARY KEY(order_no),
   member_id varchar2(30) CONSTRAINT orders_member_fk REFERENCES member(member_id) on delete cascade
);

-- 원고
create table script(
    script_no number not null,
    script_title varchar2(50),
    script_contents clob,
    script_image varchar2(100),
    script_hit number default 0,
    script_date Date,
    author varchar2(3000),
    constraint script_pk primary key(script_no),
    category_no number constraint script_category_fk references category(category_no) on delete cascade,
    member_id varchar2(30) constraint script_member_fk references member(member_id) on delete cascade
);

--drop table book;
--drop table cart;
--drop table category;
--drop table member;
--drop table orders;
--drop table script;
