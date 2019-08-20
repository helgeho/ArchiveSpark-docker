FROM continuumio/anaconda:2019.07
MAINTAINER helge@archive.org

ENV PATH="${PATH}:/opt/conda/bin"

# Install Jupyter and Java

RUN /opt/conda/bin/conda install openjdk=8.0.152 jupyter -y --quiet

# Copy files

COPY jupyter_notebook_config.py /jupyter_notebook_config.py

COPY setup.sh /setup.sh
RUN chmod +x /setup.sh

COPY run.sh /run.sh
RUN chmod +x /run.sh

COPY kernel.json /kernel.json

# Setup and run

VOLUME /config
VOLUME /notebooks
EXPOSE 8888

CMD ["sh", "/setup.sh"]