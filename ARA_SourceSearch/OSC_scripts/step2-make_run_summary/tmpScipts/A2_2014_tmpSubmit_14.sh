#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0211/run002934/event002934.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002917.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0211/run002935/event002935.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002917.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0211/run002937/event002937.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002936.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0211/run002938/event002938.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002936.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0211/run003032/event003032.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003031.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0211/run003033/event003033.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003031.dat &
wait
