include: "/base_views/users_base.view"
include: "/base_views/order_items_base.view"
include: "/base_views/order_item__totals*"
include: "/users__totals*"

# explore: order_items_test {
#   from: order_items
#   view_name: order_items
# }

explore: users_explore {
  from: users_base
  view_name: users
#   join: users__totals {
#     relationship: many_to_one
#     sql_on: ${users.id}=${users__totals.user_id} ;;
#   }
}

explore: order_items {
  from: order_items__totals_support
  view_name: order_items
  join: order_item__totals {
    relationship: many_to_one
    sql_on: ${order_items.order_id}=${order_item__totals.order_id} ;;
  }
}


explore: users_and_their_order_items {
  from: users_base
  view_name: users
  join: order_items {
    from: order_items__totals_support
    relationship: one_to_many
    sql_on: ${users.id}=${order_items.user_id} ;;
  }
  join: order_item__totals {
    relationship: many_to_one
    sql_on: ${order_items.order_id}=${order_item__totals.order_id} ;;
  }
  join: users__totals {
    relationship: many_to_one
    sql_on: ${users.id}=${users__totals.users_id} ;;
  }

}

explore: order_item__totals {}
