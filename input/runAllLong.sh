#!/bin/bash -l
todo=Iso3kmlowU10N10Amp305f141B000AllRough

day=86400
dt=60

jobid=$(sbatch -J $todo --export=start=0,stop=$((day*6 + 180)),dt=$dt runModelRestartsLong.sh)
#echo $jobid
jobid1=$(sbatch  -J $todo  --dependency=afterok:${jobid##* } --export=start=$((day*6)),stop=$((day*12 + 180)),dt=$dt runModelRestartsLong.sh)
#jobid2=$(sbatch  -J $todo --dependency=afterok:${jobid1##* } --export=start=$((day*12)),stop=$((day*18 + 180)),dt=180 runModelRestarts.sh)
#jobid3=$(sbatch  -J $todo --dependency=afterok:${jobid2##* } --export=start=$((day*18)),stop=$((day*24 + 180)),dt=180 runModelRestarts.sh)
#jobid4=$(sbatch  -J $todo --dependency=afterok:${jobid3##* } --export=start=$((day*24)),stop=$((day*30 + 180)),dt=180 runModelRestarts.sh)
#jobid5=$(sbatch  -J $todo --dependency=afterok:${jobid4##* } --export=start=$((day*30)),stop=$((day*36 + 180)),dt=180 runModelRestarts.sh)
jobidEnd=$(sbatch  -J $todo --dependency=afterok:${jobid1##* }  ../python/rungetWorkMean.sh)

# should add archive step in here once we get going....