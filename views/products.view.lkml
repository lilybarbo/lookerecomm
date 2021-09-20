view: products {
  sql_table_name: "PUBLIC"."PRODUCTS"
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."ID" ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}."BRAND" ;;
  }

  dimension: brand_logo {
    type: string
    sql: ${brand} ;;
    html: {% if brand._value == "O'Neill" %}
       <svg width="300" height="200">
    <rect width="100%" height="100%" fill="green" />
</svg>
        {% elsif brand._value == "Calvin Klein" %}
        <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/e/e2/Calvin_klein_logo.svg/220px-Calvin_klein_logo.svg.png">
        {% elsif brand._value == "Hanes" %}
        <img src="https://upload.wikimedia.org/wikipedia/en/thumb/f/f0/Hanes-logo.svg/150px-Hanes-logo.svg.png">
        {% elsif brand._value == "Tommy Hilfiger"%}
        <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/Tommy_hilfig_vectorlogo.svg/250px-Tommy_hilfig_vectorlogo.svg.png">
        {% else %}
        <img src="https://icon-library.net/images/no-image-available-icon/no-image-available-icon-6.jpg" height="250" width="300">
        {% endif %} ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}."CATEGORY" ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}."COST" ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}."DEPARTMENT" ;;
  }

  dimension: distribution_center_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."DISTRIBUTION_CENTER_ID" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  dimension: retail_price {
    type: number
    sql: ${TABLE}."RETAIL_PRICE" ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}."SKU" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, distribution_centers.name, distribution_centers.id, inventory_items.count]
  }
}
