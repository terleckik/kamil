WITH a7p AS (
  SELECT 'A7P' AS region,
    regexp_replace(head.material_number_1, '^0+', '') AS fpp_gcas,
    item.batch_number AS fpp_batch,
    head.date_of_manufacture,
    regexp_replace(lis.material_number, '^0+', '') AS rmp_gcas,
    lis.batch_number,
    lis.plant,
    regexp_replace(lis.receiving_issuing_material, '^0+', '') AS receiving_issuing_material,
    lis.receiving_issuing_batch,
    lis.receiving_plant_issuing_plant AS receiving_issuing_plant,
    lis.quantity,
    lis.quantity_in_parallel_unit_of_measure,
    lis.base_unit_of_measure,
    lis.parallel_unit_of_measure,
    lis.shelf_life_expiration_or_best_before_date
  FROM cdl_oss_prod.silver_sap_a6p.afko_order_header_data_pp_orders head
  JOIN cdl_oss_prod.silver_sap_a6p.chvw_table_chvw_for_batch_where_used_list lis
    ON lis.order_number = head.order_number
  JOIN cdl_oss_prod.silver_sap_a6p.afpo_order_item item
    ON item.order_number = head.order_number AND item.sap_chng_type_code <> 'D'
  WHERE head.sap_chng_type_code <> 'D'
  LIMIT 250
),
 
f6p AS (
  SELECT 'F6P' AS region,
    regexp_replace(head.material_number_1, '^0+', '') AS fpp_gcas,
    item.batch_number AS fpp_batch,
    head.date_of_manufacture,
    regexp_replace(lis.material_number, '^0+', '') AS rmp_gcas,
    lis.batch_number,
    lis.plant,
    regexp_replace(lis.receiving_issuing_material, '^0+', '') AS receiving_issuing_material,
    lis.receiving_issuing_batch,
    lis.receiving_plant_issuing_plant AS receiving_issuing_plant,
    lis.quantity,
    lis.quantity_in_parallel_unit_of_measure,
    lis.base_unit_of_measure,
    lis.parallel_unit_of_measure,
    lis.shelf_life_expiration_or_best_before_date
  FROM cdl_oss_prod.silver_sap_f6p.afko_order_header_data_pp_orders head
  JOIN cdl_oss_prod.silver_sap_f6p.chvw_table_chvw_for_batch_where_used_list lis
    ON lis.order_number = head.order_number
  JOIN cdl_oss_prod.silver_sap_f6p.afpo_order_item item
    ON item.order_number = head.order_number AND item.sap_chng_type_code <> 'D'
  WHERE head.sap_chng_type_code <> 'D'
  LIMIT 250
),
 
l7p AS (
  SELECT 'L7P' AS region,
    regexp_replace(head.material_number_1, '^0+', '') AS fpp_gcas,
    item.batch_number AS fpp_batch,
    head.date_of_manufacture,
    regexp_replace(lis.material_number, '^0+', '') AS rmp_gcas,
    lis.batch_number,
    lis.plant,
    regexp_replace(lis.receiving_issuing_material, '^0+', '') AS receiving_issuing_material,
    lis.receiving_issuing_batch,
    lis.receiving_issuing_plant,
    lis.quantity,
    NULL AS quantity_in_parallel_unit_of_measure,
    lis.base_unit_of_measure,
    NULL AS parallel_unit_of_measure,
    lis.shelf_life_expiration_or_best_before_date
  FROM cdl_oss_prod.silver_sap_l6p.afko_order_header_data_pp_orders head
  JOIN cdl_oss_prod.silver_sap_l6p.chvw_table_chvw_for_batch_where_used_list lis
    ON lis.order_number = head.order_number
  JOIN cdl_oss_prod.silver_sap_l6p.afpo_order_item item
    ON item.order_number = head.order_number AND item.sap_chng_type_code <> 'D'
  WHERE head.sap_chng_type_code <> 'D'
  LIMIT 250
),
 
n6p AS (
  SELECT 'N6P' AS region,
    regexp_replace(head.material_number_1, '^0+', '') AS fpp_gcas,
    item.batch_id AS fpp_batch,
    head.date_of_manufacture,
    regexp_replace(lis.id_of_product_material, '^0+', '') AS rmp_gcas,
    lis.batch_id AS batch_number,
    lis.plant_id AS plant,
    regexp_replace(lis.receiving_issuing_material, '^0+', '') AS receiving_issuing_material,
    lis.receiving_issuing_batch,
    lis.receiving_issuing_plant,
    lis.quantity,
    NULL AS quantity_in_parallel_unit_of_measure,
    lis.base_unit_of_measure,
    NULL AS parallel_unit_of_measure,
    lis.shelf_life_expiration_or_best_before_date
  FROM cdl_oss_prod.silver_sap_n6p.afko_order_header_data_pp_orders head
  JOIN cdl_oss_prod.silver_sap_n6p.chvw_table_chvw_for_batch_where_used_list lis
    ON lis.order_number = head.order_number
  JOIN cdl_oss_prod.silver_sap_n6p.afpo_order_item item
    ON item.order_number = head.order_number AND item.sap_chng_type_code <> 'D'
  WHERE head.sap_chng_type_code <> 'D'
  LIMIT 250
)
 
SELECT * FROM a7p
UNION ALL SELECT * FROM f6p
UNION ALL SELECT * FROM l7p
UNION ALL SELECT * FROM n6p;
