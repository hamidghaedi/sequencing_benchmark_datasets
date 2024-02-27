# 
A repo on datasets used in Sequencing benchmarked study, Nat Biotech, September 2021:

Takeaways from that study:

- read coverage and variant callers influenced both WGS and WES reproducibility
- WES performance was influenced by insert fragment size, genomic copy content, and the global imbalance score (GIV; G > T/C > A). The GIV score is DNA damage indicator and is computed based on the global imbalance between variants detected in R1 and R2 in PE sequencing.

Datasets from Toward best practice in cancer mutation detection with whole-genome and whole-exome sequencing[Nature Biotechnology volume 39, pages1141–1150 (2021)](https://www.nature.com/articles/s41587-021-00994-5)
- FASTQ files: manifest file (json) is available in the [files](https://github.com/hamidghaedi/sequencing_benchmark_datasets/blob/main/files/sra_explorer_metadata.json) directory.

The following files are available at [NCBI FTP](https://ftp-trace.ncbi.nlm.nih.gov/ReferenceSamples/seqc/)
- The call set for somatic mutations in HCC1395    
-  VCF files derived from individual WES and WGS runs,
-  bam files for BWA-MEM alignments
-  source codes

The study design used in the above-referenced paper aims to capture non-analytical and analytical factors affecting cancer mutation detection.

![image](https://github.com/hamidghaedi/sequencing_benchmark_datasets/blob/main/files/ezgif-1-3bfb46f1cf.jpg)
