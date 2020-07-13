# start from base
FROM r-base


# install system-wide deps for python and node

# copy our application code
ADD wcde /opt/wcde
WORKDIR /opt/wcde

# fetch app specific deps
RUN packages.install("shiny")
RUN packages.install("desc")
RUN packages.install("ellipsis")
RUN packages.install("googleVis")




# expose port
EXPOSE 3000

# start app
CMD [ "runApp(run.R)" ]
