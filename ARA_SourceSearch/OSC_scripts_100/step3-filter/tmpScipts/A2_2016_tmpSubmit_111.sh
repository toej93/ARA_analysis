#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0721/run007620/event007620.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007611.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0721/run007624/event007624.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007621.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0722/run007687/event007687.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007621.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0722/run007688/event007688.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007621.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0723/run007690/event007690.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007689.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0723/run007691/event007691.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007689.dat &
wait
