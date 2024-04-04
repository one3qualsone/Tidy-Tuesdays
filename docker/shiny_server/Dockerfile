# Use the Rocker/Shiny base image
FROM rocker/shiny:4.1.0

# Install additional R packages
RUN R -e "install.packages(c('tidyverse', 'shinythemes', 'DT', 'plotly', 'rmarkdown', 'devtools', 'testthat', 'knitr', 'lubridate', 'janitor'), repos='http://cran.rstudio.com/')"

# Make the Shiny app available at port 3838
EXPOSE 3838

CMD ["/usr/bin/shiny-server.sh"]
