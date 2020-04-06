########################################################
# Purpose: Configuration file for building a docker
# image as a prototype for the FAVOR project
# Author: G. Wong (graeme.wong@csiro.au)
# Date: 06/09/19
# History
# 06/09/19 - original build with jupyter/datascience-notebook as a base
#            and added astropy, vaex
# 25/11/19 - added yt, dask
# 04/12/19 - added dask-ml
# 06/04/20 - added mayavi
# Execution:
# sudo docker build -f FAVOR_docker.txt .
# docker tag be429271e7f5 gwongastro/faver:version1
# docker push gwongastro/faver:version1
########################################################
FROM jupyter/datascience-notebook

LABEL maintainer="G. Wong <graeme.wong@csiro.au>"

USER root

RUN apt-get -y update
RUN conda update -n base conda
RUN pip install astropy
RUN pip install vaex
RUN pip install mayavi
RUN conda install --yes dask
RUN conda install -c conda-forge yt
RUN conda install -c conda-forge dask-ml
RUN jupyter nbextension install --py mayavi --user
RUN jupyter nbextension enable --py mayavi --user
