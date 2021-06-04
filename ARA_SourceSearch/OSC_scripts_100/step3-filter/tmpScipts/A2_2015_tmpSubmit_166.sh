#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0910/run006163/event006163.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006159.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0910/run006165/event006165.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006164.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0911/run006169/event006169.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006164.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0911/run006170/event006170.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006164.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0912/run006171/event006171.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006164.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0912/run006172/event006172.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006164.dat &
wait
