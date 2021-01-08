# AbHillParam runs but with isolated roughness

##  MITGCM version

The version I'll use is the `btforcing` branch of my own fork.  https://github.com/jklymak/MITgcm/


## Runs: koehr

- Iso1kmlowU10Amp305f141B059Base:
  - base run, u ro east, beta plane
- Iso1kmlowU10Amp305f141B000Base:
  - no beta

### Todo:
- Wall on north side.
- U = -0.1



## Contents:

  - `input` is where most model setup occurs.
  - `python` is where most processing occurs.

## Vagaries

   - Need `miniconda3` on the path!

## To compile on onyx

  - `module load cray-mpich`
  - `cd build/`
  - `../../MITgcm/tools/genmake2 -optfile=../build_options/onyx -mods=../code/ -rootdir=../../MITgcm -mpi`
  - `make depend`.  This will have some errors near the end about not being able to find source files for `module netcdf`.  This error is annoying but doesn't affect compile.
  - `make`

## To run

  - run `python gendata.py`
  - run `qsub -N jobname runModel.sh`
