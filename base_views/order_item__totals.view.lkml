include: "/base_views/order_items_base.view"
view: order_items__totals_support {
  extends: [order_items_base]
  measure: max_sale_price {
    hidden: yes #support fields hidden
    type: max
    sql: ${sale_price} ;;
  }
  measure: min_sale_price {
    hidden: yes #support fields hidden
    type: min
    sql: ${sale_price} ;;
  }
  measure: sale_price_gap {
    hidden: yes #support fields hidden
    type: number
    sql: ${max_sale_price}-${min_sale_price} ;;
  }
}

view: order_item__totals {
  derived_table: {
    explore_source: order_items {
      column: order_id {field:order_items.order_id}
      column: order_item_count {field:order_items.count}
      column: max_sale_price {}
      column: min_sale_price {}
      column: sale_price_gap {}
    }
  }
  dimension: order_id {}
  dimension: order_item_count {}
  dimension: max_sale_price {type:number}
  dimension: min_sale_price {type:number}
  dimension: sale_price_gap {type:number}
}
