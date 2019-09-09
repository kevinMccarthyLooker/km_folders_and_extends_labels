include: "/base_views/users_base.view"
view: user__totals_support {
  extends: [users_base]
#   measure: max_sale_price {
#     hidden: yes #support fields hidden
#     type: max
#     sql: ${sale_price} ;;
#   }
#   measure: min_sale_price {
#     hidden: yes #support fields hidden
#     type: min
#     sql: ${sale_price} ;;
#   }
#   measure: sale_price_gap {
#     hidden: yes #support fields hidden
#     type: number
#     sql: ${max_sale_price}-${min_sale_price} ;;
#   }
}

view: users__totals {
  derived_table: {
    explore_source: users_and_their_order_items {
      column: users_id {field:users.id}
      column: order_item_count {field:order_items.count}
      column: max_sale_price {field:order_items.max_sale_price}
      column: min_sale_price {field:order_items.min_sale_price}
      column: sale_price_gap {field:order_items.sale_price_gap}
    }
  }
  dimension: users_id {}
  dimension: order_item_count {}
  dimension: max_sale_price {type:number}
  dimension: min_sale_price {type:number}
  dimension: sale_price_gap {type:number}
}

view: users__totals_with_bind_all {
  extends: [users__totals]
  derived_table: {
    explore_source: users_and_their_order_items {
      bind_all_filters: yes
    }
  }
}
