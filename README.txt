How to run the favor docker container on localhost.  This is based on https://github.com/jupyter/docker-stacks.

To run the docker image (juypter notebook), use the following command in a terminal.

docker run -p 8888:8888 jupyter/datascience-notebook:latest
Instructions are given in the terminal on the web address to use in the web browser.


If you want to work with files and data on the local host use the following command (navigate to the directory you want first).
docker run --rm -p 8888:8888 -e JUPYTER_ENABLE_LAB=yes -v "$PWD":/home/jovyan/work jupyter/datascience-notebook:latest
