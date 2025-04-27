# Sequencing Benchmark Datasets

This repository hosts all of the raw and processed data used in the benchmarking study by Wenming Xiao et al, published in **Nature Biotechnology** (September 2021).

## Study Overview

**Title:** Toward Best Practice in Cancer Mutation Detection with Whole-Genome and Whole-Exome Sequencing  
**Citation:** Nature Biotechnology, 39, 1141–1150 (2021)  
[Read the full article](https://www.nature.com/articles/s41587-021-00994-5)

### Key Takeaways

- **Read coverage** and choice of **variant callers** both significantly impact reproducibility in WGS and WES.  
- **WES performance** is driven by:
  - Insert fragment size  
  - Genomic copy-number content  
  - Global Imbalance Score (GIV; G > T/C > A)  
  > *GIV is a DNA-damage indicator calculated from the imbalance of variants detected in R1 vs. R2 of paired-end sequencing.*

## Available Data

### FASTQ Files

- **Manifest (JSON):** [`files/sra_explorer_metadata.json`](https://github.com/hamidghaedi/sequencing_benchmark_datasets/blob/main/files/sra_explorer_metadata.json) 
- **Sequencing runs:** [SRA SRP162370](https://www.ncbi.nlm.nih.gov/sra/?term=SRP162370) 
- **Sample metadata:** [`files/SraRunInfo.csv`](https://github.com/hamidghaedi/sequencing_benchmark_datasets/blob/main/files/SraRunInfo.csv)  
- **File-naming convention:**

<img src="https://github.com/hamidghaedi/sequencing_benchmark_datasets/blob/main/files/file_naming_convention.png" width="60%">
 Use this diagram to map SRA run IDs back to sample names and types.

### NCBI FTP Resources

The following files are available at [NCBI FTP](https://ftp-trace.ncbi.nlm.nih.gov/ReferenceSamples/seqc/)
- The call set for somatic mutations in HCC1395    
-  VCF files derived from individual WES and WGS runs,
-  bam files for BWA-MEM alignments
-  source codes

The study design used in the above-referenced paper aims to capture non-analytical and analytical factors affecting cancer mutation detection.

![image](https://github.com/hamidghaedi/sequencing_benchmark_datasets/blob/main/files/ezgif-1-3bfb46f1cf.jpg)


### RESULTS:

#### Read Quality:
- Whole-Genome Sequencing (WGS):
  
•	Six sequencing centers performed WGS using standard TruSeq PCR-free libraries from 1,000 ng input DNA.

•	Three platforms (HiSeq 4000, HiSeq X10, and NovaSeq S6000) were compared, revealing variations in read quantities and coverages among centers.

•	Libraries prepared from fresh cells exhibited uniform insert size distribution and low adapter contamination.

-	Whole-Exome Sequencing (WES):
  
•	Six sequencing centers utilized three HiSeq models for WES, demonstrating variations in sequencing yield and coverage.

•	WES libraries showed higher adapter contamination, G/C content, and variability in read mapping compared to WGS.

•	Library preparation kits (TruSeq PCR-free, TruSeq-Nano, Nextera Flex) and DNA input amounts influenced the percentage of mapped reads.



#### DNA Quality:
•	G > T/C > A mutation pair's GIV score in WES showed an inverse correlation with insert fragment size.

•	Formaldehyde-induced DNA damage in FFPE samples was assessed using the G > T/C > A GIV score.


####	Reproducibility assessment:

•	Twelve repeats of WES and WGS were performed at six sequencing centers, using three mutation callers and three aligners.

•	Both BWA and NovoAlign demonstrated a substantial pool of agreed-upon calls in WGS and WES runs, with differences observed in SNV calls.

•	WGS with Bowtie2 tended to have fewer consistent SNV calls, indicating conservative mutation calling.

•	Analysis of WGS and WES reproducibility revealed that callers and read coverage were major factors for both platforms.

•	WES reproducibility was influenced by additional factors, including insert fragment size, GC content, and GIV scores.

•	Intercenter variations for WES were larger than those for WGS, and the caller choice significantly affected reproducibility.


#### Library Preparation and DNA Input:

•	Nextera Flex library preparation was suggested for low-input DNA quantity in comparison to TruSeq-Nano.

•	FFPE processing reduced precision and recall rates for MuTect2 and Strelka2 in mutation calling.


#### Bioinformatics Pipeline Impact:

•	Bioinformatics tools like Trimmomatic and Bloom Filter Correction (BFC) were evaluated for error correction and trimming.

•	BFC showed potential for severe DNA damage, while caution was advised when correcting FFPE artifacts using bioinformatics tools.

•	The choice of caller and aligner, as well as their interaction, influenced mutation calling accuracy.

•	Genome Analysis Toolkit (GATK) processing had varying impacts on different callers, highlighting the importance of understanding how components interact.


#### Performance across sequencing centers:

•	Reproducibility of SNV calls was high for repeatable SNVs but dropped significantly for SNVs in the gray zone and nonrepeatable SNVs.

•	Two major sources of discordant SNV calls were identified: stochastic effects due to low VAF and artifacts from library preparation.


#### Multivariate Analysis:

•	Callers, read coverage, and platforms were major factors influencing the reproducibility of mutation detection in WGS and WES.

•	Tumor purity, coverage, and caller choice played significant roles in performance, with tumor purity being more influential than coverage.

•	WGS outperformed WES in terms of precision across replicates, callers, and sequencing centers.

•	Leveraging additional callers increased precision but at the cost of recall, emphasizing the importance of using sufficient library replicates during study design.

