select current_schema();
set search_path to master;

begin;

CREATE TEMP TABLE tmp_service_home_charger (
    category_name VARCHAR(255),
    primary_category_name VARCHAR(255),
    secondary_category_name VARCHAR(255),
    tertiary_category_name VARCHAR(255)
);

select * from tmp_service_home_charger;

INSERT INTO tmp_service_home_charger
(
    category_name,
    primary_category_name,
    secondary_category_name,
    tertiary_category_name
)
VALUES
('Service Home Charger', 'Charger', 'Not working', 'NA'),
('Service Home Charger', 'Charger', 'Damaged', 'NA'),
('Service Home Charger', 'Charger', 'Gun Related', 'NA'),
('Service Home Charger', 'Charger', 'Higher Charging Time', 'NA'),
('Service Home Charger', 'Charger', 'No power', 'NA'),
('Service Home Charger', 'Charger', 'Electric Shock', 'NA'),
('Service Home Charger', 'Others', 'NA', 'NA'),
('Service Home Charger', 'Charging Interrupted', 'Interruption After Few Minutes', 'NA'),
('Service Home Charger', 'Charging Interrupted', 'Stops After Power Restoration', 'No Auto Restart After Power Cut'),
('Service Home Charger', 'RFID', 'Damaged', 'NA'),
('Service Home Charger', 'Charger Not Working', 'No Power / No Light', 'No Indicator Display'),
('Service Home Charger', 'Charger Not Working', 'No Power / No Light', 'Charger Dead After Power Failure'),
('Service Home Charger', 'Charger Not Working', 'Red Light Showing', 'Solid Red Light'),
('Service Home Charger', 'Charger Not Working', 'Red Light Showing', 'Blinking Red Light'),
('Service Home Charger', 'Charger Not Working', 'Yellow/Orange Light Showing', 'Blinking Orange Light'),
('Service Home Charger', 'Charger Not Working', 'Blue Light Blinking', 'Blue Light Continues Blinking'),
('Service Home Charger', 'Charger Not Working', 'Charger Fault Error', 'Charger Showing Fault/Error'),
('Service Home Charger', 'Charger Not Working', 'Charger Unavailable', 'Charger Showing Unavailable'),
('Service Home Charger', 'Charging Not Initiating', 'Charging Not Starting via RFID', 'RFID Tap Not Working'),
('Service Home Charger', 'Charging Not Initiating', 'Gun Not Locking', 'Gun Not Locked in Vehicle'),
('Service Home Charger', 'Slow Charging', 'Excessive Charging Time', 'Overnight Charging Incomplete'),
('Service Home Charger', 'Slow Charging', 'Low Charging Output', 'Charger Derated Capacity'),
('Service Home Charger', 'Slow Charging', 'Load Capacity Concern', 'Load Upgrade Required'),
('Service Home Charger', 'Charger Connectivity Issue', 'Charger Unavailable in app', 'Internet not connected'),
('Service Home Charger', 'Charger Connectivity Issue', 'Not Connected in App', 'Charger Missing in App'),
('Service Home Charger', 'RFID Card Issue', 'RFID not working', 'Home Charger'),
('Service Home Charger', 'RFID Card Issue', 'RFID not working', 'Public Charger'),
('Service Home Charger', 'RFID Card Issue', 'RFID Mismatch', 'Card Number Mismatch with Database'),
('Service Home Charger', 'Electrical Issue', 'RCBO Issue', 'RCBO Overheating'),
('Service Home Charger', 'Electrical Issue', 'RCBO Issue', 'RCBO Faulty'),
('Service Home Charger', 'Electrical Issue', 'Earthing Concern', 'Earthing Not Proper'),
('Service Home Charger', 'Electrical Issue', 'Cable Burnt/Spark From Charger', 'Charging Cable Burnt/Sparking'),
('Service Home Charger', 'Charger Hardware Issue', 'Charging Gun Issue', 'Gun Stuck'),
('Service Home Charger', 'Charger Hardware Issue', 'Charging Gun Issue', 'Gun Broken'),
('Service Home Charger', 'Charger Hardware Issue', 'Damaged/Faulty', 'NA'),
('Service Home Charger', 'Service / Support Concern', 'CP Team Not Responding', 'Calls Not Answered'),
('Service Home Charger', 'Service / Support Concern', 'Dealer Not Responding', 'Dealer Not Contactable/Delay in Resolution'),
('Service Home Charger', 'Configuration / Change Request', 'SIM Activation', 'Activate SIM Connectivity'),
('Service Home Charger', 'Configuration / Change Request', 'Phase Change Request', 'Single Phase to Three Phase'),
('Service Home Charger', 'Charging Not Initiating', 'Charging Not Starting via E for Me App', 'Green Light on Charger'),
('Service Home Charger', 'Charging Not Initiating', 'Charging Not Starting via E for Me App', 'Orange/Red Light on Charger')

