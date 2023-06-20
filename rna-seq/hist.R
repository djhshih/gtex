library(io)

x <- qread("GTEx_Analysis_2017-06-05_v8_RNASeQCv1.1.9_gene_tpm.gct.gz");

x$data <- as.matrix(x$data);

options(plot.device = pdf);

qdraw(
	hist(log2(x$data[x$data > 0] + 1), breaks=100),
	file = "gtex-ltpm-hist.pdf"
)
