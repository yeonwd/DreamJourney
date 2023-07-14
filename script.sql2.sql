select * from tblmember;

select * from tblaccommodate;

select * from tblroom;

CREATE OR REPLACE VIEW vwacc AS
SELECT tblaccommodate.name, tblaccommodate.address, tblaccommodate.type, tblroom.limit AS limit, 
tblaccommodate.acco_img, tblaccommodate.acco_seq
FROM tblaccommodate
INNER JOIN tblroom ON tblaccommodate.acco_seq = tblroom.acco_seq;

select * from vwacc;

select distinct * from vwacc where address like '%서울%' and limit >= '3';

select tbltransport.tran_seq, tbltransport.type, tbltransport.runtime,
tbltransport.departure, tbltransport.destination, tbltransport.limit,
tbltransport.price, tbltrandate.tran_date 
from tbltransport
inner join tbltrandate on tbltransport.tran_seq = tbltrandate.tran_seq where type='비행기';

select * from tbltrandate;

create or replace view vwairplanewj as
select tbltransport.tran_seq, tbltransport.type, tbltransport.runtime,
tbltransport.departure, tbltransport.destination, tbltransport.limit,
tbltransport.price, tbltrandate.tran_date 
from tbltransport
inner join tbltrandate on tbltransport.tran_seq = tbltrandate.tran_seq where type='비행기';

create or replace view vwbuswj as
select *
from tbltransport
inner join tbltrandate on tbltransport.tran_seq = tbltrandate.tran_seq where type='버스';

select * from tbltransport;
select * from tbltrandate;

create or replace view vwtrainwj as
select tbltransport.tran_seq, tbltransport.type, tbltransport.runtime,
tbltransport.departure, tbltransport.destination, tbltransport.limit,
tbltransport.price, tbltrandate.tran_date 
from tbltransport
inner join tbltrandate on tbltransport.tran_seq = tbltrandate.tran_seq where type='기차';

select * from vwairplane;

select * from tblactivity;

select * from vwbus;

select * from tbltransport;

select * from vwairplane where departure like '%서울%' and destination like '%제주%' and limit>='100' and tran_date >= '2023-07-01';
select * from vwtrain where departure like '%서울%' and destination like '%광주%' and limit>='100'  and tran_date >= '2023-07-01';
select * from vwbus where departure like '%서울%' and destination like '%광주%' and limit>='1' and tran_date >= '2023-07-01';

select * from vwtrainwj where departure like '서울' and destination like '광주' and limit >= 1 and tran_date >= '2023-07-01';

select * from tblmember;
rollback;
ALTER TABLE tblmember ADD (unresi CHAR(1) DEFAULT 'n');

update tblmember set name = '　', email = '　', pw = '　', nickname = '　', tel = '　', unresi = 'y' where email = 'wanjin97@gmail.com';
desc tblmember;

select * from vwactivity where address like '%서울%';
select * from vwactivity where title like '%카약%';
select * from vwactivity where address like '%서울%' and title like '%카약%';
select * from tblroom;
select * from tblaccommodate;

from tbltransport
inner join tbltrandate on tbltransport.tran_seq = tbltrandate.tran_seq where type='기차';

select * from vwactivity;

select * from tbltrip;

