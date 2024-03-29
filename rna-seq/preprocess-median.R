library(io)

x <- qread("GTEx_Analysis_2017-06-05_v8_RNASeQCv1.1.9_gene_median_tpm.gct.gz");

# remove features with duplicated gene names

idx <- duplicated(x$meta$Description);
print(x$meta[idx, ])

valid <- !idx;
y <- x;
y$meta <- y$meta[valid, ];
y$data <- y$data[valid, ];

# use gene names

colnames(y$meta) <- c("ensembl_id", "gene");
y$meta <- y$meta[, 2:1];
rownames(y$data) <- y$meta$gene;

# log transformation
y$data <- as.matrix( log(y$data + 1) );

qwrite(y, "expr_gtex_tissue-median_ltpm_symbol.rds");
