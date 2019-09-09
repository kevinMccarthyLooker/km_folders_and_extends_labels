# value_format: "0"             # Integer (123)
# value_format: "*00#"          # Integer zero-padded to 3 places (001)
# value_format: "0 \" String\"" # Integer followed by a string (123 String)
# #   Please note "String" can be replaced with any other word
#
# value_format: "0.##"          # Number up to 2 decimals (1. or 1.2 or 1.23)
# value_format: "0.00"          # Number with exactly 2 decimals (1.23)
# value_format: "*00#.00"       # Number zero-padded to 3 places and exactly 2 decimals (001.23)
# value_format: "#,##0"         # Number with comma between thousands (1,234)
# value_format: "#,##0.00"      # Number with comma between thousands and 2 decimals (1,234.00)
# value_format: "0.000,,\" M\"" # Number in millions with 3 decimals (1.234 M)
# #   Please note division by 1 million happens automatically
# value_format: "0.000,\" K\""  # Number in thousands with 3 decimals (1.234 K)
# #   Please note division by 1 thousand happens automatically
#
# value_format: "$0"            # Dollars with 0 decimals ($123)
# value_format: "$0.00"         # Dollars with 2 decimals ($123.00)
# value_format: "\"€\"0"        # Euros with 0 decimals (€123)
# value_format: "$#,##0.00"     # Dollars with comma btwn thousands and 2 decimals ($1,234.00)
# value_format: "$#.00;($#.00)" # Dollars with 2 decimals, positive values displayed
# #   normally, negative values wrapped in parenthesis
#
# value_format: "0\%"           # Display as percent with 0 decimals (1 becomes 1%)
# value_format: "0.00\%"        # Display as percent with 2 decimals (1 becomes 1.00%)
# value_format: "0%"            # Convert to percent with 0 decimals (.01 becomes 1%)
# value_format: "0.00%"         # Convert to percent with 2 decimals (.01 becomes 1.00%)


# value_format: "$0"            # Dollars with 0 decimals ($123)
# value_format: "$0.00"         # Dollars with 2 decimals ($123.00)
named_value_format: integer_zero_padded_to_3_places {value_format:"*00#"}
# value_format: "\"€\"0"        # Euros with 0 decimals (€123)
named_value_format: euros_with_0_decimals {value_format:"\"€\"0" }
# value_format: "$#,##0.00"     # Dollars with comma btwn thousands and 2 decimals ($1,234.00)
named_value_format: Dollars_with_comma_btwn_thousands_and_2_decimals {value_format:"$#,##0.00" }
# value_format: "$#.00;($#.00)" # Dollars with 2 decimals, positive values displayed
named_value_format: Dollars_with_2_decimals_positive_values_displayed {value_format:"$#.00;($#.00)" }
# #   normally, negative values wrapped in parenthesis
#
# value_format: "0\%"           # Display as percent with 0 decimals (1 becomes 1%)
named_value_format: Display_as_percent_with_0_decimals_1_becomes_1 {value_format:"0\%" }
# value_format: "0.00\%"        # Display as percent with 2 decimals (1 becomes 1.00%)
named_value_format: Display_as_percent_with_2_decimals_1_becomes_100 {value_format:"0.00\%" }
# value_format: "0%"            # Convert to percent with 0 decimals (.01 becomes 1%)
named_value_format: Convert_to_percent_with_0_decimals_01_becomes_1 {value_format:"0%" }
# value_format: "0.00%"         # Convert to percent with 2 decimals (.01 becomes 1.00%)
named_value_format: Convert_to_percent_with_2_decimals_01_becomes_100{value_format:"0.00%"}

# value_format: "0"             # Integer (123)
named_value_format: Integer_123 {value_format:"0" }
# value_format: "*00#"          # Integer zero-padded to 3 places 001)
named_value_format: Integer_zeropadded_to_3_places_001 {value_format:"*00#" }
# value_format: "0 \" String\"" # Integer followed by a string (123 String)
# named_value_format: Integer followed by a string (123 String) {value_format:"$#,##0.00" }
# #   Please note "String" can be replaced with any other word
#
# value_format: "0.##"          # Number up to 2 decimals (1. or 1.2 or 1.23)
named_value_format: Number_up_to_2_decimals_1_or_12_or_123 {value_format: "0.##" }
# value_format: "0.00"          # Number with exactly 2 decimals (1.23)
named_value_format: Number_with_exactly_2_decimals_123 {value_format:"0.00" }
# value_format: "*00#.00"       # Number zero-padded to 3 places and exactly 2 decimals (001.23)
named_value_format: Number_zeropadded_to_3_places_and_exactly_2_decimals_00123 {value_format:"*00#.00" }
# value_format: "#,##0"         # Number with comma between thousands (1,234)
named_value_format: Number_with_comma_between_thousands_1234 {value_format:"#,##0" }
# value_format: "#,##0.00"      # Number with comma between thousands and 2 decimals (1,234.00)
named_value_format: Number_with_comma_between_thousands_and_2_decimals_123400 {value_format:"#,##0.00" }
# value_format: "0.000,,\" M\"" # Number in millions with 3 decimals (1.234 M)
named_value_format: Number_in_millions_with_3_decimals_1234_M {value_format:"0.000,,\" M\"" }
# #   Please note division by 1 million happens automatically
# value_format: "0.000,\" K\""  # Number in thousands with 3 decimals (1.234 K)
named_value_format: Number_in_thousands_with_3_decimals_1234_K {value_format:"0.000,\" K\"" }
# #   Please note division by 1 thousand happens automatically
#
# value_format: "$0"            # Dollars with 0 decimals ($123)
named_value_format: Dollars_with_0_decimals_123 {value_format:"$0" }
# value_format: "$0.00"         # Dollars with 2 decimals ($123.00)
named_value_format: Dollars_with_2_decimals_12300 {value_format:"$0.00" }
# value_format: "\"€\"0"        # Euros with 0 decimals (€123)
named_value_format: Euros_with_0_decimals_123 {value_format:"\"€\"0"  }
# value_format: "$#,##0.00"     # Dollars with comma btwn thousands and 2 decimals ($1,234.00)
named_value_format: Dollars_with_comma_btwn_thousands_and_2_decimals_123400 {value_format:"$#,##0.00" }
