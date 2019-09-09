access_grant: can_see_key_fields {user_attribute: "can_see_sensitive_data" allowed_values: ["Yes"]}
connection: "thelook_events_redshift"
view: users_base {
  sql_table_name: public.users ;;
  dimension: id {
    hidden:yes
    primary_key:yes
  }
  dimension: age {
    type:number
    hidden: yes
  }
  measure: count {
    type: count
    hidden: yes
  }
}
view: users_for_base_data_testing {
  extends: [users_base]
  dimension: id {hidden:no}
  dimension: age {hidden:no}
  measure: count {hidden:no}
}
#label overrides for user table.  Can use multiple to make different labels for different specific explores
view: users_unhide_basic_fields {
  dimension: age {hidden:no}
  measure: count {hidden:no}
}
view: users_labels {
  dimension: id {label:"User Id"}
  measure: count {label:"Count Unique Users"}
}
view: users_apply_access_grants {
  dimension: id {required_access_grants:[can_see_key_fields]}
}
view: users_final {
  extends: [users_base,users_unhide_basic_fields,users_labels,users_apply_access_grants]
}
explore: users_for_base_data_testing {}
explore: users_explore {
  from: users_final
  view_name: users
}
