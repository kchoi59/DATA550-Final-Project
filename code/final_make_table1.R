here::i_am("code/final_make_table1.R")



# load required packages
library(data.table)
library(gtsummary)
library(dplyr)

# load data
dat <- fread(here::here("data/breast-cancer.data"))
# add column names
colnames(dat) <- c("class", "age", "menopause", "tumor_size",
                   "inv_nodes", "node_caps", "deg_malig", "breast",
                   "breast_quad", "irradiat")




table_one <- dat %>%
  dplyr::select(age, menopause, tumor_size, inv_nodes, node_caps,
                deg_malig, breast, breast_quad, irradiat, class) %>%
  tbl_summary(
    by = class,  # stratify by recurrence status
    statistic = list(
      all_continuous() ~ "{mean} ({sd})",   # mean (SD) for continuous
      all_categorical() ~ "{n} ({p}%)"      # count (percent) for categorical
    ),
    missing = "no"  # missing values are ignored
  ) %>%
  add_p(test = list(
    all_continuous() ~ "oneway.test",  # ANOVA for continuous vars
    all_categorical() ~ "chisq.test"   # Chi-sq for categorical vars
  )) %>%
  add_overall() %>%
  bold_labels() %>%
  bold_p()



saveRDS(
  table_one,
  file = here::here("tables/table_one.rds")
)

