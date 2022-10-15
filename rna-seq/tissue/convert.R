library(io)

in.fn <- "gene_tpm_2017-06-05_v8_breast_mammary_tissue.gct.gz";
out.fn <- "expr_gtex_breast_mammary_tissue.rds";


gz <- gzfile(in.fn);
x0 <- read.table(gz, header=TRUE, sep="\t", skip=2, check.names=FALSE, row.names=1);
x <- list(
	meta = x0[, 1:2],
	data = x[, -(1:2)]
);

# remove features with duplicated gene names

idx <- duplicated(x$meta$Description);
print(x$meta[idx, ])

valid <- !idx;
y <- x;
y$meta <- y$meta[valid, ];
y$data <- y$data[valid, ];

colnames(y$meta) <- c("ensembl_id", "gene");
y$meta <- y$meta[, 2:1];
rownames(y$data) <- y$meta$gene;

names(y)[1] <- "features";
y$data <- as.matrix( log2(y$data + 1 - min(y$data)) );

qwrite(y, out.fn);

