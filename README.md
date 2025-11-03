# Project Description

`code/final_make_figures.R`

  - read in data from `data/breast-cancer.data`
  - create bar plots of the data
  - saves figure as `combined_figure.rds` objects in `figures/` folder
  
`code/final_make_table.R`

  - read in data from `data/breast-cancer.data`
  - create table 1 of the data
  - saves table as `table_one.rds` objects in `tables/` folder
  
`code/final_render_report.R`

  - renders `Final-Project.Rmd`
  - integrates the saved table and figure into the final report

`Final-Project.Rmd`

  - reads table 1 from `tables/table_one.rds` and figures from `figures/combined_figure.rds`
  - makes the table and figure appear in the final report

`Makefile`

  - contains rules for building the report
  - `make` to build the report
  - `make clean` to remove generated files

## How to generate the report

  - Run `make` in the terminal to generate the report `Final-Project.html`.
  
## Report Summary

The final report (`Final-Project.html`) provides an overview of the Breast Cancer dataset, including:

- **Summary Table (Table 1):**  
  Displays key statistics (e.g., counts and proportions) for major variables such as diagnosis, age, and tumor characteristics.

- **Combined Figure:**  
  Presents bar plots that visualize the distribution of selected variables, allowing for an intuitive comparison of feature frequencies.

Together, these outputs help summarize and visualize important trends in the dataset, offering insights into the underlying structure of the data.
