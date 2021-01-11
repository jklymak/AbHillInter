#!/bin/sh -l
todo=Iso1kmlowU10Amp305f141B059Wall

one=$(qsub -N $todo -v "start=0, stop=259300, dt=50" runModelRestarts.sh)
two=$(qsub -N $todo -v "start=259200, stop=518500, dt=50"  -W depend=afterok:$one runModelRestarts.sh)
three=$(qsub -N $todo -v "start=518400, stop=777700, dt=50" -W depend=afterok:$two runModelRestarts.sh)
four=$(qsub -N $todo -v "start=777600, stop=907300, dt=50" -W depend=afterok:$three runModelRestarts.sh)

# should add archive step in here once we get going....
