#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0228/run003116/event003116.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003112.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0228/run003118/event003118.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003117.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0301/run003119/event003119.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003117.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0301/run003120/event003120.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003117.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0301/run003121/event003121.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003117.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0301/run003123/event003123.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003122.dat &
wait
