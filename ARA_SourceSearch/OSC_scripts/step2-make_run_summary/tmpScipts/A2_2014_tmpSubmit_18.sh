#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0213/run002963/event002963.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002961.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0213/run002967/event002967.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002966.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0213/run002968/event002968.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002966.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0213/run002969/event002969.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002966.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0213/run002970/event002970.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002966.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0213/run002972/event002972.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002971.dat &
wait
