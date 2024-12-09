# First stage
FROM rocker/r-ubuntu as base

WORKDIR /project

RUN apt-get update && apt-get install -y pandoc

RUN mkdir -p renv
COPY renv.lock renv.lock
COPY .Rprofile .Rprofile
COPY renv/activate.R renv/activate.R
COPY renv/settings.json renv/settings.json

RUN mkdir renv/.cache
ENV RENV_PATHS_CACHE=renv/.cache

RUN R -e "renv::restore()"

###### DO NOT EDIT STAGE 1 BUILD LINES ABOVE ######

FROM rocker/r-ubuntu

WORKDIR /project

RUN apt-get update && apt-get install -y pandoc

COPY --from=base /project .

# Copy necessary files 
COPY Makefile Makefile
COPY report.Rmd report.Rmd

# Create required directories in the project directory
RUN mkdir code 
RUN mkdir output 
RUN mkdir raw_data 
RUN mkdir report

# Copy raw data file to the raw_data directory
COPY raw_data/indian_liver_patient.csv raw_data/indian_liver_patient.csv

# Copy local code dictionary to code directory in the image's project directory
COPY code/ code/

# Add an entry point to the container
ENTRYPOINT ["bash", "-c", "\
  Rscript code/00clean_data.R && \
  Rscript code/01make_tables.R && \
  Rscript code/02make_plots.R && \
  Rscript code/03render_report.R && \
  mkdir -p report && \
  cp output/report.pdf report/report.pdf"]


