#!/bin/bash
#SBATCH --account=def-jklymak
#SBATCH --mail-user=jklymak@gmail.com
#SBATCH --mail-type=ALL
#SBATCH --ntasks-per-node=1
#SBATCH --time=0-00:05
#SBATCH --mem=32G

source ~/venvs/AbHillInter2/bin/activate

PARENT=AbHillInter
cd $PROJECT/jklymak/$PARENT/python
pwd
todo=${SLURM_JOB_NAME}

# python getWork.py $todo
python getMeanVel.py $todo
rsync -av ../reduceddata/ pender.seos.uvic.ca:AbHillInterAnalysis/reduceddata
