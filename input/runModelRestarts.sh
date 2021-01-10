#!/bin/sh -l
#PBS -m be
#PBS -M jklymak@gmail.com
#PBS -l select=1:ncpus=48:mpiprocs=48
#PBS -l walltime=02:40:00
#PBS -q background
#PBS -A ONRDC35552400
#PBS -j oe
#PBS -N ${JOBNAME}

# run from runAll.sh  start and stop come from -v arguments.

module swap mpt compiler/intelmpi

cd $PBS_O_WORKDIR

PARENT=AbHillInter
top=${PBS_JOBNAME}
results=${WORKDIR}/${PARENT}/
outdir=$results$top

cd $outdir/input
pwd
ls -al ../build/mitgcmuv

python moddata.py --startTime=$start --endTime=$stop --deltaT=$dt

printf "Starting: $outdir\n"
mpirun -np 48 ../build/mitgcmuv > mit.out
