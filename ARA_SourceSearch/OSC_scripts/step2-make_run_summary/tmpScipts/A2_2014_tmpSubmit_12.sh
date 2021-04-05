#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0211/run002863/event002863.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002862.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0211/run002864/event002864.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002862.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0211/run002865/event002865.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002862.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0211/run002868/event002868.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002862.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0211/run002869/event002869.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002862.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0211/run002870/event002870.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002862.dat &
wait
