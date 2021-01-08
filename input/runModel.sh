#!/bin/sh -l
#PBS -m be
#PBS -M jklymak@gmail.com
#PBS -l select=1:ncpus=48:mpiprocs=48
#PBS -l walltime=07:20:00
#PBS -q standard
#PBS -A ONRDC35552400
#PBS -j oe
#PBS -N ${JOBNAME}

# qsub -N LW1kmlowU10Amp305K18 runModel.sh

# . $MODULESHOME/modules.sh
module swap mpt compiler/intelmpi

cd $PBS_O_WORKDIR
# top=$1  Passed as qsub  -v top=h60h27f20 runModel.sh

PARENT=AbHillInter

top=${PBS_JOBNAME}
results=${WORKDIR}/${PARENT}/
outdir=$results$top

# These should already be copied
# cp data $outdir/input
#cp eedata $outdir/_Model/input
#cp dataRestart $outdir/_Model/input/data
#cp ../build/mitgcmuv $outdir/_Model/build

#printf "Copying to archive"
#rm -rf ../archive/$top
#cp -r $outdir/_Model/ ../archive/$top
#rm -rf ../archive/$top/indata/*

cd $outdir/input
pwd

ls -al ../build/mitgcmuv
printf "Starting: $outdir\n"
mpirun -np 48 ../build/mitgcmuv > mit.out
