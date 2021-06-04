#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0131/run002979/event002979.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002976.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0131/run002980/event002980.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002976.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0201/run002982/event002982.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002981.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0201/run002983/event002983.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002981.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0201/run002984/event002984.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002981.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0202/run002987/event002987.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002981.dat &
wait
