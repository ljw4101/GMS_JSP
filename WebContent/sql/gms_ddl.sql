--id, pw, ssn, name, regdate
CREATE TABLE Member(
	id VARCHAR2(10), 
	name VARCHAR2(10),
	pw VARCHAR2(10), 
	ssn VARCHAR2(15), 
	regdate DATE,
	PRIMARY KEY(id)
);

--phone, email, major, subject, profile
ALTER TABLE Member ADD phone VARCHAR2(13);
ALTER TABLE Member ADD email VARCHAR2(30);
ALTER TABLE member ADD profile VARCHAR2(30);

DROP TABLE Member;

--제일 먼저 생성되어야 한다.
CREATE SEQUENCE article_seq
	START WITH 1000
	INCREMENT BY 1
	NOCACHE
	NOCYCLE;

CREATE TABLE board(
	article_seq NUMBER,
	id VARCHAR2(10),
	title VARCHAR2(20),
	content VARCHAR2(100),
	regdate DATE,
	hitcount NUMBER,
	PRIMARY KEY(article_seq),
	FOREIGN KEY(id) REFERENCES MEMBER(id) ON DELETE CASCADE
);

select * from tab;

--major
create table major(
	major_id VARCHAR2(10),
	title VARCHAR2(10),
	PRIMARY KEY(major_id)
);

--subject
create table subject(
	subj_id VARCHAR2(10),
	title VARCHAR2(10),
	major_id VARCHAR2(10),
	primary key(subj_id),
	foreign key(major_id) references major(major_id) on delete cascade
);

	
create sequence grade_seq
	START WITH 1000
	INCREMENT BY 1
	NOCACHE
	NOCYCLE;

	
--grade
create table grade(
	grade_seq NUMBER,
	score VARCHAR2(10),
	exam_date VARCHAR2(10),
	subj_id VARCHAR2(10),
	id VARCHAR2(10), 
	primary key(grade_seq),
	foreign key(subj_id) references subject(subj_id) on delete cascade,
	foreign key(id) references MEMBER(id) on delete cascade
);


--foreign key 추가: 없는 컬럼 추가후 제약조건 추가
alter table member add major_id VARCHAR2(10);

alter table member add constraint member_fk_major
foreign key(major_id) references major(major_id);
