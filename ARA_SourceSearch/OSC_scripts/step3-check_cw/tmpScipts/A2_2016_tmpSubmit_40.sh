#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0302/run006960/event006960.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006956.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0302/run006962/event006962.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006961.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0303/run006963/event006963.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006961.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0303/run006964/event006964.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006961.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0303/run006965/event006965.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006961.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0303/run006967/event006967.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006966.dat &
wait
