#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0528/run007328/event007328.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007326.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0528/run007329/event007329.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007326.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0529/run007330/event007330.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007326.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0529/run007331/event007331.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007326.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0529/run007332/event007332.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007326.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0529/run007333/event007333.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007326.dat &
wait
