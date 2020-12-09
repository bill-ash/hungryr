library(tidyverse)
library(hungryr)


# Login - get orders  -----------------------------------------------------
me <- gh_auth()
response <- get_orders(me, pageNum = 1, pageSize = 1000)


# Document  ---------------------------------------------------------------

response %>%
  unnest(results.restaurants) %>%
  count(name) %>%
  mutate(name = fct_reorder(name, n)) %>%
  ggplot(aes(n, name)) +
  geom_col() +
  labs(title = "Bill's favorite places to eat.",
       x = 'count', y = '')


response %>%
  unnest(results.restaurants) %>%
  arrange(results.start_time) %>%
  mutate(cum_sum = cumsum(as.double(results.payments.total)),
         cum_sum  = cum_sum * .01,
         results.start_time = as.Date(results.start_time)
         ) %>%
  ggplot(aes(results.start_time, cum_sum, group = 1)) +
  geom_line() +
  scale_x_date(date_breaks = 'month', date_labels = '%b\n%y') +
  scale_y_continuous(labels = scales::dollar_format()) +
  labs(title = "Seamless: cumulative dollars spent",
       x = '', y = '') +
  theme_light()
