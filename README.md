# General Introduction
FAVER (Framework for Analysis and Visualisation of Enormous datasets Remotely) designed for researchers to transparently remotely connect to a HPC server and execute their scripts.  This repository is an initial step to that path where using containers, a reseracher and develop locally on their machine and then transfer the script to a HPC facility and still work in the same environment.  The container addresses the major requirements outlined by a client in regards to importable packages and data visualisation.

# Container description

Description of the container is found in the following location https://hub.docker.com/repository/docker/gwongastro/favor/general

# Running jupyter notebooks via docker on localhost

How to run the favor docker container on localhost.  This is based on https://github.com/jupyter/docker-stacks.

To run the docker image (juypter notebook), use the following command in a terminal.

```
docker run -p 8888:8888 jupyter/datascience-notebook:latest
```

Instructions are given in the terminal on the web address to use in the web browser.

If you want to work with files and data on the local host use the following command (navigate to the directory you want first).

```
docker run --rm -p 8888:8888 -e JUPYTER_ENABLE_LAB=yes -v "$PWD":/home/jovyan/work jupyter/datascience-notebook:latest
```



# Converting docker container to a Singularity container

It is assumed that singularity is already installed, if not check the following link https://sylabs.io/guides/3.5/admin-guide/installation.html.

The following command can be used on Linux systems or HPC servers such as Pawsey servers Magnus and Nimbus.
To run the jupyter notebook you will need to convert the Docker image to a Singularity image through the following command:

```
sudo singularity build faver_singularityContainer.sif docker://gwongastro/faver:version1
```

The conversion requires a bit of space, depends of the size of the image, if you need to specify a temporary directory to use for build run the following:

```
sudo singularity build --tmpdir /extension/tmp/ faver_singularity.sif docker://gwongastro/faver:version1
```

where /extension/tmp/ is the location temporary location the container.

## Running singularity locally and interact with a local directory

```
sudo singularity run -B $PWD:/opt/notebooks —writable dir_faver
```

Where dir_faver is the location of the local directory.

## Running Singularity remotely on a cloud service and connecting

For this example, I am using the Pawsey server Nimbus (cloud service) with ubuntu installed.  This will more effective you use **screen** or **tmux** to push the jupyter notebook service to the background.  

On the cloud service run the following command:

```
singularity exec faver_singularityContainer.sif jupyter notebook --no-browser --port=8889
```
This will execute the jupyter notebook command with the option of not opening a browser (on the cloud service) and port forward to a given number (in this case port 8889, default is 8888).

On your local terminal you will be creating a ssh tunnel, which will be using one of the following commands:
```
ssh -N -f -L localhost:8000:127.0.0.1:8889 ubuntu@123.456.89.10

or

ssh -i sshKey.pem -N -f -L localhost:8000:127.0.0.1:8889 ubuntu@123.456.89.10
```

The difference between the two commands is the ssh key, this can be either saved in your ssh profile (recommended) or you can specify the ssh key location.

After running singularity to run jupyter notebook and creating the ssh tunnel, open a browser, copy the url provided from the singularity command, and modify the port number to the your local connection e.g.

```
Output from Singularity
http://127.0.0.1:8889/?token=SOME_PROVIDED_TOKEN

Change to the 8889 to 8000, and then paste in the web browser.
http://127.0.0.1:8000/?token=SOME_PROVIDED_TOKEN
```