select * from tmp_service_home_charger;

INSERT INTO master.master_category (category_name,category_desc,created_at,created_by)
values('Service Home Charger','Service Home Charger',now(),'ADMIN');

INSERT INTO related_with (related_with_name,related_with_desc,created_at,created_by)
values('Service Home Charger','Service Home Charger',now(),'ADMIN');

select * from master.master_category order by category_id desc

select * from master.related_with order by id desc

select * from master_category_primary order by primary_cat_id desc

INSERT INTO master_category_primary (primary_cat_name,primary_cat_desc,created_at,created_by)
SELECT DISTINCT primary_category_name,primary_category_name, now(), 'ADMIN'
FROM tmp_service_home_charger
WHERE primary_category_name IS NOT NULL
ON CONFLICT DO NOTHING;

select * from master_category_secondary order by secondary_cat_id desc

INSERT INTO master_category_secondary (secondary_cat_name,secondary_cat_desc,created_at,created_by)
SELECT DISTINCT secondary_category_name,secondary_category_name, now(), 'ADMIN'
FROM tmp_service_home_charger
WHERE secondary_category_name IS NOT NULL
ON CONFLICT DO NOTHING;

select * from master_category_tertiary order by tertiary_cat_id desc

INSERT INTO master_category_tertiary (tertiary_cat_name,tertiary_cat_desc,created_at,created_by)
SELECT DISTINCT tertiary_category_name,tertiary_category_name, now(), 'ADMIN'
FROM tmp_service_home_charger
WHERE tertiary_category_name IS NOT NULL
ON CONFLICT DO NOTHING;

commit;
begin

select count(*) from master_category_mapping

INSERT INTO master_category_mapping
(
    lob_channel_casetype_id,
    category_id,
    primary_cat_id,
    secondary_cat_id,
    tertiary_cat_id,
	created_at,
	created_by
)
SELECT
    l.lob_channel_casetype_id,
    c.category_id,
    p.primary_cat_id,
    s.secondary_cat_id,
    t.tertiary_cat_id,
	now(),
	'ADMIN'
		
FROM (VALUES(11),(14),(17)) as l(lob_channel_casetype_id)
CROSS JOIN tmp_service_home_charger d

JOIN master_category c
    ON LOWER(TRIM(c.category_name)) =
       LOWER(TRIM(d.category_name))

JOIN master_category_primary p
    ON LOWER(TRIM(p.primary_cat_name)) =
       LOWER(TRIM(d.primary_category_name))

JOIN master_category_secondary s
    ON LOWER(TRIM(s.secondary_cat_name)) =
       LOWER(TRIM(d.secondary_category_name))

JOIN master_category_tertiary t
    ON LOWER(TRIM(t.tertiary_cat_name)) =
       LOWER(TRIM(d.tertiary_category_name))

ON CONFLICT DO NOTHING;

rollback;

select category_mapping_id,modified_at,modified_by,related_with_id,device_type_id,is_active
from master_category_mapping order by category_mapping_id desc

select * from master.master_category_mapping order by category_mapping_id desc

update master.master_category_mapping
set related_with_id = 11
where category_id = 6







