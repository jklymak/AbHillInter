#!/bin/sh -l
todo=Iso3kmlowU10Amp305f141B059Patch

day=86400
dt=150

one=$(qsub -N $todo -v "start=0, stop=$((day*8)), dt=150" runModelRestarts.sh)
two=$(qsub -N $todo -v "start=$((day*8)), stop=$((day*16)), dt=150"  -W depend=afterok:$one runModelRestarts.sh)
three=$(qsub -N $todo -v "start=$((day*16)), stop=$((day*24)), dt=150" -W depend=afterok:$one:$two runModelRestarts.sh)
four=$(qsub -N $todo -v "start=$((day*24)), stop=$((day*32)), dt=150" -W depend=afterok:$one:$two:$three runModelRestarts.sh)

# should add archive step in here once we get going....
