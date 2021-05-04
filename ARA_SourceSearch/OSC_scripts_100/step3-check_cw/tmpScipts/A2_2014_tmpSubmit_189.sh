#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1025/run004431/event004431.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004430.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1026/run004429/event004429.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004425.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1026/run004432/event004432.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004430.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1026/run004433/event004433.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004430.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1027/run004434/event004434.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004430.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1027/run004436/event004436.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004435.dat &
wait