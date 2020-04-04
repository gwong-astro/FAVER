########################################################
# Purpose: Configuration file for building a docker
# image as a prototype for the FAVOR project
# Author: G. Wong (graeme.wong@csiro.au)
# Date: 06/09/19
# History
# 25/11/19 - added packages
#
#
# Execution:
# docker build -f /Users/user1/Documents/FAVOR/containers/Dockerfile .
#
########################################################
FROM jupyter/datascience-notebook

LABEL maintainer="G. Wong <g.wong@csiro.au>"

USER root

RUN apt-get -y update
RUN pip install astropy & pip install vaex
RUN conda install --yes dask
RUN conda update -n base conda
RUN conda install -c conda-forge yt
RUN conda install -c conda-forge dask-ml
# docker build -t gwongastro/favor:latest
# create name and tag