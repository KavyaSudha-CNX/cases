SELECT
    tv."BUYING_NUM",
    tv."EVAL_DATE",
    tv."EVAL_EXPIRY_DATE",
    tv."ENQ_NUM",
    tv."COMP_FA",
    tv."LOC_CD",
    tv."DEALER_MAP_CD",
    tv."PARENT_GROUP",
    enq."EVAL_DLR_MAP_CD",
    enq."EVAL_LOC_CD",
    enq."ENQ_EVALUATOR",
    ge."EMP_DESG_CD",
    ge."MSPIN",
    ge."EMP_LEAVING_DATE",
    ge."EMP_CATEG"
FROM "MULDMS"."SH_TV_EVAL" tv
LEFT JOIN "MULDMS"."RH_ENQ" enq
    ON enq."DEALER_MAP_CD" = tv."DEALER_MAP_CD"
   AND enq."LOC_CD" = tv."LOC_CD"
   AND enq."PARENT_GROUP" = tv."PARENT_GROUP"
   AND enq."COMP_FA" = tv."COMP_FA"
   AND enq."ENQ_NUM" = tv."ENQ_NUM"
LEFT JOIN "MULDMS"."GM_EMP" ge
    ON ge."EMP_CD" = enq."ENQ_EVALUATOR"
   AND ge."LOC_CD" = enq."EVAL_LOC_CD"
   AND ge."DEALER_MAP_CD" = enq."EVAL_DLR_MAP_CD"
WHERE tv."BUYING_NUM" IN (
    'B26018955198'
);



SELECT tv."BUYING_NUM",tv."EVAL_CODE",tv."MODEL",tv."REG_NO",tv."EVAL_DEALER",
tv."CUST_NAME",ge."EMP_NAME",ge."MSPIN" FROM "MULDMS"."SH_TV_EVAL" tv
LEFT JOIN "MULDMS"."GM_EMP" ge ON ge."EMP_CD" = tv."EVAL_CODE" AND ge."DEALER_MAP_CD" = tv."EVAL_DEALER"::INTEGER
WHERE tv."BUYING_NUM" ='B26019673916';

SELECT "DEALER_MAP_CD", "LOC_CD" , "COMP_FA" ,"PARENT_GROUP" FROM "MULDMS"."SH_POC_ORDBOOK" 
where "ORDER_NUM" = 'ORDP26000178' AND "REG_NUM"='TG08AD8150'
 
SELECT * FROM "MULDMS"."SH_POC_ORDBOOK" where "ORDER_NUM" = 'ORDP26000178' AND "REG_NUM"='TG08AD8150'




select 
cm.category_mapping_id,
lob.lob_desc,
st.service_type_name,
ct.case_type_name,
c.category_name,
p.primary_category_name,
s.secondary_category_name,
t.tertiary_category_name,
r.related_to_name,
pr.priority_name,
cm.is_active
from master.master_category_mapping cm
left join master.master_line_of_business lob on cm.lob_id = lob.lob_id
left join master.master_service_type st on cm.service_type_id = st.service_type_id
left join master.master_case_type ct on cm.case_type_id = ct.case_type_id
left join master.master_category c on cm.category_id = c.category_id
left join master.master_primary_category p on cm.primary_category_id = p.primary_category_id
left join master.master_secondary_category s on cm.secondary_category_id = s.secondary_category_id
left join master.master_tertiary_category t on cm.tertiary_category_id = t.tertiary_category_id
left join master.master_related_to r on cm.related_to_id = r.related_to_id
left join master.master_priority pr on cm.priority_id = pr.priority_id;
