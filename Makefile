Final-Project.html: Final-Project.Rmd code/final_make_figures.R code/final_make_table1.R data/breast-cancer.data
	Rscript code/final_render_report.R

# create table
tables/table_one.rds: code/final_make_table1.R
	Rscript code/final_make_table1.R

# create figure
figures/combined_figure.rds: code/final_make_figures.R
	Rscript code/final_make_figures.R

.PHONY: clean
clean:
	rm -f figures/*.rds && rm -f tables/*.rds && rm -f Final-Project.html
	
.PHONY: install
install:
    Rscript -e "renv::restore(prompt = FALSE)"