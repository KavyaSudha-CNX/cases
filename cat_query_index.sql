select pg_get_serial_sequence('master.master_category','category_id')

select setval('master.master_category_category_id_seq',coalesce(
(select max(category_id) from master.master_category),1
),exists(
select 1 from master.master_category))

select pg_get_serial_sequence('master.master_category_primary','primary_cat_id')

select setval('master.master_category_primary_primary_cat_id_seq',coalesce(
(select max(primary_cat_id) from master.master_category_primary),1
),exists(
select 1 from master.master_category_primary))


select pg_get_serial_sequence('master.master_category_secondary','secondary_cat_id')

select setval('master.master_category_secondary_secondary_cat_id_seq',coalesce(
(select max(secondary_cat_id) from master.master_category_secondary),1
),exists(
select 1 from master.master_category_secondary))

select pg_get_serial_sequence('master.master_category_tertiary','tertiary_cat_id')

select setval('master.master_category_tertiary_tertiary_cat_id_seq',coalesce(
(select max(tertiary_cat_id) from master.master_category_tertiary),1
),exists(
select 1 from master.master_category_tertiary))

select pg_get_serial_sequence('master.master_category_mapping','category_mapping_id')

select setval('master.master_category_mapping_category_mapping_id_seq',coalesce(
(select max(category_mapping_id) from master.master_category_mapping),1
),exists(
select 1 from master.master_category_mapping))

select * from master.master_category_mapping
order by category_mapping_id desc

select pg_get_serial_sequence('master.related_with','id')

select setval('master.related_with_id_seq',coalesce(
(select max(id) from master.related_with),1
),exists(
select 1 from master.related_with))

select * from master.master_category order by category_id desc

select * from master.related_with order by id desc

select * from master.master_category_primary order by primary_cat_id desc

select * from master.master_category_secondary order by secondary_cat_id desc

select * from master.master_category_tertiary order by tertiary_cat_id desc