here::i_am(
  "code/final_render_report.R"
)

# generate table
source("code/final_make_table1.R")

# generate figure
source("code/final_make_figures.R")

rmarkdown::render(
  here::here("Final-Project.Rmd")
)
