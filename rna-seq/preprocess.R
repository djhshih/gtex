# Process expression data

library(io)

x <- qread("GTEx_Analysis_2017-06-05_v8_RNASeQCv1.1.9_gene_tpm.gct.gz");

colnames(x$meta) <- c("ensembl_id", "gene");

# strip version number from ensembl ID
x$meta$ensembl_id <- sub("\\..+", "", x$meta$ensembl_id);

# identify duplicated ensembl IDs
idx <- duplicated(x$meta$ensembl_id);
sum(idx)

rownames(x$data)[idx]
# duplicated ensembl IDs are pseudoautosomal region genes

summary(as.numeric(as.matrix(x$data[idx, ])))
# all counts are 0

filter_genes <- function(x, valid) {
	x$meta <- x$meta[valid, ];
	x$data <- x$data[valid, ];
	x
}

# therefore, remove these duplicated genes
x <- filter_genes(x, !idx);

# now, we can use the simplified ensembl IDs in the matrix
rownames(x$data) <- x$meta$ensembl_id;

# log transformation
x$data <- as.matrix( log(x$data + 1) );

# non-specific filtering

rsums <- rowSums(x$data);
bad <- rsums == 0
sum(bad)

x <- filter_genes(x, !bad);

qwrite(x, "expr_gtex.rds");
