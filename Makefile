# Makefile for generating the final report using Docker on MacOS
# Docker image named kchoi66/final3 is used to build the report
# The report will be saved in the report/ directory

.PHONY: report clean

report: 
	docker run --rm -v "$$(pwd)/report:/project/report" kchoi66/final3
	
clean:
	rm -f figures/*.rds && rm -f tables/*.rds && rm -f Final-Project.html && rm -f report/*.html



    