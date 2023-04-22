#!/bin/bash

python -m pip uninstall -y virtualenv

python -m pip install virtualenv

virtualenv venv --python=3.9

source venv/bin/activate \
  && python -m pip install --upgrade pip \
  && pip install wheel \
  && pip3 install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu118 \
  && pip install dill pandas tqdm tensorboardX \
  && pip install scikit-learn torch_geometric==1.0.3 \
  && pip install torch-scatter torch-sparse torch-cluster torch-spline-conv -f https://data.pyg.org/whl/torch-2.0.0+cu118.html

git clone https://github.com/sam-sultan/G-Bert.git

mv scatter-fix.py venv/lib/python3.9/site-packages/torch_geometric/utils/scatter.py
