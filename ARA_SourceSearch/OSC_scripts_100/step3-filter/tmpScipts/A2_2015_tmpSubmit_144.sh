#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0807/run005991/event005991.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005988.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0807/run005992/event005992.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005988.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0807/run005994/event005994.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005993.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0807/run005995/event005995.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005993.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0808/run005996/event005996.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005993.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0808/run005997/event005997.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005993.dat &
wait
