connection: "ecomm_snowflake"
label: "eCommerce"

# include all the views
include: "/views/**/*.view"

datagroup: the_look_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "4 hour"
}

persist_with: the_look_default_datagroup


explore: order_items {
label: "(1) Orders, Items and Users"
view_name: order_items
description: "All order items since 1/1/2020"
sql_always_where: ${created_date} >= '2020-01-01' ;;

join: inventory_items {
  #Left Join only brings in items that have been sold as order_item
  type: full_outer
  relationship: one_to_one
  sql_on: ${inventory_items.id} = ${order_items.inventory_item_id} ;;
}}

explore: repeat_purchase_facts {

}

explore: users {

}

explore: products {

}

explore: events {

}
