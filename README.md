# Codon Optimization with LSTM

This project focuses on optimizing codon sequences using an LSTM model, framing the codon sequence generation task as a Named Entity Recognition (NER) problem in the realm of Natural Language Processing (NLP). The input to the model is a protein sequence (i.e., amino acid sequence), and the output is a corresponding codon sequence. Training was approached in three distinct ways:
1. **Valid Codons**: Invalid codons for an amino acid are masked.
2. **All Codons**: General approach without masking invalid codons.
3. **Codon Box** [https://www.nature.com/articles/s41598-020-74091-z]

## Installation and Setup
The project is implemented using the PyTorch framework, with Weights and Biases used for logging training and testing metrics.
Since the code was required to avoid .py file all the python files are converted to .txt files in this repository.
The main file to focus on is train.txt(train.py originally). 
Doc strings are provided with self explanatory code.

### Requirements
All necessary libraries are listed in `requirements.txt`. To install them:

```bash
pip install -r requirements.txt
```

### Training and Testing
Use your weights & biases api key and place it in the train.py script

To run the script
```bash
sh run.sh <cai_type> <mask> <test> <organism>
```
or
Run through docker container by building docker image by running the **dockerfile**.

1. cai_type: It tells if differentiable cai loss is to be included or not. The values can be "None", "softmax"
2. maks: It tells whether valid codon way training is done or not. The values can be "True", "None"
3. test: To specify whether testing is to be done or training.
4. organism: It specifies the dataset here in this work three dataset is used-> humans(hg19), ecoli and chinese hamster(ch). Values can be "human", "ecoli", "chinese_hamster"

## Data
The train, validation and test data loaders for each organism is saved in folders {organism}_data/ folder 
The dataset consists of pairs of amino acid  sequences and corresponding codon sequences.

## Training Data logs
The training metrics are logged here for each dataset using weights & biases:
1. Human: https://wandb.ai/spathak31121997/Codon-Optimization-hg19
2. Ecoli: https://wandb.ai/spathak31121997/Codon-Optimization-ecoli
3. Chinese Hamster: https://wandb.ai/spathak31121997/Codon-Optimization-ch

Saved best models on each dataset is stored in the following folders
1. Human: /best_model-ch/ 
2. Ecoli: /best_model-ecoli/
3. Chinese Hamster: /best_model-ch/

**[cb: Codon Box, ac: All Codon, vc: Valid Codon]**

**Note** : Permission may be required for access

## Statistical Test
KS-statistic was performed to evaluate the CAI metric distribution on test set from three different methods.
The inference from the KS test, was Codon Box and Valid Codons were >90% similar as per D-statistic on three datasets.

## License
Copyright (c) 2024 Shashank Pathak, Department of Computing Science, University of Alberta