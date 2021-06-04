#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0328/run003336/event003336.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003334.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0329/run003341/event003341.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003334.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0329/run003342/event003342.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003334.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0329/run003343/event003343.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003334.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0330/run003344/event003344.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003334.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0330/run003345/event003345.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003334.dat &
wait
