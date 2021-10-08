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
view_label: "Orders"

join: inventory_items {
  #Left Join only brings in items that have been sold as order_item
  view_label: "Inventory and Products"
  type: full_outer
  relationship: one_to_one
  sql_on: ${inventory_items.id} = ${order_items.inventory_item_id} ;;
}

join: users {
  view_label: "All Users"
  type: left_outer
  relationship: many_to_one
  sql_on: ${users.id} = ${order_items.user_id} ;;
}
}

explore: repeat_purchase_facts {

}

explore: users {

}

explore: products {

}

explore: events {

}
