#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1002/run006270/event006270.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006269.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1002/run006271/event006271.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006269.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1002/run006272/event006272.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006269.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1002/run006273/event006273.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006269.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1003/run006275/event006275.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006274.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1003/run006276/event006276.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006274.dat &
wait
