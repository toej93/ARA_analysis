#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0616/run005736/event005736.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005733.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0616/run005737/event005737.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005733.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0617/run005739/event005739.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005738.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0617/run005740/event005740.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005738.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0617/run005741/event005741.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005738.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0617/run005742/event005742.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005738.dat &
wait
