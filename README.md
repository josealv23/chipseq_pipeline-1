#**ChipSeq pipeline**#

**Description**
ChIP-seq is a method used to analyze protein interactions with DNA. ChIP-seq combines chromatin immunoprecipitation with DNA sequencing to infer the possible binding sites of DNA-associated proteins.

This pipeline will give you a list of target genes (.txt), as well as a chart with peaks in .xls and four .bed files. from an input genome.

**Installation and dependencies**

1. Copy link url for every file in the chipseq_pipeline repository.
2. Get into your console and download each one by using `wget <link url>`
3. If the file is a file.zip, use `unzip <file.zip>`

For the properly usage of this pipeline, you will need to install some dependencies.

**You will need to install:**


[FastaQC](www.bioinformatics.babraham.ac.uk/projects/fastqc/) - FastQC gives general quality metrics about your reads. It provides information about the quality score distribution across your reads, the per base sequence content (%T/A/G/C). You get information about adapter contamination and other overrepresented sequences.

[Bowtie](https://sourceforge.net/projects/bowtie-bio/files/bowtie/1.2.2) - Bowtie is an ultrafast, memory-efficient short read aligner. It aligns short DNA sequences (reads) to the human genome at a rate of over 25 million 35-bp reads per hour. Bowtie indexes the genome with an FM index to keep its memory footprint small: typically about 2.2 GB for the human genome (2.9 GB for paired-end).

[Macs](https://github.com/taoliu/MACS) - MACS, or Model-based Analysis of ChIP-Seq, is used for capturing the enriched regions of sequence reads. It takes the influence of genome complexity into consideration, and improves the spatial resolution of binding sites through combining the information of both sequencing tag position and orientation.

[PeakAnnotator](https://www.ebi.ac.uk/research/bertone/software) - Assist in annotation of genome-wide signal enrichment peaks derived from experimental results. PeakAnnotator couples a modified version of the nested containment list (NCList) algorithm to a binary search for determining functional elements proximal to peak loci. It integrates three subroutines: Nearest Downstream Gene (NDG), Transcription Start Site (TSS) and Overlap Data Sets (ODS). The software is a part of the PeakAnalyzer software.


[R and Rscript](https://stat.ethz.ch/R-manual/R-devel/library/utils/html/Rscript.html)

[SGE](http://genomics.princeton.edu/support/grids/sge.shtml) - SGE, Sun Grid Engine, is an open source distributed computing management system. It is through SGE commands that jobs are submitted, monitored, deleted, and otherwise managed. In order for SGE to work properly, the SGE_ROOT environment variable must be set appropriately for the cluster you are using. 


**Usage**

We recommend using BASH to run pipelines.

`bash <chipseq_pipeline> <params.txt>`

We also recommend copying the folder "Scripts" containing Java.jar into the installation folder

`cp <file location> <installation folder>`

The following is a list of files provided with your ChIP-Seq analysis:


Raw unprocessed gzipped FASTQ files

FASTQC report with basic sequencing quality statistics

Mapped BAM files (sorted -> low-qual filtered -> duplicates removed)

Wiggle and BigWig tracks

ChIP-Seq quality measures (phantompeakqualtools)

HOMER generated analysis output files

MACS2 generated analysis output files

Peak annotations


**Params:**

working_directory: location where the main folder is going to be created. 

main_folder:  name the main folder

genome_folder: location of the file.fa containing the genome

annotation_folder: location of the file.gtf containing the genome

installation_folder: location of the chipseq pipeline

chip_location: location of the fastq file - chip

input_location: location of the fastq file - input

output.file: location of the output file with the result of target genes 

**Example**

Download the params.txt into your installation folder, and prr5_samples in /home/user.

Then, run `bash chipseq_pipeline params.txt`

A folder called temp will be created. Your results will be located into temp/prr5_samples/results.



