#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0902/run004131/event004131.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004128.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0903/run004129/event004129.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004128.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0903/run004139/event004139.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004138.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0904/run004110/event004110.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004108.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0904/run004116/event004116.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004113.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0905/run004117/event004117.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004113.dat &
wait
