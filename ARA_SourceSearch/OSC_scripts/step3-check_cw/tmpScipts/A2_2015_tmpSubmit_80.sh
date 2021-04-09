#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0327/run005330/event005330.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005328.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0328/run005331/event005331.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005328.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0328/run005332/event005332.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005328.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0328/run005334/event005334.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005333.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0328/run005335/event005335.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005333.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0329/run005336/event005336.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005333.dat &
wait
