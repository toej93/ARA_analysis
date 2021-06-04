#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0105/run002840/event002840.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002837.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0105/run002843/event002843.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002842.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0105/run002844/event002844.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002842.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0106/run002845/event002845.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002842.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0106/run002846/event002846.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002842.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0106/run002848/event002848.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002847.dat &
wait
date 
