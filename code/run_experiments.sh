#!/bin/bash


### RUN Experiment with Graph and PreTrain
PREFIX=1
echo "Experiment: ${PREFIX}"
python run_pretraining.py --model_name GBert-pretraining-${PREFIX} --num_train_epochs 5 --do_train --use_single --graph
python run_gbert.py --model_name GBert-predict-${PREFIX} --use_pretrain --pretrain_dir ../saved/GBert-pretraining-${PREFIX} --num_train_epochs 5 --do_train --graph
# Run it 15
for i in {1..15} 
do
python run_pretraining.py --model_name GBert-pretraining-${PREFIX} --use_pretrain --pretrain_dir ../saved/GBert-predict-${PREFIX} --num_train_epochs 5  --use_single --do_train --graph
python run_gbert.py --model_name GBert-predict-${PREFIX} --use_pretrain --pretrain_dir ../saved/GBert-pretraining-${PREFIX} --num_train_epochs 5 --do_train --graph
done



### RUN Experiment without Graph, but with PreTrain
PREFIX=2
echo "Experiment ${PREFIX}"
python run_pretraining.py --model_name GBert-pretraining-${PREFIX} --num_train_epochs 5 --do_train --use_single
python run_gbert.py --model_name GBert-predict-${PREFIX} --use_pretrain --pretrain_dir ../saved/GBert-pretraining-${PREFIX} --num_train_epochs 5 --do_train
# Run it 15
for i in {1..15} 
do
python run_pretraining.py --model_name GBert-pretraining-${PREFIX} --use_pretrain --pretrain_dir ../saved/GBert-predict-${PREFIX} --num_train_epochs 5  --use_single --do_train
python run_gbert.py --model_name GBert-predict-${PREFIX} --use_pretrain --pretrain_dir ../saved/GBert-pretraining-${PREFIX} --num_train_epochs 5 --do_train
done



### RUN Experiment with Graph, but without PreTrain
PREFIX=3
echo "Experiment ${PREFIX}"
python run_pretraining.py --model_name GBert-pretraining-${PREFIX} --num_train_epochs 5 --do_train --use_single --graph
python run_gbert.py --model_name GBert-predict-${PREFIX} --pretrain_dir ../saved/GBert-pretraining-${PREFIX} --num_train_epochs 5 --do_train --graph
# Run it 15
for i in {1..15} 
do
python run_pretraining.py --model_name GBert-pretraining-${PREFIX} --pretrain_dir ../saved/GBert-predict-${PREFIX} --num_train_epochs 5  --use_single --graph --do_train
python run_gbert.py --model_name GBert-predict-${PREFIX} --pretrain_dir ../saved/GBert-pretraining-${PREFIX} --num_train_epochs 5 --do_train --graph
done



### RUN Experiment without Graph and without PreTrain
PREFIX=4
echo "Experiment ${PREFIX}"
python run_pretraining.py --model_name GBert-pretraining-${PREFIX} --num_train_epochs 5 --do_train --use_single
python run_gbert.py --model_name GBert-predict-${PREFIX} --pretrain_dir ../saved/GBert-pretraining-${PREFIX} --num_train_epochs 5 --do_train
# Run it 15
for i in {1..15} 
do
python run_pretraining.py --model_name GBert-pretraining-${PREFIX} --pretrain_dir ../saved/GBert-predict-${PREFIX} --num_train_epochs 5  --use_single --do_train
python run_gbert.py --model_name GBert-predict-${PREFIX} --pretrain_dir ../saved/GBert-pretraining-${PREFIX} --num_train_epochs 5 --do_train
done




### RUN Experiment with Graph and PreTrain
PREFIX=5
echo "Experiment: ${PREFIX}"
python run_pretraining.py --model_name GBert-pretraining-${PREFIX} --num_train_epochs 5 --do_train --graph
python run_gbert.py --model_name GBert-predict-${PREFIX} --use_pretrain --pretrain_dir ../saved/GBert-pretraining-${PREFIX} --num_train_epochs 5 --do_train --graph
# Run it 15
for i in {1..15} 
do
python run_pretraining.py --model_name GBert-pretraining-${PREFIX} --use_pretrain --pretrain_dir ../saved/GBert-predict-${PREFIX} --num_train_epochs 5 --do_train --graph
python run_gbert.py --model_name GBert-predict-${PREFIX} --use_pretrain --pretrain_dir ../saved/GBert-pretraining-${PREFIX} --num_train_epochs 5 --do_train --graph
done