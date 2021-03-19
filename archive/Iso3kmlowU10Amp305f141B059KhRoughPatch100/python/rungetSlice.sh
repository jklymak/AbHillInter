#!/bin/bash
#SBATCH --account=def-jklymak
#SBATCH --mail-user=jklymak@gmail.com
#SBATCH --mail-type=ALL
#SBATCH --ntasks-per-node=1
#SBATCH --time=0-00:05
#SBATCH --mem=16G

source ~/venvs/AbHillInter/bin/activate

PARENT=AbHillInter
cd $PROJECT/jklymak/$PARENT/python
pwd

python getSlice.py
rsync -av ../reduceddata/ pender.seos.uvic.ca:AbHillInterAnalysis/reduceddata
