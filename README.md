#**ChipSeq pipeline**#

**Description**

**Installation and dependencies**

FastaQC - FastQC gives general quality metrics about your reads. It provides information about the quality score distribution across your reads, the per base sequence content (%T/A/G/C). You get information about adapter contamination and other overrepresented sequences.
www.bioinformatics.babraham.ac.uk/projects/fastqc/

Bowtie - 

Macs - MACS, or Model-based Analysis of ChIP-Seq, is used for capturing the enriched regions of sequence reads. It takes the influence of genome complexity into consideration, and improves the spatial resolution of binding sites through combining the information of both sequencing tag position and orientation.
liulab.dfci.harvard.edu/MACS/

PeakAnnotator - https://www.ebi.ac.uk/research/bertone/software

R and Rscript - https://stat.ethz.ch/R-manual/R-devel/library/utils/html/Rscript.html

Java.jar -

SGE - http://genomics.princeton.edu/support/grids/sge.shtml


**Usage**

We recommend using BASH to run pipelines.

bash [chipseq pipeline] [params file]

**Params:**

working_directory: /home/bag1/temp
main_folder:  prr5_samples
genome_folder: /home/bag1/prr5_samples/genome/chromosome1.fa
annotation_folder: /home/bag1/prr5_samples/annotation/chromosome1.gtf
installation_folder: /home/bag1/opt/chipseq_pipeline
chip_location: /home/bag1/prr5_samples/samples/chip/chip_prr5_chr1.fastq
input_location: /home/bag1/prr5_samples/samples/input/input_prr5_chr1.fastq
output.file: /fran/bag1/prr5_samples/results/prr5_target_genes.txt

**Example**

