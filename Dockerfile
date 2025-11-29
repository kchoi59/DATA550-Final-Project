# Start from rocker/tidyverse
FROM rocker/tidyverse as base

# Install system dependencies for R packages
RUN apt-get update && apt-get install -y \
    pandoc \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    && apt-get clean
    
# Make project directory
RUN mkdir /project
WORKDIR /project

# Make subfolders
RUN mkdir code data figures tables report

# Copy project files individually (no COPY . . !!!)
COPY Dockerfile .
COPY Makefile .
COPY Final-Project.Rmd .
COPY README.md .
COPY README.html .

# Copy data files
COPY data/ data/

# Copy your code subfolders
COPY code/ code/ 

# Copy renv infrastructure carefully
RUN mkdir -p renv
COPY renv.lock renv.lock
COPY .Rprofile .Rprofile
COPY renv/activate.R renv/activate.R
COPY renv/settings.json renv/settings.json

# Set renv cache location
RUN mkdir -p renv/.cache
ENV RENV_PATHS_CACHE renv/.cache

# Restore R package environment without prompts
RUN Rscript -e "renv::restore(prompt = FALSE)"

# Final command to render the report
CMD Rscript code/final_make_figures.R
CMD Rscript code/final_make_table1.R
CMD Rscript code/final_render_report.R














