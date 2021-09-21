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
      <img
         <svg style="height: 30px; fill: #FFFFFF;" class="svg-icon" viewBox="0 0 24 24">

              <path d="M10.5,13H8v-3h2.5V7.5h3V10H16v3h-2.5v2.5h-3V13z M12,2L4,5v6.09c0,5.05,3.41,9.76,8,10.91c4.59-1.15,8-5.86,8-10.91V5L12,2 z M18,11.09c0,4-2.55,7.7-6,8.83c-3.45-1.13-6-4.82-6-8.83v-4.7l6-2.25l6,2.25V11.09z"></path>

            </svg>
                  </img>
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
