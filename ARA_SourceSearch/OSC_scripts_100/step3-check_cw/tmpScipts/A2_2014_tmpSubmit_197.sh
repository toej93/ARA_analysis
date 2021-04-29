#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1101/run004463/event004463.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004460.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1102/run004464/event004464.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004460.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1102/run004466/event004466.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004465.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1102/run004467/event004467.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004465.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1102/run004468/event004468.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004465.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1103/run004469/event004469.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004465.dat &
wait
