#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0623/run007486/event007486.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007482.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0624/run007488/event007488.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007487.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0624/run007489/event007489.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007487.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0624/run007490/event007490.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007487.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0625/run007491/event007491.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007487.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0625/run007493/event007493.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007492.dat &
wait
