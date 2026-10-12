UPDATE master.master_ui_tab_config SET is_closure_tab_visible=true ;

select * from master.master_ui_tab_config 

select * from master.master_ui_tab_config where lob_channel_casetype_mapping_id = 2 and status_code = 2

select * from master.master_case_status_code  Active -- 2, Close --4

select * from master.master_case_reason_code   New -- 5,Close initiated -- 1,close sent Back -- 14


INSERT INTO master.master_case_journey_query (applicable_status_code, applicable_reason_code, channel_id, lob_id, case_type_id, operation, is_active, created_at, created_by) VALUES((SELECT status_code_id FROM master.master_case_status_code WHERE status_code_name = 'Active'), (SELECT reason_code_id FROM master.master_case_reason_code WHERE reason_code_name = 'New'), (SELECT channel_id FROM master.master_business_unit WHERE channel_name = 'Arena'), (SELECT lob_id FROM master.master_line_of_business WHERE lob_name = 'Service'), (SELECT case_type_id FROM master.master_case_type WHERE case_type_name = 'Query'), (SELECT operation_id FROM master.master_case_operation WHERE operation_name = 'registercase'), 
true, now(), 'ADMIN');

INSERT INTO master.master_case_journey_query (applicable_status_code, applicable_reason_code, channel_id, lob_id, case_type_id, operation, is_active, created_at, created_by) VALUES((SELECT status_code_id FROM master.master_case_status_code WHERE status_code_name = 'Active'), (SELECT reason_code_id FROM master.master_case_reason_code WHERE reason_code_name = 'New'), (SELECT channel_id FROM master.master_business_unit WHERE channel_name = 'Nexa'), (SELECT lob_id FROM master.master_line_of_business WHERE lob_name = 'Service'), (SELECT case_type_id FROM master.master_case_type WHERE case_type_name = 'Query'), (SELECT operation_id FROM master.master_case_operation WHERE operation_name = 'registercase'), true, now(), 'ADMIN');

INSERT INTO master.master_case_journey_query (applicable_status_code, applicable_reason_code, channel_id, lob_id, case_type_id, operation, is_active, created_at, created_by) VALUES((SELECT status_code_id FROM master.master_case_status_code WHERE status_code_name = 'Active'), (SELECT reason_code_id FROM master.master_case_reason_code WHERE reason_code_name = 'New'), (SELECT channel_id FROM master.master_business_unit WHERE channel_name = 'Commercial'), (SELECT lob_id FROM master.master_line_of_business WHERE lob_name = 'Service'), (SELECT case_type_id FROM master.master_case_type WHERE case_type_name = 'Query'), (SELECT operation_id FROM master.master_case_operation WHERE operation_name = 'registercase'), true, now(), 'ADMIN');

select * from master.master_business_unit
Arena - 1, Nexa -2, commercial - 4
select * from master.master_line_of_business
Service - 2

select lccm.id, lccm.channel_id, bu.channel_name, lccm.lob_id, lob.lob_name, ct.case_type_id, ct.case_type_name from master.master_lob_channel_casetype_mapping lccm
join master.master_business_unit bu on bu.channel_id = lccm.channel_id
join master.master_line_of_business lob on lob.lob_id = lccm.lob_id
join master.master_case_type ct on ct.case_type_id = lccm.case_type_id
where bu.channel_id = 4 and lob.lob_id = 2 and ct.case_type_id = 2  lccm_id = 17(Commercial Service query)
where bu.channel_id = 2 and lob.lob_id = 2 and ct.case_type_id = 2  lccm_id = 14(Nexa Service query)
where bu.channel_id = 1 and lob.lob_id = 2 and ct.case_type_id = 2  lccm_id = 11(Arena Service query)
where id =20;
where bu.channel_id = 1 and lob.lob_id = 2

select * from master.master_case_status_code  Active -- 2, Close -- 5

select * from master.master_case_reason_code   New -- 5,Close initiated -- 1,close sent Back -- 14

insert into master.master_ui_tab_config
(lob_channel_casetype_mapping_id,status_code,reason_code,is_closure_tab_visible,created_at,created_by,modified_at,modified_by)
values(11,2,1,true,now(), 'ADMIN',now(), 'ADMIN')
insert into master.master_ui_tab_config
(lob_channel_casetype_mapping_id,status_code,reason_code,is_closure_tab_visible,created_at,created_by,modified_at,modified_by)
values(11,2,5,true,now(), 'ADMIN')
insert into master.master_ui_tab_config
(lob_channel_casetype_mapping_id,status_code,reason_code,is_closure_tab_visible,created_at,created_by,modified_at,modified_by)
values(11,2,14,true,now(), 'ADMIN')
insert into master.master_ui_tab_config
(lob_channel_casetype_mapping_id,status_code,reason_code,is_closure_tab_visible,created_at,created_by,modified_at,modified_by)
values(14,2,1,true,now(), 'ADMIN')
insert into master.master_ui_tab_config
(lob_channel_casetype_mapping_id,status_code,reason_code,is_closure_tab_visible,created_at,created_by,modified_at,modified_by)
values(14,2,5,true,now(), 'ADMIN')
insert into master.master_ui_tab_config
(lob_channel_casetype_mapping_id,status_code,reason_code,is_closure_tab_visible,created_at,created_by,modified_at,modified_by)
values(14,2,14,true,now(), 'ADMIN')
insert into master.master_ui_tab_config
(lob_channel_casetype_mapping_id,status_code,reason_code,is_closure_tab_visible,created_at,created_by,modified_at,modified_by)
values(17,2,1,true,now(), 'ADMIN')
insert into master.master_ui_tab_config
(lob_channel_casetype_mapping_id,status_code,reason_code,is_closure_tab_visible,created_at,created_by,modified_at,modified_by)
values(17,2,5,true,now(), 'ADMIN')
insert into master.master_ui_tab_config
(lob_channel_casetype_mapping_id,status_code,reason_code,is_closure_tab_visible,created_at,created_by,modified_at,modified_by)
values(17,2,14,true,now(), 'ADMIN')