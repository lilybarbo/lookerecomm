view: repeat_purchase_facts {
  derived_table: {
    persist_for: "24 hours"
    sql: SELECT
        order_items.order_id as order_id
      , order_items.created_at
      , COUNT(DISTINCT repeat_order_items.id) AS number_subsequent_orders
      , MIN(repeat_order_items.created_at) AS next_order_date
      , MIN(repeat_order_items.order_id) AS next_order_id
FROM "PUBLIC"."ORDER_ITEMS" AS order_items
LEFT OUTER JOIN "PUBLIC"."ORDER_ITEMS" AS repeat_order_items
ON order_items.user_id = repeat_order_items.user_id
AND order_items.created_at < repeat_order_items.created_at
 GROUP BY 1, 2
 ;;
  }

  dimension: order_id {
    type: number
    hidden: yes
    primary_key: yes
    sql: ${TABLE}."ORDER_ID" ;;
  }

  dimension_group: created_at {
    type: time
    sql: ${TABLE}."CREATED_AT" ;;
  }

  dimension: number_subsequent_orders {
    type: number
    sql: ${TABLE}."NUMBER_SUBSEQUENT_ORDERS" ;;
  }

  dimension_group: next_order_date {
    type: time
    timeframes: [raw, date]
    hidden: yes
    sql: CAST(${TABLE}."NEXT_ORDER_DATE" AS TIMESTAMP);;
  }

  dimension: next_order_id {
    type: number
    hidden: yes
    sql: ${TABLE}."NEXT_ORDER_ID" ;;
  }
}
