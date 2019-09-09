connection: "thelook_events_redshift"

include: "/explores/base_explores.explore*"

explore: users_unrestricted {
  extends: [users_explore]
}
