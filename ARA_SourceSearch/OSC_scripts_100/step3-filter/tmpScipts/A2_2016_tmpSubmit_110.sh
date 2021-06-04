#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0719/run007613/event007613.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007611.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0719/run007614/event007614.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007611.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0720/run007616/event007616.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007611.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0720/run007617/event007617.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007611.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0720/run007618/event007618.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007611.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0720/run007619/event007619.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007611.dat &
wait
