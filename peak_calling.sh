#$ -S /bin/bash
#$ -cwd
#$ -j yes
#$ -V

echo 'Todo OK antes de leer parámetros' >> /home/bag1/temp/prr5_samples/log/debug

#Parámetros de entrada

RES=$1
echo '$RES:' >> /home/bag1/temp/prr5_samples/log/debug
echo $RES >> /home/bag1/temp/prr5_samples/log/debug
ANNO=$2
echo '$ANNO:' >> /home/bag1/temp/prr5_samples/log/debug
echo $ANNO >> /home/bag1/temp/prr5_samples/log/debug
OUTPUT=$3
echo '$OUTPUT:' >> /home/bag1/temp/prr5_samples/log/debug
echo $OUTPUT >> /home/bag1/temp/prr5_samples/log/debug
WD=$4
echo '$WD:' >> /home/bag1/temp/prr5_samples/log/debug
echo $WD >> /home/bag1/temp/prr5_samples/log/debug
MAIN_FOLDER=$5
echo '$MAIN_FOLDER:' >> /home/bag1/temp/prr5_samples/log/debug
echo $MAIN_FOLDER >> /home/bag1/temp/prr5_samples/log/debug
INS=$6
echo '$INS:' >> /home/bag1/temp/prr5_samples/log/debug
echo $INS >> /home/bag1/temp/prr5_samples/log/debug
NDG=$7
OVERLAP=$8
echo $NDG >> /home/bag1/temp/prr5_samples/log/debug
echo $OVERLAP >> /home/bag1/temp/prr5_samples/log/debug

#MACS2

cd $MAIN_FOLDER/results

macs2 callpeak -t ../samples/chip/chip.sam -c ../samples/input/input.sam -f SAM --outdir . -n prr5


#PeakAnnotator
java -jar $INS/PeakAnnotator.jar -u NDG -g all -p prr5_summits.bed -a $ANNO -o .


#Ejecutar script en R

Rscript --vanilla $INS/target_genes.R prr5_summits.overlap.bed prr5_summits.ndg.bed $OUTPUT
