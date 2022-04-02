
# example table

# pro-gun control attitude AND rate a sarcastic pro-gun argument,
# THEN (position_dummy = 1 AND belief_consistent = 1 AND literal_sarcastic = 1) ;
#
# Else if they hold pro-gun control attitude and view an anti-gun control sarcastic argument
# THEN (position_dummy = 1 AND belief_consistent = 0 AND literal_sarcasric = 1)

match_table <-
  tibble::tribble( ~pro_gun_control, ~ sarcastic_pro_gun_argument, ~position_dummy, ~belief_consistent, ~literal_sarcastic,
                   TRUE,             TRUE,                        1,                1,                  1,
                   TRUE,             FALSE,                       1,                0,                  1
                 )

# create some example data - lets say this is questionnaire results or whatever

example_data <- tibble::tibble( participant_id = seq_len( 100 ),
                                pro_gun_control = rbinom( 100, size = 1, prob = 0.5 ) == 1,
                                sarcastic_pro_gun_argument = rbinom( 100, size = 1, prob = 0.5 ) == 1
                                )
# use the match table and original data to create new table with require values - via a join
result <- dplyr::left_join( example_data, match_table, by = c("pro_gun_control","sarcastic_pro_gun_argument") )
