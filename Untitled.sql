create database MiniMedidata_development;
create database MiniMedidata_test;
use MiniMedidata_development;
desc studies;
select * from studies;
select * from study_groups;
select * from subjects;
select * from enrollments;
select * from delayed_jobs;

select * from subjects
LEFT JOIN enrollments
on subjects.id = subject_id
where subject_id IS NULL;