report.html: report.Rmd code/03render_report.R make_tables make_plots
	Rscript code/03render_report.R

make_plots: clean_data
	Rscript code/02make_plots.R
	
make_tables: clean_data
	Rscript code/01make_tables.R

clean_data:
	Rscript code/00clean_data.R

.PHONY: clean
clean:
	rm -f output/*.rds && rm -f report.html
	
.PHONY: install
install:
	Rscript -e "renv::restore(prompt = FALSE)"

# DOCKER-ASSOCIATED RULES
PROJECTFILES = code/00clean_data.R code/01make_tables.R code/02make_plots.R \
	code/03render_report.R Makefile
RENVFILES = renv.lock renv/activate.R renv/settings.json

# Rule to build image
# $@ evaluates to the target name in make
final_image4: Dockerfile $(PROJECTFILES) $(RENVFILES)
	docker build -t final_image4 .
	touch $@

# Rule to build the report automatically in our container
report/report.html:
	docker run -v "$$(pwd)/report":/project/report chenyang88/final_image4
	