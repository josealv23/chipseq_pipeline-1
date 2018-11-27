#**ChipSeq pipeline**#

**Description**

**Installation and dependencies**

FastaQC - FastQC gives general quality metrics about your reads. It provides information about the quality score distribution across your reads, the per base sequence content (%T/A/G/C). You get information about adapter contamination and other overrepresented sequences.
[www.bioinformatics.babraham.ac.uk/projects/fastqc/]

Bowtie - 

Macs - MACS, or Model-based Analysis of ChIP-Seq, is used for capturing the enriched regions of sequence reads. It takes the influence of genome complexity into consideration, and improves the spatial resolution of binding sites through combining the information of both sequencing tag position and orientation.

[liulab.dfci.harvard.edu/MACS/]

PeakAnnotator - [https://www.ebi.ac.uk/research/bertone/software]

R and Rscript - [https://stat.ethz.ch/R-manual/R-devel/library/utils/html/Rscript.html]

Java.jar -

SGE - [http://genomics.princeton.edu/support/grids/sge.shtml]


**Usage**

We recommend using BASH to run pipelines.

`bash <chipseq_pipeline> <params.txt>`

We also recommend to copy the folder "Scripts" containing Java.jar into the installation folder

`cp <file location> <installation folder>`

**Params:**

working_directory: 

main_folder:  prr5_samples

genome_folder: location of the file.fa containing the genome

annotation_folder: location of the file.gtf containing the genome

installation_folder: 

chip_location: location of the fastq file 

input_location: location of the fastq file 

output.file: location of the output file with the result of target genes 

**Example**

