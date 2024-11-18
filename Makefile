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

