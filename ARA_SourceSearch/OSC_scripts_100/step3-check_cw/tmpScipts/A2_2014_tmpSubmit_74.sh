#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0420/run003447/event003447.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003446.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0420/run003448/event003448.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003446.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0420/run003449/event003449.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003446.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0420/run003450/event003450.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003446.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0421/run003452/event003452.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003451.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0421/run003453/event003453.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003451.dat &
wait