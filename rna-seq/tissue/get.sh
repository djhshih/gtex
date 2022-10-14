#!/bin/bash

url=https://storage.googleapis.com/gtex_analysis_v8/rna_seq_data/gene_tpm

for f in $(cat files.txt); do
	wget $url/$f
done
