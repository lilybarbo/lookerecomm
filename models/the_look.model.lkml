connection: "ecomm_snowflake"

# include all the views
include: "/views/**/*.view"

datagroup: the_look_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "4 hour"
}

persist_with: the_look_default_datagroup


explore: order_items {

}

explore: repeat_purchase_facts {

}

explore: users {

}

explore: products {

}
