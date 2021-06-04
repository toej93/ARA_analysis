#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0803/run007746/event007746.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007745.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0803/run007747/event007747.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007745.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0803/run007748/event007748.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007745.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0804/run007749/event007749.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007745.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0804/run007751/event007751.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007750.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0804/run007752/event007752.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007750.dat &
wait
