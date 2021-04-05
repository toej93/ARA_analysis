#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1025/run004313/event004313.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004310.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1025/run004314/event004314.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004310.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1025/run004424/event004424.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004420.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1025/run004426/event004426.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004425.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1025/run004427/event004427.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004425.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1025/run004428/event004428.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004425.dat &
wait
