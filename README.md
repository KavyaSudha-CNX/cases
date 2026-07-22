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
