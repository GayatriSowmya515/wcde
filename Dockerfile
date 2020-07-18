# start from base
FROM rocker/shiny-verse




# system libraries of general use
RUN apt-get update && apt-get install -y \
    sudo \
    pandoc \
    pandoc-citeproc \
    libcurl4-gnutls-dev \
    libcairo2-dev \
    libxt-dev \
    libssl-dev \
    libssh2-1-dev 

#install required packages
RUN R -e "install.packages(c('markdown','reshape2','tidyverse','saves','shiny','googleVis','webshot'), repos='http://cran.rstudio.com/')"





# copy our application code
COPY .  /opt/wcde
WORKDIR  /opt/wcde


#command to run the script
CMD Rscript /opt/wcde/run.R