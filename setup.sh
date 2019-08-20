echo ""
echo "Initializing ArchiveSpark environment..."

if [ ! -f /config/kernel.json ]; then
    cp /kernel.json /config/kernel.json
fi

if [ ! -f /config/run.sh ]; then
    cp /run.sh /config/run.sh
fi

if [ ! -f /config/jupyter_notebook_config.py ]; then
    cp /jupyter_notebook_config.py /config/jupyter_notebook_config.py
fi

if [ ! -d /config/spark ]; then
    curl -L -O --progress-bar http://archive.apache.org/dist/spark/spark-2.1.3/spark-2.1.3-bin-hadoop2.7.tgz
    tar -xf spark-2.1.3-bin-hadoop2.7.tgz 
    mv spark-2.1.3-bin-hadoop2.7 /config/spark
    rm spark-2.1.3-bin-hadoop2.7.tgz
fi

if [ ! -d /config/toree ]; then
    curl -L -O --progress-bar https://archive.org/~helge/ArchiveSpark/toree2_dynamic_lib.tar.gz
    tar -xf toree2_dynamic_lib.tar.gz
    mv toree2_dynamic_lib /config/toree
    rm toree2_dynamic_lib.tar.gz
fi

if [ ! -d /config/lib ]; then
    mkdir /config/lib
    curl -L -O --progress-bar https://github.com/helgeho/ArchiveSpark/releases/download/v.3.0/archivespark-assembly-3.0.jar
    curl -L -O --progress-bar https://github.com/helgeho/ArchiveSpark/releases/download/v.3.0/archivespark-assembly-3.0-deps.jar
    mv archivespark-assembly-3.0.jar /config/lib
    mv archivespark-assembly-3.0-deps.jar /config/lib
fi

mkdir -p /root/.jupyter
cp /config/jupyter_notebook_config.py /root/.jupyter/jupyter_notebook_config.py

mkdir -p /root/.local/share/jupyter/kernels/ArchiveSpark
cp /config/kernel.json /root/.local/share/jupyter/kernels/ArchiveSpark/kernel.json

cd /notebooks

echo "Done. Thanks for using ArchiveSpark!"
echo ""

/run.sh