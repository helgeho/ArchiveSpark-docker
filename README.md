# ArchiveSpark on Docker

This is the easiest way to use [ArchiveSpark](https://github.com/helgeho/ArchiveSpark) on your local machine or server.

The first time you run this Docker container, it will download all required dependencies and start [Jupyter](http://jupyter.org), ready for you to run all operations provided by ArchiveSpark in an interactive environment.

Simply run these commands after you have installed [Docker](https://www.docker.com/) to build the image and run the container:
```
git clone https://github.com/helgeho/ArchiveSpark-docker.git
docker build -t archivespark ArchiveSpark-docker
docker run --rm -ti -v /path/to/config/dir:/config -v /path/to/notebooks/dir:/notebooks -p 8888:8888 archivespark
```

Change the `/path/to/config/dir` and `/path/to/notebooks/dir` paths to local folders of your choice. The config folder is where all dependencies and config files will be stored. You can change these configurations later to customize your setup. Please restart the container after you reconfiguring something. The notebooks folder is where your notebooks will be stored. Examples can be found and downloaded from here: https://github.com/internetarchive/ArchiveSpark/blob/master/docs/Recipes.md

If you need additional paths in inside your Docker container, such as a data folder to load a dataset from, just add those to your Docker command above, e.g., `-v /path/to/data/dir:/data`, and it will be available to ArchiveSpark under `/data`.

Once the Docker container has started, you can access the included Jupyter instance in your browser under
`http://localhost:8888`.
