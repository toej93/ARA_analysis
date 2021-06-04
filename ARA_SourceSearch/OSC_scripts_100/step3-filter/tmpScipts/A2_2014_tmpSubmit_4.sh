#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0106/run002849/event002849.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002847.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0107/run002850/event002850.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002847.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0107/run002851/event002851.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002847.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0107/run002853/event002853.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002852.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0108/run002858/event002858.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002857.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0108/run002859/event002859.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002857.dat &
wait
