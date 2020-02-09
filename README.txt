Based on https://github.com/jupyter/docker-stacks


To run docker image (juypter notebook)

docker run -p 8888:8888 jupyter/datascience-notebook:latest
Instructions are given of the web address to run


Specify working in the local directory
docker run --rm -p 8888:8888 -e JUPYTER_ENABLE_LAB=yes -v "$PWD":/home/jovyan/work jupyter/datascience-notebook:latest
