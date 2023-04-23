# G-Bert
Pre-training of Graph Augmented Transformers for Medication Recommendation

## Intro
G-Bert combined the power of **G**raph Neural Networks and **BERT** (Bidirectional Encoder Representations from Transformers) for medical code representation and medication recommendation. We use the graph neural networks (GNNs) to represent the structure information of medical codes from a medical ontology. Then we integrate the GNN representation into a transformer-based visit encoder and pre-train it on single-visit EHR data. The pre-trained visit encoder and representation can be fine-tuned for downstream medical prediction tasks. Our model is the first to bring the language model pre-training schema into the healthcare domain and it achieved state-of-the-art performance on the medication recommendation task.

## Requirements
- pytorch>=0.4 (tested with torch==2.0.0 and GPU cuda118)
- python>=3.9
- virtualenv
- torch_geometric==1.0.3
- tensorboardX dill pandas tqdm scikit-learn wheel
- torch-scatter torch-sparse torch-cluster torch-spline-conv ( from https://data.pyg.org/whl/torch-2.0.0+cu118.html )

## Guide
We list the structure of this repo as follows:
```latex
.
├── [636B]  setup.sh
├── [1.3K]  scatter-fix.py
├── [4.0K]  code/
│   ├── [ 13K]  bert_models.py % transformer models
│   ├── [5.9K]  build_tree.py % build ontology
│   ├── [4.3K]  config.py % hyperparameters for G-Bert
│   ├── [ 11K]  graph_models.py % GAT models
│   ├── [   0]  __init__.py
│   ├── [9.8K]  predictive_models.py % G-Bert models
│   ├── [ 721]  run_alternative.sh % script to train G-Bert
│   ├── [ 19K]  run_gbert.py % fine tune G-Bert
│   ├── [ 19K]  run_gbert_side.py
│   ├── [ 18K]  run_pretraining.py % pre-train G-Bert
│   ├── [4.4K]  run_tsne.py # output % save embedding for tsne visualization
│   └── [4.7K]  utils.py
├── [4.0K]  data/
│   ├── [4.9M]  data-multi-side.pkl 
│   ├── [3.6M]  data-multi-visit.pkl % patients data with multi-visit
│   ├── [4.3M]  data-single-visit.pkl % patients data with singe-visit
│   ├── [ 11K]  dx-vocab-multi.txt % diagnosis codes vocabulary in multi-visit data
│   ├── [ 11K]  dx-vocab.txt % diagnosis codes vocabulary in all data
│   ├── [ 29K]  EDA.ipynb % jupyter version to preprocess data
│   ├── [ 18K]  EDA.py % python version to preprocess data
│   ├── [6.2K]  eval-id.txt % validation data ids
│   ├── [6.9K]  px-vocab-multi.txt % procedure codes vocabulary in multi-visit data
│   ├── [ 725]  rx-vocab-multi.txt % medication codes vocabulary in multi-visit data
│   ├── [2.6K]  rx-vocab.txt % medication codes vocabulary in all data
│   ├── [6.2K]  test-id.txt % test data ids
│   └── [ 23K]  train-id.txt % train data ids
└── [4.0K]  saved/
    └── [4.0K]  GBert-predict/ % model files to reproduce our result
        ├── [ 371]  bert_config.json 
        └── [ 12M]  pytorch_model.bin
```
### Preprocessing Data
We have released the preprocessing codes named data/EDA.ipynb to process data using raw files from MIMIC-III dataset. You can download data files from [MIMIC](https://mimic.physionet.org/gettingstarted/dbsetup/) and get necessary mapping files from [GAMENet](https://github.com/sjy1203/GAMENet).

### Environment Setup
To setup the environment, run the bash file below:
```bash
./setup.sh
```
This file creates a virtualenv with python version 3.9, install the pip packages listed above, and moves the scatter-fix.py into the torch_geometric pip package.

### To the run the Experiments
Run the bash file below:
```bash
./run_experiments.sh
```
The code will generate 5 different output directories for each of the model. The naming is of the directory is in this format GBert-pretraining-<MODEL_NUMBER> and GBert-predict-<MODEL_NUMBER>, they are referenced in the order below:

```latex
 ---------------------------------------------------------
| Model Numebr | Graph | Pretrain | Jaccard | PR-AUC | F1 |
 ---------------------------------------------------------
|      1       |       |          |         |        |    |
|      2       |       |          |         |        |    |
|      3       |       |          |         |        |    |
|      4       |       |          |         |        |    |
|      5       |       |          |         |        |    |
 ---------------------------------------------------------
```


## Cite 

Please cite our paper if you find this code helpful:

```
@article{shang2019pre,
  title={Pre-training of Graph Augmented Transformers for Medication Recommendation},
  author={Shang, Junyuan and Ma, Tengfei and Xiao, Cao and Sun, Jimeng},
  journal={arXiv preprint arXiv:1906.00346},
  year={2019}
}
```

## Acknowledgement
Many thanks to the open source repositories and libraries to speed up our coding progress.
- [GAMENet](https://github.com/sjy1203/GAMENet)
- [Bert_HuggingFace](https://github.com/huggingface/pytorch-pretrained-BERT)
- [pytorch_geometric](https://github.com/rusty1s/pytorch_geometric)


