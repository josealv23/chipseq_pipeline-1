#$-S /bin/bash 
#$ -cwd 
#$ -j yes
#$ -V

##Parámetros de entrada
INS=$1

##Lectura de parámetros
INS=$(grep installation_folder: $PARAMS | awk '{print $2}')
echo "installation_folder"

##MACS2

cd ../../results

macs2 callpeak -t ../samples/chip/chip.sam -c ../samples/input/input.sam -f SAM --outdir .

##PeakAnnotator
java -jar $INS/PeakAnnotator.jar -u NDG -g all -p prr5_summits.bed -a ../../annotation/chromosome_1.gtf
  
