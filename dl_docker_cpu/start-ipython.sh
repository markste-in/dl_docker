#!/bin/bash
export PATH=/opt/conda/bin:${PATH}
screen -dmS ipython
screen -S ipython -p 0 -X stuff "/bin/bash -c 'source activate keras_2_2 && jupyter notebook --ip=0.0.0.0 --allow-root --NotebookApp.token='' --no-browser '"
screen -S ipython -p 0 -X stuff $(echo -ne '\015')
