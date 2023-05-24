## Analysis of population structure and genetic diversity in low-variance Saimaa ringed seals using low-coverage whole-genome sequence data
This repository contains scripts, a test variation dataset and other data required for replicating the analysis carried out in this project, originally described by Löytynoja et al. (2023, https://doi.org/10.1016/j.cub.2023.01.040).

### Code
Notebooks containing the code for each step of the analysis are located in the directory [scripts/](./scripts/). For steps that include both R and bash code, three notebooks are provided: one with R, one with bash and one python notebook containing the code for the entirety of the step. 

### Data
A test variation dataset of 20 contigs is located in [processed_data/2.masking-filtering/]. For the analysis steps onwards from smartpca, data required for running each step independently is provided in [processed_data/], in subdirectories named according to the analysis step at hand. The fasta index file for the reference genome is located in [data/reference/], while the reference genome can be downloaded from ENA under accession number PRJEB56423. Raw sequencing data of the Saimaa ringed seals can be found in ENA under accession number PRJEB56317. Other data required for some steps of the analysis, such as a list of sample IDs, and sample and lake coordinates are located in [data/] and [data/saimaa_map].

### Software
In addition to R packages mentioned in the publication, the following software is used:
  - BWA MEM, version 0.7.17 ([https://github.com/lh3/bwa]) 
  - VCFtools, v.01.17 ([https://github.com/vcftools/vcftools])
  - bcftools, v. 1.17 ([http://www.htslib.org/ ])
  - samtools, v.1.16.1 ([https://github.com/samtools/samtools])
  - GenomeAnalysisTK, v. 3.8-1-0 ([https://console.cloud.google.com/storage/browser/gatk-software/package-archive/gatk])
  - ANGSD, v.1.16.1 ([https://github.com/ANGSD/angsd])
  - PCANGSD, v.0.99 ([https://github.com/Rosemeis/pcangsd], [https://github.com/Rosemeis/pcangsd/releases/tag/v.0.99])
  - RepeatMasker, v. open-4.0.5 ([https://www.repeatmasker.org/ ])
  - SNPable ([https://lh3lh3.users.sourceforge.net/snpable.shtml ])
  - PLINK, v.1.90 ([https://www.cog-genomics.org/plink/])
  - convertf and smartpca from the Eigensoft package, v. 8.0.0 ([https://github.com/DReichLab/EIG])
  - fineSTRUCTURE (including ChromoPainter), v. 4.1. ([https://people.maths.bris.ac.uk/~madjl/finestructure/])
