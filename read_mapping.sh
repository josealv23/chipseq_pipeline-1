#$ -S /bin/bash
#$ -cwd
#$ -j yes
#$ -V

#Parámetros de entrada

SAMPLE_DIR=$1
SAMPLE_FILE=$2
SAMPLE_TYPE=$3
SAMPLES_DONE=$4
OUTPUT=$5
INS=$6
MAIN_FOLDER=$7
WD=$8


#
cd ${SAMPLE_DIR}

cp ${SAMPLE_FILE} ${SAMPLE_TYPE}.fq

#Procesamiento de la muestra
bowtie -S -v 2 --best --strata -m1 ../../genome/index ${SAMPLE_TYPE}.fq > ${SAMPLE_TYPE}.sam

#Escribimos en la pizarra

echo ${SAMPLE_TYPE} DONE >> ../../log/blackboard

SAMPLES_DONE=$(wc -l ../../log/blackboard | awk '{ print $1 }' )

if [ $SAMPLES_DONE -eq 2 ]
then
echo "entra en if del readmapping" >> ../../log/debug
        qsub -N peak_calling -o peak_calling ${INS}/peak_calling.sh ${INS} ${WD}/${MAIN_FOLDER}/results ${WD}/${MAIN_FOLDER}/annotation/annotation.gtf ${OUTPUT} $WD $MAIN_FOLDER
echo 'Todo ok con read_mapping' >> ../../log/debug
echo '$INS:' >> ../../log/debug
echo ${INS} >> ../../log/debug
echo '$WD:' >> ../../log/debug
echo ${WD} >> ../../log/debug
echo '$MAIN_FOLDER:' >> ../../log/debug
echo ${MAIN_FOLDER} >> ../../log/debug
echo '$OUTPUT:' >> ../../log/debug
echo ${OUTPUT} >> ../../log/debug
fi

















