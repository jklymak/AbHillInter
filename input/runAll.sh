
#!/bin/sh -l
todo=Iso3kmlowU10Amp305f141B059Patch100

day=86400
dt=150

one=$(qsub -N $todo -v "start=0, stop=$((day*8 + 100)), dt=150" runModelRestarts.sh)
two=$(qsub -N $todo -v "start=$((day*6)), stop=$((day*12 + 100)), dt=150" -W depend=afterok:$one runModelRestarts.sh)
three=$(qsub -N $todo -v "start=$((day*12)), stop=$((day*18 + 100)), dt=150" -W depend=afterok:$one:$two runModelRestarts.sh)
four=$(qsub -N $todo -v "start=$((day*18)), stop=$((day*24 + 100)), dt=150" -W depend=afterok:$one:$two:$three runModelRestarts.sh)
five=$(qsub -N $todo -v "start=$((day*24)), stop=$((day*30 + 100)), dt=150" -W depend=afterok:$one:$two:$three:$four runModelRestarts.sh)
six=$(qsub -N $todo -v "start=$((day*30)), stop=$((day*36 + 100)), dt=150" -W depend=afterok:$one:$two:$three:$four:$five runModelRestarts.sh)

# should add archive step in here once we get going....
