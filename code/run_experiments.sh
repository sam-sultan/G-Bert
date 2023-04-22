#!/bin/bash


### RUN Experiment with Graph and PreTrain
python run_pretraining.py --model_name GBert-pretraining-1 --num_train_epochs 5 --do_train --graph
python run_gbert.py --model_name GBert-predict-1 --use_pretrain --pretrain_dir ../saved/GBert-pretraining-1 --num_train_epochs 5 --do_train --graph
# Run it 15
for i in {1..15} 
do
python run_pretraining.py --model_name GBert-pretraining-1 --use_pretrain --pretrain_dir ../saved/GBert-predict-1 --num_train_epochs 5 --do_train --graph
python run_gbert.py --model_name GBert-predict-1 --use_pretrain --pretrain_dir ../saved/GBert-pretraining-1 --num_train_epochs 5 --do_train --graph
done