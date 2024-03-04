## Adult GTEx Analysis V8 RNA-Seq 2017-06-05

## Gene TPMs [1.5 GB]
## GTEx_Analysis_2017-06-05_v8_RNASeQCv1.1.9_gene_tpm.gct.gz
wget https://storage.googleapis.com/adult-gtex/bulk-gex/v8/rna-seq/GTEx_Analysis_2017-06-05_v8_RNASeQCv1.1.9_gene_tpm.gct.gz
gunzip -c GTEx_Analysis_2017-06-05_v8_RNASeQCv1.1.9_gene_tpm.gct.gz | head -n 3 | sed 1,2d | tr '\t' '\n' | sed 1,2d | less > samples.txt

## Median gene-level TPM by tissue [6.6 MB]
## GTEx_Analysis_2017-06-05_v8_RNASeQCv1.1.9_gene_median_tpm.gct.gz
wget https://storage.googleapis.com/adult-gtex/bulk-gex/v8/rna-seq/GTEx_Analysis_2017-06-05_v8_RNASeQCv1.1.9_gene_median_tpm.gct.gz

## Transcript TPMs [3.4 GB]
## GTEx_Analysis_2017-06-05_v8_RSEMv1.3.0_transcript_tpm.gct.gz
wget https://storage.googleapis.com/adult-gtex/bulk-gex/v8/rna-seq/GTEx_Analysis_2017-06-05_v8_RSEMv1.3.0_transcript_tpm.gct.gz
