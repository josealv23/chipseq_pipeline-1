#$-S /bin/bash 
#$ -cwd 
#$ -j yes
#$ -V

#Parámetros de entrada
SAMPLE_DIR=$1
SAMPLE_FILE=$2
SAMPLE_TYPE=$3

#
cd ${SAMPLE_DIR}

cp ${SAMPLE_FILE} ${SAMPLE_TYPE}.fq

#Procesamiento de la muestra 
bowtie -S -v 2 --best --strata -m1 ../../genome/index ${SAMPLE_TYPE}.fq > ${SAMPLE_TYPE}.sam

#Escribimos en la pizarra

echo ${SAMPLE_TYPE} DONE >> ../../log/blackboard

SAMPLES_DONE=$(wc -l ../../log/blackboard | awk '{print $1}’)
cp ${SAMPLE_FILE} ${SAMPLE_TYPE}.fq

#Procesamiento de la muestra 
bowtie -S -v 2 --best --strata -m1 ../../genome/index ${SAMPLE_TYPE}.fq > ${SAMPLE_TYPE}.sam

#Escribimos en la pizarra

echo ${SAMPLE_TYPE} DONE >> ../../log/blackboard

SAMPLES_DONE=$(wc -l ../../log/blackboard | awk '{print $1}')

if [$SAMPLES_DONE -eq 2]
then 
        qsub -N peak_calling -o peak_calling  $INS/peak_calling.sh $WD/$MAIN_FOLDER/results
fi


