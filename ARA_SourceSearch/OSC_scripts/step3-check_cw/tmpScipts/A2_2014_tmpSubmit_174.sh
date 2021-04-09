#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1008/run004341/event004341.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004340.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1008/run004342/event004342.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004340.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1008/run004343/event004343.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004340.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1008/run004344/event004344.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004340.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1009/run004346/event004346.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004345.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1009/run004347/event004347.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004345.dat &
wait
