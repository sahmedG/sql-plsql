select * from emp;
select * from table ( pivot(  'select  job,e_deptno, decode (count(1),0,null, count(1+0)) count_job from emp group by e_deptno, job' ) );
alter system flush buffer_cache;
alter system flush shared_pool;

select * from (
select e_deptno , job, ename, sal from emp )
pivot 
(
  max (sal)
  for e_deptno in ('10','20','30')
);
COMMIT;



select * from table ( pivot(  'select  observation_id, (max (observation2.weight) ) count_weight  from observation2 where person =891210601 group by observation_id, weight' ) );


select * from table( ROWTOCOL (27 , 32 ));

commit;