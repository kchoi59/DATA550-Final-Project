here::i_am(
  "code/final_render_report.R"
)

# create output directory if it doesn't exist
if (!dir.exists("report")) {
  dir.create("report")
}

# generate table
source("code/final_make_table1.R")

# generate figure
source("code/final_make_figures.R")

rmarkdown::render(
  here::here("Final-Project.Rmd"),
  output_file = here::here("report", "Final-Project.html")
)
