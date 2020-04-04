# Container description

Description of the container is found in the following location https://hub.docker.com/repository/docker/gwongastro/favor/general

# Running jupyter notebooks via docker on localhost

How to run the favor docker container on localhost.  This is based on https://github.com/jupyter/docker-stacks.

To run the docker image (juypter notebook), use the following command in a terminal.

docker run -p 8888:8888 jupyter/datascience-notebook:latest
Instructions are given in the terminal on the web address to use in the web browser.

If you want to work with files and data on the local host use the following command (navigate to the directory you want first).
docker run --rm -p 8888:8888 -e JUPYTER_ENABLE_LAB=yes -v "$PWD":/home/jovyan/work jupyter/datascience-notebook:latest



# Converting docker container to a Singularity container

The following command can be used on Linux systems or HPC servers such as Pawsey servers Magnus and Nimbus.
To run the jupyter notebook you will need to convert the Docker image to a Singularity image through the following command:

sudo singularity build favor_singularityContainer.sif docker://gwongastro/favor:version2

It is assumed that singularity is already installed, if not check the following link https://sylabs.io/guides/3.5/admin-guide/installation.html.  If you need to specify the directory to write the container to use the following command:

sudo singularity build --tmpdir /extension/tmp/ favor_singularity.sif docker://gwongastro/favor:version2

where /extension/tmp/ is the location you wish to save the container.

## Running singularity and interact with a local directory

sudo singularity run -B $PWD:/opt/notebooks —writable dir_favor

