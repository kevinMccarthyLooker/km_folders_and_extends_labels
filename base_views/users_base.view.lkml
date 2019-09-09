include: "/autogenerated_views/users.view"
include: "/**/*value_format_names*"


#base reordered{
# dimension: id             {}
# dimension: email          {}
# dimension: traffic_source {}
# dimension: first_name     {}
# dimension: last_name      {}
# dimension: age            {}
# dimension: gender         {}
# dimension: country        {}
# dimension: state          {}
# dimension: city           {}
# dimension: zip            {}
# dimension: latitude       {}
# dimension: longitude      {}
# dimension_group: created  {}
# measure: count            {}
#}end__base reordered

#fields with custom sql referencing base fields.  specify type (if not string) and sql.
view: users_custom_fields {
  extends: [users]
  dimension: gender_raw {type:string hidden:yes sql:${TABLE}.gender;;}
  dimension: gender {
    case: {
      when:{sql:${gender_raw}='Male';;label:"Male"}
      else: "Female"
    }
  }

  dimension: salutation {
    case: {
      when:{sql:${gender_raw}='Male';;label:"Mr."}
      else: "Ms."
    }
  }
  dimension: is_male {
    type: yesno
    sql:${gender_raw}='Male';;
  }
  dimension: location {
    type: location
    sql_latitude: ${latitude} ;;
    sql_longitude: ${longitude} ;;
  }
  dimension: age_tier {
    type: tier
    tiers: [20,30,40,50,60,70,80]
    style: integer
    sql: ${age} ;;
  }
  dimension_group: since_created {
    type: duration
    intervals: [day,week,month,quarter,year]
#     convert_tz: no
    sql_start: ${created_date} ;;
    sql_end: date(getdate()) ;;
  }
}

#base reordered + custom{
# dimension: id                   {}
# dimension: email                {}
# dimension: traffic_source       {}
# dimension: first_name           {}
# dimension: last_name            {}
# dimension: age                  {}
# dimension: gender               {}
# dimension: country              {}
# dimension: state                {}
# dimension: city                 {}
# dimension: zip                  {}
# dimension: latitude             {}
# dimension: longitude            {}
# dimension_group: created        {}
# measure: count                  {}
# dimension: salutation           {}
# dimension: is_male              {}
# dimension: location             {}
# dimension: age_tier             {}
# dimension_group: since_created  {}
#}end__base reordered + custom

view: users__hide_system_keys {
dimension: id             {hidden: yes}
}

view: users__testing_override_unhide_all {
dimension: id             {hidden:no}
dimension: email          {hidden:no}
dimension: traffic_source {hidden:no}
dimension: first_name     {hidden:no}
dimension: last_name      {hidden:no}
dimension: age            {hidden:no}
dimension: gender         {hidden:no}
dimension: country        {hidden:no}
dimension: state          {hidden:no}
dimension: city           {hidden:no}
dimension: zip            {hidden:no}
dimension: latitude       {hidden:no}
dimension: longitude      {hidden:no}
dimension_group: created  {hidden:no}
measure: count            {hidden:no}
dimension: salutation     {hidden:no}
dimension: is_male        {hidden:no}
dimension: location       {hidden:no}
dimension: age_tier       {hidden:no}
dimension_group: since_created  {hidden:no}
}

view: users__descriptions {
dimension: email            {description:"email given at point of sale"}
dimension: traffic_source   {description:"email vs web, etc"}
dimension: first_name       {description:"given name"}
}

view: users__group_labels {
dimension: city             {group_label:"User Location Info"}
dimension: country          {group_label:"User Location Info"}
dimension: latitude         {group_label:"User Location Info"}
dimension: longitude        {group_label:"User Location Info"}
dimension: state            {group_label:"User Location Info"}
dimension: zip              {group_label:"User Location Info"}
dimension: traffic_source   {group_label:"User Location Info"}

dimension: email            {group_label:"User Contact Info"}
dimension: first_name       {group_label:"User Contact Info"}
dimension: last_name        {group_label:"User Contact Info"}

dimension: age              {group_label:"Demographic Info"}
dimension: gender           {group_label:"Demographic Info"}
dimension: salutation       {group_label:"Demographic Info"}
dimension: is_male          {group_label:"Demographic Info"}
dimension: age_tier         {group_label:"Demographic Info"}
}

view: users__labels {
measure: count            {label:"User Count"}
}

view: users_anonymized_by_hiding {
dimension: id             {hidden:yes}#may or may not have hid this for other reasons (ID has no business value). Hide if using anonymized
dimension: email          {hidden:yes}
dimension: first_name     {hidden:yes}
dimension: last_name      {hidden:yes}
dimension: latitude       {hidden:yes}
dimension: longitude      {hidden:yes}
dimension: location       {hidden:yes}
}

access_grant: users_anonymized_info_access_grant {
  user_attribute: users_anonymized_info_access_grant
  allowed_values: ["Yes"]
}
view: users_anonymized_using_access_grant {
dimension: id             {required_access_grants:[users_anonymized_info_access_grant]}#may or may not have hid this for other reasons (ID has no business value). Hide if using anonymized
dimension: email          {required_access_grants:[users_anonymized_info_access_grant]}
dimension: first_name     {required_access_grants:[users_anonymized_info_access_grant]}
dimension: last_name      {required_access_grants:[users_anonymized_info_access_grant]}
dimension: latitude       {required_access_grants:[users_anonymized_info_access_grant]}
dimension: longitude      {required_access_grants:[users_anonymized_info_access_grant]}
dimension: location       {required_access_grants:[users_anonymized_info_access_grant]}
}

view: users__value_formats {
}

#DISABLED: access grant override {
# access_grant: users_is_admin_access_grant {
#   user_attribute: is_admin
#   allowed_values: ["Yes"]
# }

#override like this doesn't work
# view: users_admin_access_grants_override {
# required_access_grants:[users_is_admin_access_grant]
# dimension: id             {required_access_grants:[]}
# dimension: email          {required_access_grants:[]}
# dimension: traffic_source {required_access_grants:[]}
# dimension: first_name     {required_access_grants:[]}
# dimension: last_name      {required_access_grants:[]}
# dimension: age            {required_access_grants:[]}
# dimension: gender         {required_access_grants:[]}
# dimension: country        {required_access_grants:[]}
# dimension: state          {required_access_grants:[]}
# dimension: city           {required_access_grants:[]}
# dimension: zip            {required_access_grants:[]}
# dimension: latitude       {required_access_grants:[]}
# dimension: longitude      {required_access_grants:[]}
# dimension_group: created  {required_access_grants:[]}
# measure: count            {required_access_grants:[]}
# dimension: salutation     {required_access_grants:[]}
# dimension: is_male        {required_access_grants:[]}
# dimension: location       {required_access_grants:[]}
# dimension_group: since_created  {}
# }
#}END DISABLED: access grant override

view: users_base {
  extends: [
    users
    ,users_custom_fields

    ,users__labels
    ,users__group_labels
    ,users__descriptions
    ,users__value_formats

    ,users__hide_system_keys
    ,users_anonymized_by_hiding
#     ,users__testing_override_unhide_all

#     ,users_anonymized_using_access_grant
#     ,users_admin_access_grants_override

    ]
  }
